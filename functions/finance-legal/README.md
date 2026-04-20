---
type: function-readme
title: Finance & Legal function
description: Finance and Legal function — scaffold only in Phase 0; content filled in Phase 2.
owner: rasmus@latentflows.com
reviewers:
  - finance-lead
  - legal
last_reviewed: 2026-04-19
verified_until: 2026-10-19
consumers:
  - finance
  - legal
  - sales
  - cs
  - product
sources:
  - sources/internal-docs/README.md
source_drift: false
verification_stale: false
has_contradiction: null
confidence: medium
---

# Finance & Legal function

**Phase status**: scaffold only. Content filled in Phase 2.

---

## What the function owns (when filled)

- Revenue recognition policy (ASC 606 / IFRS 15 posture)
- MSA templates and redline playbook
- Legal / compliance posture (SOC 2, GDPR, HIPAA readiness, PII handling)
- Non-standard term approval rules
- Invoicing and collections policy
- Audit and controls
- Sanctions and restricted-party screening

## What the function consumes from `shared/`

- **[`shared/pricing/`](../../shared/pricing/)** — revenue recognition and contract structure.
- **[`shared/product-and-packaging/`](../../shared/product-and-packaging/)** — delivery obligation definitions.

## What the function authors

Finance & Legal is the primary owner of the revenue-recognition and legal-posture content in this directory. Some of this is authored-shared: single-author (here), many readers (across all functions).

## Always-PR content

Every change in this directory always PRs, regardless of maturity stage. Legal review is typical on MSA template changes, indemnification, and data-handling policies.

## Planned structure

Same skeleton as [`../README.md`](../README.md). Filled in Phase 2.

## Ownership

- **Owner**: Finance lead (for revenue-recognition and invoicing), Legal (for contract and compliance content).
- **Co-authors**: RevOps lead (operational alignment).
- **Consumers**: Every function.

## Related

- [`../../PHASES.md`](../../PHASES.md)
