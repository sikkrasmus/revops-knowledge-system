---
type: meta
title: Shared Spine
description: The seven co-authored-shared components every function reads from.
owner: rasmus@latentflows.com
reviewers:
  - revops-lead
last_reviewed: 2026-04-19
verified_until: 2026-10-19
---

# Shared Spine

The seven co-authored-shared components. Every function in `functions/` reads from this spine. Changes here have the highest blast radius — reviewer routing is strict.

---

## What "shared" means

The test for the spine: the same artifact is referenced as the **same object** by two or more functions. If Marketing's ICP and Sales's ICP are different documents, they aren't shared — they're two artifacts with a naming collision. The spine dissolves that collision.

Shared components are:

- **Multi-author** — no single function owns them outright.
- **Friction-generating when out of sync** — drift has cross-function consequences.
- **Referenced broadly** — cited by pages across multiple `functions/` directories.

"Authored-shared" (single author, many readers) content — legal/compliance posture, brand & voice, process-stage definitions — lives in function directories in Phase 0 or early Phase 1 and doesn't need this heavy review machinery.

## The seven components

| Component | Owner rotation | Co-authors | Consumers |
|---|---|---|---|
| [`icp/`](icp/) | RevOps lead | Sales lead, Marketing lead | Marketing, Sales, CS, Finance, Product |
| [`personas/`](personas/) | Sales lead | Marketing lead, CS lead | Marketing, Sales, CS, Product |
| [`product-and-packaging/`](product-and-packaging/) | Product lead | RevOps lead, Finance lead | All functions |
| [`pricing/`](pricing/) | RevOps lead | Finance lead, Sales lead | Sales, Finance, Legal, CS |
| [`positioning/`](positioning/) | Marketing lead | Sales lead, Product lead | Marketing, Sales, CS, Product |
| [`competitive-intel/`](competitive-intel/) | Marketing lead | Sales lead, Product lead | Marketing, Sales, CS, Product |
| [`data-definitions/`](data-definitions/) | RevOps lead | Finance lead | All functions |

## Review ownership

Each component directory has a `README.md` naming the owner (single-person accountability) and co-author roles. PRs touching any file in a directory route to the owner first, with the co-authors tagged as required reviewers for substantive changes.

See [`../ingestion/pr-workflow.md`](../ingestion/pr-workflow.md) for the full routing matrix.

## Change classes that always PR

No matter the maturity stage, these always require human review (per [`PRINCIPLES.md`](../PRINCIPLES.md) §6):

- **ICP definition changes** — shift target market
- **Pricing & discounting** — financial impact
- **Product & packaging changes** — downstream contract impact
- **Positioning & messaging** (strategic) — brand impact
- **New page creation** — schema evolves
- **Page deletion** — schema evolves
- **Any change flagged `source_drift: true` with large drift**

## Cross-references

Every page in this spine carries:

- A `consumers:` list in frontmatter (which functions read it)
- Explicit cross-links to other shared components it depends on
- Section labels for motion/segment variants where relevant (see [`../schema/section-labels.md`](../schema/section-labels.md))

`ci graph <slug>` enumerates inbound and outbound links for any page.

## When a function disagrees with the spine

1. Open an issue citing the specific claim and the divergent function evidence.
2. If the spine is wrong: owner opens a reconciliation PR.
3. If the function's use case is genuinely different: consider whether motion/segment section labels, a function-specific override in `functions/<name>/`, or a spine refinement is the right answer.
4. Never fork the spine silently by maintaining a duplicate in a function directory.

## Not in the spine (yet)

Components that might graduate to the spine later but don't justify the overhead today:

- **Legal / compliance posture** — authored-shared (Legal writes, all read). Lives in `functions/finance-legal/` in Phase 2.
- **Brand & voice** — authored-shared (Marketing writes, all read). Lives in `functions/marketing/` in Phase 2.
- **Customer segmentation rules** (beyond ICP tiers) — authored-shared (RevOps writes, all read). Lives in `functions/revops/` in Phase 2.
- **GTM process-stage definitions** — authored-shared (RevOps writes, all read). Lives in `functions/revops/` in Phase 2.

Graduation criteria: the artifact becomes multi-author-in-practice, or drift causes cross-function friction, or three or more functions start maintaining local copies. Until then, authored-shared is the cheaper model.

## Phase status

- **Phase 0** (this release): all seven components scaffolded with README, templates, and at least one abstract example. Not filled with synthetic-company specifics.
- **Phase 3**: synthetic-company instance fills the spine end-to-end.
- **In-production fork**: your fork fills the spine with your real ICP, pricing, personas, etc.
