---
name: kurthd-principles
description: "Use when working on software projects for Doug Kurth and the task would benefit from his reusable engineering preferences: pragmatic simplicity, inspectable systems, type-aware modeling, reviewable changes, intentional error handling, lightweight architecture, evolutionary design, and avoiding unnecessary complexity or premature optimization."
---

# Kurthd Principles

Use this skill as a reusable engineering lens across projects. Treat repo-local instructions as authoritative when they
are more specific, but let these principles shape default decisions when details are open.

## Core Taste

- Prefer pragmatic, understandable solutions over clever or highly abstract ones.
- Choose the simplest design that handles the real requirement in front of you.
- Avoid premature optimization, broad frameworks, and speculative infrastructure until the code has shown a concrete
  need.
- Keep systems inspectable by humans and agents. Prefer boring formats, explicit state, clear names, and reviewable
  changes.
- Preserve optionality by keeping boundaries clear, data recoverable, and decisions easy to revise.
- Build incrementally. Make the next useful step solid before designing the eventual complete system.

## Simplicity With Room To Evolve

Simplicity does not mean painting the system into a corner. Prefer designs that are small now but can grow by adding
well-named pieces later.

Default patterns:

- Start with concrete domain concepts rather than generic abstractions.
- Keep contracts narrow and explicit.
- Separate concerns that have different sources of truth, lifecycles, or failure modes.
- Introduce abstractions only when they remove real duplication, clarify a domain concept, or make a likely change
  easier.
- Prefer local composition over global machinery.
- Make broad scans, expensive work, network calls, concurrency, retries, and background orchestration explicit.
- Defer distribution, queues, microservices, and complex orchestration until simpler workers, commands, or jobs are
  clearly insufficient.

When deciding whether to add complexity, ask:

- What current requirement does this serve?
- What future change does this keep open?
- Can the same optionality be preserved with a smaller boundary, type, file, command, or convention?
- Will a future maintainer know where to change this without reading the whole system?

## Modeling

- Model the domain directly. Prefer names that describe the user's actual concepts, not implementation mechanics.
- Use practical type safety where it clarifies intent: enums, sealed types, value classes, structured config, and
  explicit nullable or optional values.
- Avoid raw strings for concepts with a constrained meaning.
- Keep adjacent concepts crisp. Do not merge representations just because they share fields.
- Preserve source truth and provenance when deriving, transforming, summarizing, or compiling data.
- Prefer stable identifiers, timestamps, checksums, source URLs, revisions, and metadata that make behavior debuggable
  and recoverable.

## Architecture

- Favor small composable components over one large opaque pipeline.
- Make boundaries follow real responsibilities: adapters fetch, normalizers transform, stores persist, validators
  check, compilers synthesize, and CLIs or jobs orchestrate.
- Let simple synchronous or batch workflows exist before introducing live systems.
- Use familiar architecture terms such as services, adapters, repositories, stores, and controllers when they fit;
  do not force a pattern where a plain function or small module is clearer.
- Keep the straightforward path easy to follow.

## Cohesion And Coupling

Aim for components, classes, functions, and modules that have a clear reason to
change. Watch for pieces that mix unrelated concerns, coordinate too many
responsibilities, or require broad edits for narrow behavior changes.

Coupling is not inherently bad. A working system needs connections between
parts. The risk to manage is overly tight coupling: places where independent
concepts, workflows, or failure modes become difficult to change, test, or
reason about separately.

Default patterns:

- Keep closely related behavior together when it improves readability and
  local reasoning.
- Separate concerns that change for different reasons, especially business
  rules, IO, persistence, external integrations, and orchestration.
- Prefer boundaries that let common behavior changes happen through targeted
  edits instead of sweeping system changes.
- Keep significant deterministic business logic testable without requiring
  network calls, databases, file systems, clocks, or unrelated services.
- Isolate IO and external-system details at the edges when practical.
- Avoid splitting code so finely that the flow becomes harder to understand
  than the problem being solved.

## Code Style

- Write code for reviewability first. Clear is better than compact.
- Prefer pure functions for deterministic transformations.
- Use imperative code when it makes IO, orchestration, and control flow easier to understand.
- Extract helpers when they improve naming, readability, or testability.
- Avoid helper extraction that only hides a few obvious lines.
- Add light comments around non-trivial decisions or algorithms, not comments that restate the code.

## Error Handling

- Handle errors intentionally. Do not silently ignore failures.
- Use exceptions for programming errors, violated preconditions, or invariants that indicate a bug.
- Use typed results, nullable values, sealed classes, or enums for expected local failure cases callers should handle.
- Keep `try` / `catch` blocks narrow.
- Centralize handling for IO, network, storage, and external-system failures at the appropriate boundary.
- Preserve enough context in errors and logs to debug the source, operation, identifier, and failure mode.

## Dependencies

- Keep dependencies purposeful.
- Prefer mature, well-supported libraries over immature niche packages.
- Prefer stable releases unless there is a concrete reason to use a preview.
- Before adding a dependency, check the current primary source for the latest stable version.
- Do not add a framework before the code has shown a need for the framework.

## Tests And Validation

- Add tests with new behavior when the risk justifies it.
- Test deterministic transformation logic directly.
- Test adapters and integrations against realistic source shapes where practical.
- Treat provenance, freshness, identifiers, and recoverability as correctness properties when the project depends on
  them.
- Validate structured artifacts structurally, not only textually.
- Re-run focused tests after meaningful changes; run broader suites when the blast radius is broad.

## Documentation

- Update docs when behavior, structure, or conventions materially change.
- Prefer living documentation that describes the current system shape or active design intent.
- Avoid accumulating stale roadmaps, task lists, and project-management artifacts in the repository.
- Refactor docs like code when their scope changes.

## Agent Workflow

Before changing code:

- Read the relevant repo docs and local instructions.
- Look for existing schemas, conventions, and naming patterns.
- Prefer extending a current concept over duplicating an adjacent one.

When making changes:

- Keep edits targeted and reviewable.
- State assumptions when choosing among plausible designs.
- Prefer the design that is easier to inspect, test, and revise.
- If a change adds machinery, explain why the current simpler approach is no longer enough.
