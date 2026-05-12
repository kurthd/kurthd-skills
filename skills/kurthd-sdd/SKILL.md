---
name: kurthd-sdd
description: "Use when initializing, maintaining, or applying Doug Kurth's lightweight spec-driven development workflow in a repository: AGENTS.md orientation, repo-local technical docs, living markdown specs, compact documentation schemas, and the update spec -> implement -> test -> fix loop."
---

# Kurthd SDD

Use this skill when a repo needs lightweight spec-driven development conventions
or when a code change should follow those conventions.

The intent is practical alignment between specs, code, and tests. Do not turn
the repo into a project management archive.

## Core Workflow

For behavior changes, use this default loop:

1. Update or create the relevant spec.
2. Implement the smallest coherent change.
3. Run focused validation.
4. Fix the spec, implementation, or tests until they agree.

Specs lead behavior. Tests check behavior. Code realizes behavior.

## What Belongs In Repo Docs

Prefer repo-local docs for durable technical context:

- Agent orientation and links.
- Engineering principles and development workflow.
- Architecture, tech stack, patterns, and conventions.
- Functional requirements and behavior specs.

Avoid adding project management state by default:

- Backlogs.
- Sprint plans.
- Status reports.
- Temporary task lists.
- Meeting notes.
- Speculative roadmaps.

Use external systems for priority, sequencing, ownership, status, and planning
history unless the user explicitly asks for repo-local project management docs.

## Applying In An Existing Repo

Before editing docs or code:

1. Read `AGENTS.md` if present.
2. Inspect existing docs under `docs/` or equivalent paths.
3. Preserve local conventions when they are clear.
4. Prefer extending or simplifying existing docs over creating parallel docs.
5. Use compact schemas unless the repo has enough complexity to justify more.

When behavior changes:

- Update the relevant spec before or alongside implementation.
- Create a compact spec if behavior changes and no useful spec exists.
- Update architecture or pattern docs only when durable structure or conventions
  materially change.
- Keep docs one layer above code; do not repeat implementation details line by
  line.

## Aligning Existing Repo Docs

When asked to bring an existing repo's docs in line with these conventions,
treat the work as editorial and architectural alignment, not mechanical
template application.

Prefer a two-pass workflow unless the repo is very small or the requested change
is obviously safe.

Pass 1: inventory and recommend.

1. Find existing docs: `AGENTS.md`, `README.md`, `docs/`, specs, requirements,
   ADRs, runbooks, architecture notes, and planning docs.
2. Classify each document:
   - agent orientation
   - workflow or principles
   - architecture, tech stack, or patterns
   - functional spec
   - operational runbook
   - project management, status, or history
   - stale, duplicate, or unclear
3. Identify what to keep, rename, move, merge, split, or leave alone.
4. Propose the smallest target structure that improves navigation and future
   maintenance.
5. Ask before deleting, archiving, or heavily rewriting substantial docs.

Pass 2: apply the agreed changes.

- Preserve useful local context and repo-specific language.
- Create or update `AGENTS.md` as the routing layer.
- Create or update local spec guidance, usually `docs/specs/README.md` or the
  equivalent repo-local docs entry, so future specs know the expected compact
  shape.
- Move durable behavioral intent into specs.
- Move durable structural guidance into architecture, tech stack, or pattern
  docs.
- Convert useful decisions from planning docs into current guidance when still
  true.
- Remove or relocate stale status, backlog, and planning history only when the
  user has approved that cleanup.
- Prefer compact docs with omitted sections over filled-out templates.

If a repo already has a good documentation system, align with it instead of
renaming everything to match these examples. Even then, make sure the repo has
some discoverable local guidance for how specs should be structured.

## Initializing A Repo

When asked to initialize a repo with these conventions, inspect the repo first
and create the smallest useful structure.

Default structure for repos that benefit from separate docs:

```text
AGENTS.md
docs/
  workflow.md
  architecture.md
  specs/
    README.md
```

For smaller repos, collapse aggressively:

```text
AGENTS.md
docs/
  engineering.md
  specs.md
```

Only add `docs/tech-stack.md`, `docs/patterns.md`, or `docs/principles.md` when
they contain real repo-specific guidance. A generated empty placeholder is worse
than no file.

Do not copy the full canonical convention document into target repos by default.
Instead, create concise repo-local workflow and spec guidance that records the
local adoption of the convention and any repo-specific deviations.

At minimum, the repo should document the compact spec shape somewhere agents can
find it, usually in `docs/specs/README.md`:

```md
# Specs

Specs describe durable behavior, domain rules, and important constraints.

Use this compact shape by default:

## Intent

## Behavior

## Rules

## Open Questions

Add sections like Interfaces, Edge Cases, Observability, or Non-Goals only when
useful.
```

## Compact Schemas

Use these as starting points, not required forms.

`AGENTS.md`:

```md
# Agent Guide

## Start Here

## How To Work Here

## Key Docs

## Common Commands

## Repo-Specific Conventions
```

Spec:

```md
# <Feature Or Domain Name>

## Intent

## Behavior

## Rules

## Open Questions
```

Architecture:

```md
# Architecture

## Overview

## Major Components

## Data Flow

## Boundaries

## Change Guidance
```

Workflow:

```md
# Development Workflow

## Default Change Loop

## When To Update Specs

## When To Update Architecture Docs

## What Does Not Belong In Repo Docs
```

Leave sections out when they are not useful. Add optional sections such as
Interfaces, Edge Cases, Observability, Non-Goals, Deployment, or Security only
when the repo needs them.

## Maintenance Rules

- Prefer living docs over comprehensive docs.
- Prefer stable intent over historical narration.
- Prefer one spec per durable domain or feature area, not one spec per ticket.
- Split specs by domain boundary, not chronology.
- Remove stale open questions after they are answered.
- Treat disagreement between specs, tests, and code as something to resolve.
- Mention intentionally omitted docs in the final response when that choice is
  relevant.
