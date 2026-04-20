---
type: function-readme
title: Customer Success function
description: Customer Success function — scaffold only in Phase 0; content filled in Phase 2.
owner: rasmus@latentflows.com
reviewers:
  - cs-lead
  - revops-lead
last_reviewed: 2026-04-19
verified_until: 2026-10-19
consumers:
  - cs
  - sales
  - product
sources:
  - sources/internal-docs/README.md
source_drift: false
verification_stale: false
has_contradiction: null
confidence: medium
---

# Customer Success function

**Phase status**: scaffold only. Content filled in Phase 2.

---

## What the function owns (when filled)

- Onboarding playbooks (by segment and product)
- Adoption frameworks
- Renewal motions and expansion plays
- Health-score methodology
- QBR / EBR templates
- Escalation matrix
- Account-team structure (pooled vs. dedicated) by tier

## What the function consumes from `shared/`

- **[`shared/icp/`](../../shared/icp/)** — fit assessment post-close informs expansion potential and churn risk.
- **[`shared/personas/`](../../shared/personas/)** — stakeholder identification during engagement.
- **[`shared/pricing/`](../../shared/pricing/)** — renewal price floors, expansion pricing.
- **[`shared/product-and-packaging/`](../../shared/product-and-packaging/)** — upsell / cross-sell paths.
- **[`shared/data-definitions/`](../../shared/data-definitions/)** — NRR, GRR, churn definitions.

## Planned structure

Same skeleton as [`../README.md`](../README.md). Filled in Phase 2.

## Ownership

- **Owner**: CS lead.
- **Co-authors**: Sales lead (deal handoff), Product lead (adoption blockers).
- **Consumers**: CS, Sales, Product.

## Related

- [`../../PHASES.md`](../../PHASES.md)
