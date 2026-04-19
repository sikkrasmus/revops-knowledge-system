---
type: meta
title: Functions
description: Function-specific content directories. Shared components in shared/ feed every function.
owner: rasmus@unfrankenstein.io
last_reviewed: 2026-04-19
---

# Functions

Function-specific content. Each function directory consumes from [`../shared/`](../shared/) and adds methodology, playbooks, frameworks, and plays particular to that function.

---

## Function directories

| Directory | Phase | Status |
|---|---|---|
| [`sales/`](sales/) | Phase 1 | Scaffold in Phase 0; content filled in Phase 1 |
| [`marketing/`](marketing/) | Phase 2 | Scaffold only |
| [`customer-success/`](customer-success/) | Phase 2 | Scaffold only |
| [`support/`](support/) | Phase 2 | Scaffold only |
| [`revops/`](revops/) | Phase 2 | Scaffold only |
| [`finance-legal/`](finance-legal/) | Phase 2 | Scaffold only |

Each directory's README states what it owns, what it consumes from `shared/`, and the planned structure.

## Common skeleton (per function)

```
functions/<function>/
├── README.md                    — what the function owns, consumes, and publishes
├── methodology/                 — framework(s) the function operates under
├── playbooks/                   — by scenario (deal stage, campaign type, renewal motion)
├── frameworks/                  — decision frameworks
├── tools-and-stack/             — the curated tool landscape for this function
├── templates/                   — page templates specific to this function
└── plays/                       — specific repeatable plays
```

Not every subdirectory is required on day one. The Phase 0 scaffold has only `README.md`; Phase 1 fills `sales/` to the full skeleton; Phase 2 fills the rest.

## Authoring contract for functions

Function-specific content follows the same [`../schema/authoring-contract.md`](../schema/authoring-contract.md) as the shared spine. Function pages:

- Have frontmatter with `type` matching one of the function-specific enums (`playbook`, `methodology`, `framework`, `play`, `function-readme`, plus sales-specific types in `schema/enums.yaml`).
- Cite shared components where they depend on them (`ci graph` enumerates).
- Follow graduated-trust governance per [`../ingestion/pr-workflow.md`](../ingestion/pr-workflow.md).

## Why not more function pages in Phase 0

Scope discipline. Phase 0 proves the framework. Phase 1 fills one function to the full pattern; Phase 2+ generalizes. Shipping scaffolds-only for all functions in Phase 0 forces the content to land as deliberate authorship, not speculative filler.

## Related

- [`../shared/`](../shared/) — co-authored components every function reads from
- [`../PHASES.md`](../PHASES.md) — full phase model
