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

Every function in a B2B company runs on its own methodology, tooling, and internals. A subset of artifacts gets read by two or more functions as the same object. That subset is the spine.

Changes here have the highest blast radius in the corpus, so reviewer routing is strict.

---

## What "shared" means

The test for the spine: the same artifact is referenced as the **same object** by two or more functions. If Marketing's ICP and Sales's ICP are separate documents, the spine hasn't formed yet. They are two artifacts with a naming collision. The spine dissolves that collision.

Shared components have three properties:

- **Multi-author.** No single function owns them outright.
- **Friction-generating when out of sync.** Drift has cross-function consequences.
- **Referenced broadly.** Cited by pages across multiple `functions/` directories.

Content that one function authors and many read (legal posture, brand voice, process-stage definitions) is "authored-shared." It lives in the owning function's directory and skips this review machinery until it starts creating cross-function friction.

## The contents of your spine are your choice

The test above is binding. The specific list of components is not. A fork decides its own spine based on where multi-author artifacts and cross-function friction actually sit in its business.

Different shapes land on different spines:

- **Devtools or PLG-only.** Personas may collapse into a single power-user profile. Activation-metric definitions in data-definitions carry more weight. Developer-relations or community content often graduates into the spine.
- **Vertical SaaS in regulated industries.** Regulatory and compliance posture becomes spine-worthy rather than authored-shared. Customer-reference management usually does too.
- **OSS-sponsored commercial.** Open-source community boundaries and commercial-edition definitions become spine components with their own ownership rotations.
- **Multi-product portfolio.** Product-and-packaging splits per product. A portfolio-level positioning component may sit above per-product positioning.

Add, rename, or subtract from the instance below to fit the shape of your business. This repo is a framework, not a turnkey product.

## Example instance: B2B SaaS sales-assisted, $10 to $100M ARR

The seven components below are what a sales-assisted B2B SaaS company in this ARR band tends to pull into its spine. This repo fills them in as an illustration of how the schema, ownership rotation, and change-class machinery hang together end to end. A different company shape lands on a different list.

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

- **ICP definition changes.** Shift target market.
- **Pricing and discounting.** Financial impact.
- **Product and packaging changes.** Downstream contract impact.
- **Positioning and messaging** (strategic). Brand impact.
- **New page creation.** Schema evolves.
- **Page deletion.** Schema evolves.
- **Any change flagged `source_drift: true` with large drift.**

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

- **Legal and compliance posture.** Authored-shared (Legal writes, all read). Lives in the finance and legal function (described in [`../functions/FUTURE-FUNCTIONS.md`](../functions/FUTURE-FUNCTIONS.md)).
- **Brand and voice.** Authored-shared (Marketing writes, all read). Lives in the marketing function.
- **Customer segmentation rules** (beyond ICP tiers). Authored-shared (RevOps writes, all read). Lives in the RevOps function.
- **GTM process-stage definitions.** Authored-shared (RevOps writes, all read). Lives in the RevOps function.

Graduation criteria: the artifact becomes multi-author in practice, or drift starts causing cross-function friction, or three or more functions start maintaining local copies. Until then, authored-shared is the cheaper model.

## Status

This repo ships all seven components as abstract scaffolds: each directory has a README, the templates referenced, and at least one example page filled with placeholder values. Nothing here is one company's real data. A fork replaces the placeholders with your ICP, pricing, personas, and the rest.
