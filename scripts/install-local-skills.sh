#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'USAGE'
Usage: scripts/install-local-skills.sh [--dest PATH] [--dry-run]

Install or update every skill under this repo's skills/ directory for local use.

Options:
  --dest PATH   Destination skills directory. Defaults to ~/.agents/skills.
  --dry-run     Print what would be installed without changing files.
  -h, --help    Show this help.
USAGE
}

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
repo_root="$(cd "$script_dir/.." && pwd)"
source_dir="$repo_root/skills"
dest_dir="${KURTHD_SKILLS_DEST:-$HOME/.agents/skills}"
dry_run=0

while [[ $# -gt 0 ]]; do
  case "$1" in
    --dest)
      if [[ $# -lt 2 ]]; then
        echo "error: --dest requires a path" >&2
        exit 2
      fi
      dest_dir="$2"
      shift 2
      ;;
    --dry-run)
      dry_run=1
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "error: unknown option: $1" >&2
      usage >&2
      exit 2
      ;;
  esac
done

if [[ ! -d "$source_dir" ]]; then
  echo "error: skills directory not found: $source_dir" >&2
  exit 1
fi

skill_dirs=()
while IFS= read -r -d '' skill_dir; do
  skill_dirs+=("$skill_dir")
done < <(find "$source_dir" -mindepth 1 -maxdepth 1 -type d -print0 | sort -z)

if [[ ${#skill_dirs[@]} -eq 0 ]]; then
  echo "No skills found under $source_dir"
  exit 0
fi

echo "Installing skills from $source_dir"
echo "Destination: $dest_dir"

if [[ "$dry_run" -eq 0 ]]; then
  mkdir -p "$dest_dir"
fi

for skill_dir in "${skill_dirs[@]}"; do
  skill_name="$(basename "$skill_dir")"
  skill_file="$skill_dir/SKILL.md"
  installed_dir="$dest_dir/$skill_name"

  if [[ ! -f "$skill_file" ]]; then
    echo "error: missing SKILL.md for $skill_name" >&2
    exit 1
  fi

  declared_name="$(awk -F': *' '/^name:/ { print $2; exit }' "$skill_file" | tr -d '"')"
  if [[ "$declared_name" != "$skill_name" ]]; then
    echo "error: $skill_file declares name '$declared_name', expected '$skill_name'" >&2
    exit 1
  fi

  if [[ "$dry_run" -eq 1 ]]; then
    echo "Would install $skill_name -> $installed_dir"
    continue
  fi

  tmp_dir="$dest_dir/.${skill_name}.tmp.$$"
  rm -rf "$tmp_dir"
  mkdir -p "$tmp_dir"
  cp -R "$skill_dir/." "$tmp_dir/"
  rm -rf "$installed_dir"
  mv "$tmp_dir" "$installed_dir"
  echo "Installed $skill_name"
done

echo "Done. Restart Codex to pick up changed skills."
