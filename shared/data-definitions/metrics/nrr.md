---
type: metric-definition
title: Net Revenue Retention (NRR)
description: NRR — percentage of recurring revenue retained from an existing cohort including expansion.
owner: rasmus@unfrankenstein.io
reviewers:
  - revops-lead
  - finance-lead
  - cs-lead
last_reviewed: 2026-04-19
verified_until: 2027-04-19
consumers:
  - marketing
  - sales
  - cs
  - revops
  - finance
  - product
sources:
  - sources/internal-docs/README.md
source_drift: false
verification_stale: false
has_contradiction: null
confidence: high
---

# Net Revenue Retention (NRR)

> Phase 0 abstract example. Research citations here are illustrative and use placeholder references; replace with real benchmark citations when forking.

## Definition

**Net Revenue Retention** is the percentage of recurring revenue retained from a fixed cohort of customers over a given period, including expansion (upsell / cross-sell / seat growth) and net of contraction (downsell / churn). Measured per cohort, typically reported as a trailing-12-month figure.

## Formula

```
NRR(t) = (Starting ARR + Expansion ARR - Contraction ARR - Churn ARR) / Starting ARR
       = Ending ARR of cohort / Starting ARR of cohort
```

Where:

- **Starting ARR**: ARR at cohort anchor date (t=0) for a fixed customer set
- **Expansion ARR**: upsell + cross-sell + seat expansion + price increase realized during period
- **Contraction ARR**: downsell + seat reduction + price decrease during period
- **Churn ARR**: lost recurring revenue from fully departed customers
- **Ending ARR**: ARR at t=1 from the *same customer set* that existed at t=0 (excluding new logos acquired during period)

## Worked example

Cohort anchor: 100 customers, $10M ARR at 2025-04-19.

During the trailing 12 months:

- Expansion: $2M (20% of starting ARR)
- Contraction: $500K (5%)
- Churn: $1M (10%)

```
Ending ARR from cohort = $10M + $2M - $500K - $1M = $10.5M
NRR = $10.5M / $10M = 105%
```

## Typical benchmarks

| Stage / segment | Range | Source (placeholder) |
|---|---|---|
| Early-stage B2B SaaS ($1-10M ARR) | 85-105% | `<benchmark source>` |
| Growth-stage B2B SaaS ($10-100M ARR) | 100-120% | `<benchmark source>` |
| Best-in-class public SaaS | 120-140% | `<benchmark source>` |

Replace placeholder citations with real benchmark data when forking. Primary sources commonly used: SaaS Capital annual survey, OPEXEngine, Bessemer State of the Cloud, KeyBanc SaaS Survey.

## Common mistakes / misdefinitions

- **Confusing NRR with GRR (Gross Revenue Retention).** GRR excludes expansion. NRR includes it. Reporting NRR when the context calls for GRR hides churn pain.
- **Including new-logo ARR in the cohort.** The cohort must be fixed at t=0. Including logos acquired during the period inflates NRR artificially.
- **Measuring NRR on ARR added in the period instead of ARR at anchor date.** This is a different metric (Dollar Retention / Quick Ratio variants) — call it what it is.
- **Variable cohort definitions across functions.** RevOps measures NRR on the customer cohort; Finance sometimes measures on the contract cohort. Agree on one definition; document the other as a variant.

## How our corpus uses it

- **Where cited**: `shared/icp/tier-1.md` (expected NRR by tier), `shared/pricing/discount-guardrails.md` (strategic-exception deal retention), CS renewal playbooks (Phase 2).
- **Owner for updates**: RevOps lead.
- **Re-verification cadence**: annual.

## Dependencies

- **Depends on**: Starting ARR definition, Expansion ARR definition, Contraction ARR definition, Churn ARR definition.
- **Used to compute**: cohort-level retention waterfalls, LTV estimates, investor-facing reporting.

## Related

- [`../`](../) — other metrics (GRR, logo-churn, revenue-churn planned for in-production forks)
- [`../../../functions/customer-success/`](../../../functions/customer-success/) (Phase 2)
- [`../../../functions/finance-legal/`](../../../functions/finance-legal/) (Phase 2)

## Change log

- 2026-04-19 — Phase 0 scaffold with abstract worked example. Benchmark citations use placeholder references — replace with real sources before in-production use.
