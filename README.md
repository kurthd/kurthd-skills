# kurthd-skills

Personal skills and documentation for AI-driven software development workflows.

## Skills

Skills in this repo use the `kurthd-` prefix so they are easy to identify and
avoid collisions with shared or third-party skills.

- `kurthd-principles`: Doug Kurth's general engineering preferences and values.
- `kurthd-sdd`: Lightweight spec-driven development workflow for repo docs,
  specs, and agent guidance.

## Workflow Docs

- [Spec-driven development conventions](docs/workflows/spec-driven-development.md)

## Local Install

Install or update all skills from this repo for local use:

```sh
scripts/install-local-skills.sh
```

By default this installs into `~/.agents/skills`, matching the local custom skill
location used on this machine. Use `--dest <path>` to install somewhere else, or
`--dry-run` to preview the work.
