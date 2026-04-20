---
type: function-readme
title: RevOps function
description: RevOps function — scaffold only in Phase 0; content filled in Phase 2.
owner: rasmus@latentflows.com
reviewers:
  - revops-lead
  - finance-lead
last_reviewed: 2026-04-19
verified_until: 2026-10-19
consumers:
  - revops
  - sales
  - marketing
  - cs
  - finance
sources:
  - sources/internal-docs/README.md
source_drift: false
verification_stale: false
has_contradiction: null
confidence: medium
---

# RevOps function

**Phase status**: scaffold only. Content filled in Phase 2.

---

## What the function owns (when filled)

- Tooling stack documentation (CRM, data warehouse, BI, attribution, sequencer, CPQ, deal desk)
- Data model (CRM schema, data warehouse objects, cross-system identity mapping)
- Forecasting methodology
- Territory and comp-plan operationalization
- Reporting and analytics (dashboards, canonical reports)
- Process documentation (lead routing, deal stage progression, handoffs)
- GTM-process-stage definitions (authored-shared; RevOps owns, everyone reads)

## What the function consumes from `shared/`

- **[`shared/icp/`](../../shared/icp/)** — segmentation and territory design.
- **[`shared/data-definitions/`](../../shared/data-definitions/)** — RevOps is the owner.
- **[`shared/pricing/`](../../shared/pricing/)** — quoting and revenue recognition alignment.

## What the function authors

RevOps is the primary owner of [`shared/data-definitions/`](../../shared/data-definitions/) and contributes heavily to [`shared/icp/`](../../shared/icp/) and [`shared/pricing/`](../../shared/pricing/). Operational content (tool config, process flows, analytics) lives in this directory.

## Planned structure

Same skeleton as [`../README.md`](../README.md). Filled in Phase 2.

## Ownership

- **Owner**: RevOps lead.
- **Co-authors**: Finance lead (revenue recognition, comp), Sales lead (operational alignment).
- **Consumers**: Every function.

## Related

- [`../../PHASES.md`](../../PHASES.md)
