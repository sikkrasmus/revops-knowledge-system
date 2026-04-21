---
type: meta
title: Functions
description: Function-specific content directories. Shared components in shared/ feed every function.
owner: rasmus@latentflows.com
reviewers:
  - revops-lead
last_reviewed: 2026-04-21
verified_until: 2026-10-21
---

# Functions

Function-specific content. Each function consumes from [`../shared/`](../shared/) and adds methodology, playbooks, frameworks, and plays particular to that function.

---

## What ships in this directory

| Directory | Status |
|---|---|
| [`sales/`](sales/) | Filled end to end. The worked function. |
| [`FUTURE-FUNCTIONS.md`](FUTURE-FUNCTIONS.md) | Marketing, customer success, support, RevOps, finance and legal. What each would cover when filled, plus the fill pattern. |

The five future functions ship as one consolidated page rather than five empty scaffolds. The fill pattern is identical across functions: copy [`sales/`](sales/), follow the [authoring contract](../schema/authoring-contract.md), cite shared components.

---

## Common skeleton

Every function follows the same shape.

```
functions/<function>/
├── README.md                 # what the function owns, consumes, publishes
├── methodology/              # framework(s) the function operates under
├── playbooks/                # by scenario (deal stage, campaign type, renewal motion)
├── frameworks/               # decision frameworks
├── tools-and-stack/          # the curated tool landscape for this function
├── templates/                # page templates specific to this function
└── plays/                    # specific repeatable plays
```

Not every subdirectory is required on day one. The minimum viable function is `methodology/` plus `playbooks/`.

---

## Authoring contract for functions

Function-specific content follows the same [`../schema/authoring-contract.md`](../schema/authoring-contract.md) as the shared spine. Function pages:

- Have frontmatter with `type` matching one of the function-specific enums (`playbook`, `methodology`, `framework`, `play`, `function-readme`, plus sales-specific types in `schema/enums.yaml`).
- Cite shared components where they depend on them (`ci graph` enumerates).
- Follow graduated-trust governance per [`../ingestion/pr-workflow.md`](../ingestion/pr-workflow.md).

---

## Why one filled function is enough

Scope discipline. The framework is proven once one function is filled end to end with citations into the shared spine. Filling more functions for visual completeness is filler. Adopters fill the functions their motion needs and leave the rest as scaffolds.

---

## Related

- [`../shared/`](../shared/), the seven co-authored components every function reads from.
- [`../docs/03-IMPLEMENTATION.md`](../docs/03-IMPLEMENTATION.md), suggested rollout plan and the eight hard parts.
- [`FUTURE-FUNCTIONS.md`](FUTURE-FUNCTIONS.md), what marketing, CS, support, RevOps, and finance/legal would cover when filled.
