---
type: function-readme
title: Support function
description: Support function — scaffold only in Phase 0; content filled in Phase 2.
owner: rasmus@unfrankenstein.io
reviewers:
  - support-lead
  - product-lead
last_reviewed: 2026-04-19
verified_until: 2026-10-19
consumers:
  - support
  - cs
  - product
sources:
  - sources/internal-docs/README.md
source_drift: false
verification_stale: false
has_contradiction: null
confidence: medium
---

# Support function

**Phase status**: scaffold only. Content filled in Phase 2.

---

## What the function owns (when filled)

- Knowledge-base articles (end-user-facing)
- Internal troubleshooting runbooks
- Escalation paths (Support → Engineering / Product)
- SLA definitions by edition
- Incident-response patterns
- Deflection playbooks

## What the function consumes from `shared/`

- **[`shared/product-and-packaging/`](../../shared/product-and-packaging/)** — SKU limits, known limitations.
- **[`shared/data-definitions/`](../../shared/data-definitions/)** — CSAT, TTR, SLA metrics.

## Planned structure

Same skeleton as [`../README.md`](../README.md). Filled in Phase 2.

## Ownership

- **Owner**: Support lead.
- **Co-authors**: Product lead (known issues), CS lead (account escalations).
- **Consumers**: Support, CS, Product.

## Related

- [`../../PHASES.md`](../../PHASES.md)
