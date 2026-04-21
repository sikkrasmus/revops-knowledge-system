---
type: usage-meter
title: Usage meters
description: Metered units, rates, overage handling for usage-billed motions.
owner: rasmus@latentflows.com
reviewers:
  - revops-lead
  - finance-lead
  - product-lead
last_reviewed: 2026-04-19
verified_until: 2026-07-19
motion:
  - plg
  - sales-assisted
  - enterprise
segment:
  - mid-market
  - enterprise
consumers:
  - sales
  - finance
  - product
  - cs
sources:
  - sources/internal-docs/README.md
source_drift: false
verification_stale: false
has_contradiction: null
confidence: high
---

# Usage meters

> Phase 0 abstract example. Applies only when the pricing motion includes a usage-billed component.

## What gets metered

| Meter | Unit | Billing cadence | Notes |
|---|---|---|---|
| `<meter name 1>` | events, API calls, records, GB, compute-minutes | Monthly or daily | `<description>` |
| `<meter name 2>` | ... | ... | ... |
| `<meter name 3>` | ... | ... | ... |

Meter definitions are the source of truth in the billing system. This page documents them for sales, finance, and CS reference.

## Included-vs-metered by edition

- **Starter**: baseline included. Overage hard-capped (service rejects rather than bills).
- **Growth**: higher baseline. Overage billed at `<X>` per unit.
- **Enterprise**: custom baseline per contract. Custom overage rate, often tiered.

## Overage handling

- **Soft warning threshold**: 80% of monthly baseline. Customer notified in-app.
- **Hard warning threshold**: 100%. Customer notified in-app and via email; AE and CS notified.
- **Overage billing**: invoiced monthly in arrears (Growth and above); Enterprise per MSA.

## Rate table

| Edition | Baseline | Overage rate | Hard cap |
|---|---|---|---|
| Starter | `<N units>` | Hard cap, no overage billing | Baseline |
| Growth | `<N units>` | `<$X per unit>` | Optional per contract |
| Enterprise | Custom | Tiered (`<per contract>`) | Per contract |

## Annual true-up (sales-assisted and enterprise)

At contract renewal:

- If average monthly usage ≥ contracted baseline: baseline lifts to P80 of observed usage, with discount.
- If average monthly usage < 60% of contracted baseline: CS opportunity to right-size (reduce baseline with discount concession).
- Customer must opt-in to true-up adjustments.

## Drift signals

- **Meter definition drift.** If the billing system's meter definition changes but this page has not updated: `source_drift: true` until reconciled. Same for the reverse direction.
- **Rate drift.** If closed deals consistently negotiate a different overage rate than documented, flag for policy review.

## Related

- [`price-book.md`](price-book.md), overall pricing structure
- [`discount-guardrails.md`](discount-guardrails.md), how discounts affect baseline or rate
- [`../product-and-packaging/`](../product-and-packaging/), editions this pricing attaches to
