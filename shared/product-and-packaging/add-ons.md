---
type: packaging
title: Add-ons
description: Add-ons that extend editions — what they are, what they attach to, decision rubric.
owner: rasmus@unfrankenstein.io
reviewers:
  - product-lead
  - revops-lead
last_reviewed: 2026-04-19
verified_until: 2026-07-19
motion:
  - sales-assisted
  - enterprise
segment:
  - mid-market
  - enterprise
consumers:
  - sales
  - cs
  - finance
  - product
sources:
  - sources/internal-docs/README.md
source_drift: false
verification_stale: false
has_contradiction: null
confidence: medium
---

# Add-ons

> Phase 0 abstract example.

## What an add-on is

An add-on extends an edition with capability that doesn't justify inclusion in the base edition — typically because (a) attach rate is below threshold, (b) it requires additional cost-to-serve, or (c) it's only valuable to a sub-segment.

## Current add-ons

| Add-on | Attaches to | Pricing | Target segment |
|---|---|---|---|
| `<add-on 1>` | Growth, Enterprise | `<% uplift or flat>` | Mid-market, Enterprise |
| `<add-on 2>` | Enterprise only | `<rate>` | Enterprise |
| `<add-on 3>` | All editions | `<rate>` | All |

## Add-on vs. edition-included — decision rubric

| Factor | Keep as add-on | Graduate to edition-included |
|---|---|---|
| Attach rate | <40% | ≥60% sustained for 2 quarters |
| Cost-to-serve | Material incremental COGS | Already covered by baseline |
| Sub-segment value | High for one segment only | High across target segments |
| Positioning | Niche capability | Core value prop |

Graduation requires a PR with the data backing the decision. Revenue impact and packaging regression modeled before change.

## Rollback

If an add-on graduates to edition-included but attach signal fades, roll back to add-on via PR. Grandfathering policy for existing customers defined per-case.

## Related

- [`editions.md`](editions.md) — what add-ons attach to
- [`../pricing/`](../pricing/) — pricing for add-ons
- [`skus/`](skus/) — individual SKU specs
