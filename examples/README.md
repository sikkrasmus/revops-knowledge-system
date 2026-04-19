---
type: meta
title: Examples
description: Placeholder for the Phase 3 synthetic-company instance. Phase 0 ships abstract examples inside shared/.
owner: rasmus@unfrankenstein.io
last_reviewed: 2026-04-19
---

# Examples

The full worked synthetic-company example lives in Phase 3. Phase 0 ships abstract examples inside each `shared/*/` directory — enough to show the shape of each page type and frontmatter, not enough to ship a ready-to-fork instance.

---

## What's here in Phase 0

Nothing yet beyond this placeholder. See [`../shared/`](../shared/) for abstract examples of each component type.

## What ships in Phase 3

`examples/synthetic-company/` — a fully filled corpus against a specific archetype (e.g., "$25M ARR usage-billed B2B SaaS, hybrid PLG + sales-assisted") with:

- Every shared component filled with realistic (synthetic) data
- Every function populated with methodology, playbooks, and plays
- Synthetic sources in `examples/synthetic-company/sources/` demonstrating the source-storage model
- Real connector implementations (HubSpot, Gong, Confluence planned)

A reader will be able to fork `examples/synthetic-company/` as a starting template, swap in their own values, and be operational.

## Why deferred

Scope discipline. Phase 0 proves the framework. Phase 3 proves the instance. Mixing them would dilute both.

## Related

- [`../PHASES.md`](../PHASES.md) — full phase roadmap
- [`../shared/`](../shared/) — Phase 0 abstract examples inside each component
