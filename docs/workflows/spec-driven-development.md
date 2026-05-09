# Spec-Driven Development Conventions

These conventions describe a lightweight, repo-local documentation workflow for
AI-assisted software development. The goal is to keep useful intent close to the
code without turning the repository into a project management system.

Use these conventions as defaults. Individual repos can simplify, combine, or
extend them when the local context calls for it.

## Core Idea

Specs are living technical documents. They describe current behavior or
near-term target behavior at a level above code, tests, interfaces, and package
structure.

The default change loop is:

1. Update or create the relevant spec.
2. Implement the smallest coherent change.
3. Run focused tests.
4. Fix the spec, implementation, or tests until they agree.

Specs lead behavior. Tests check behavior. Code realizes behavior.

## What Belongs In The Repo

Repo-local documentation should focus on durable technical context:

- Principles and workflows that shape how the repo is changed.
- Architecture, tech stack, patterns, and conventions.
- Functional requirements and behavior specs.
- Agent-facing orientation that links to the above.

Repo-local documentation should usually avoid project management artifacts:

- Backlogs.
- Sprint plans.
- Status reports.
- Temporary task lists.
- Meeting notes.
- Speculative roadmaps.

Use external systems for priority, sequencing, ownership, status, and planning
history unless a repo explicitly chooses otherwise.

## Suggested Repo Shape

Start with this shape for repos that benefit from separate docs:

```text
AGENTS.md
docs/
  principles.md
  workflow.md
  architecture.md
  tech-stack.md
  patterns.md
  specs/
    <domain-or-feature>.md
```

For smaller repos, collapse aggressively:

```text
AGENTS.md
docs/
  engineering.md
  architecture.md
  specs.md
```

The structure is a reference schema, not a requirement. Prefer fewer documents
when fewer documents are easier to maintain.

## AGENTS.md Schema

`AGENTS.md` should orient agents and engineers, then route them to the right
documents. Keep it short.

Recommended sections:

```md
# Agent Guide

## Start Here

Brief repo purpose, primary app or package, and development posture.

## How To Work Here

- Read the relevant docs before broad changes.
- Update relevant specs when behavior changes.
- Run focused validation after meaningful edits.

## Key Docs

- Engineering principles:
- Development workflow:
- Architecture:
- Tech stack:
- Specs:

## Common Commands

- Test:
- Lint:
- Typecheck:
- Run locally:

## Repo-Specific Conventions

Short bullets only. Link out when details grow.
```

Optional sections:

- Deployment notes.
- Security or privacy notes.
- Generated-code guidance.
- External service or credential guidance.

Leave optional sections out until they are useful.

## Workflow Doc Schema

The workflow doc explains how changes are made in the repo.

Recommended sections:

```md
# Development Workflow

## Default Change Loop

## When To Update Specs

## When To Update Architecture Docs

## What Does Not Belong In Repo Docs
```

Optional sections:

- Release workflow.
- Review workflow.
- Branching or commit conventions.
- Incident or operational workflow.

Keep workflow docs focused on durable habits, not temporary process state.

## Spec Schema

Specs should be behavior-centered and intentionally boring.

Compact default:

```md
# <Feature Or Domain Name>

## Intent

## Behavior

## Rules

## Open Questions
```

Use the expanded form only when the feature or domain needs it:

```md
# <Feature Or Domain Name>

## Purpose

## Current Behavior

## Requirements

## User Or System Flows

## Rules And Constraints

## Edge Cases

## Interfaces

## Observability And Operations

## Open Questions

## Non-Goals
```

Most specs should not need every section. Prefer the smallest structure that
makes the expected behavior clear.

Good spec content:

- User-visible behavior.
- Domain rules and invariants.
- Integration contracts.
- Permission, lifecycle, and data-handling rules.
- Important edge cases.
- Open questions that affect implementation.
- Explicit non-goals when they prevent scope drift.

Avoid spec content that repeats code structure line by line. Code should remain
readable on its own.

## Architecture Doc Schema

Architecture docs should help readers navigate durable structure without
reverse-engineering the whole repo.

Recommended sections:

```md
# Architecture

## Overview

## Major Components

## Data Flow

## Boundaries

## Change Guidance
```

Optional sections:

- Runtime topology.
- Storage model.
- Integration map.
- Important decisions.
- Operational concerns.

Update architecture docs when module boundaries, storage shape, major
dependencies, runtime topology, or cross-cutting patterns materially change.

## Tech Stack Doc Schema

Use a tech stack doc when setup and tooling context would otherwise be scattered.

Recommended sections:

```md
# Tech Stack

## Languages And Runtimes

## Frameworks

## Storage

## Build And Tooling

## Testing

## Local Development
```

Optional sections:

- External services.
- Deployment.
- Generated code.
- Version management.

Small repos can fold this into `AGENTS.md` or `docs/engineering.md`.

## Patterns Doc Schema

Use a patterns doc when conventions are repeated often enough to be worth
documenting.

Common sections:

```md
# Patterns

## Error Handling

## Configuration

## Testing

## API Design

## Data Modeling

## Background Jobs

## Logging And Observability

## Naming Conventions
```

Only include sections that describe real repo conventions.

## Change Guidance For Agents

When making a code change:

1. Read `AGENTS.md`.
2. Read the relevant workflow, architecture, pattern, and spec docs.
3. Update the relevant spec before or alongside behavior changes.
4. Implement the smallest coherent change.
5. Run focused validation.
6. Reconcile docs, code, and tests before finishing.

If behavior changes and no spec exists, create a compact spec. If a doc would be
mostly empty or duplicative, leave it out and mention why in the final response.

## Maintenance Principles

- Prefer living docs over comprehensive docs.
- Prefer stable intent over historical narration.
- Prefer one spec per durable domain or feature area, not one spec per ticket.
- Split specs by domain boundary, not chronology.
- Remove stale open questions after they are answered.
- Treat disagreement between specs, tests, and code as something to resolve.
- Keep project planning and status outside the repo by default.
