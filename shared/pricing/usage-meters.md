---
type: usage-meter
title: Usage meters
description: Metered units, rates, overage handling for usage-billed motions.
owner: rasmus@unfrankenstein.io
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

Meter definitions are the source of truth in the billing system. This page documents them for sales/finance/CS reference.

## Included-vs-metered by edition

- **Starter**: baseline included; overage hard-capped (service rejects, doesn't bill).
- **Growth**: higher baseline; overage billed at `<X>` per unit.
- **Enterprise**: custom baseline per contract; custom overage rate, often tiered.

## Overage handling

- **Soft warning threshold**: 80% of monthly baseline — customer notified in-app.
- **Hard warning threshold**: 100% — customer notified in-app and via email; AE/CS notified.
- **Overage billing**: invoiced monthly in arrears (Growth+); Enterprise per MSA.

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

- **Meter definition drift** — if the billing system's meter definition changes but this page hasn't updated: `source_drift: true` until reconciled. Same for vice versa.
- **Rate drift** — if closed deals consistently negotiate a different overage rate than documented: flag for policy review.

## Related

- [`price-book.md`](price-book.md) — overall pricing structure
- [`discount-guardrails.md`](discount-guardrails.md) — how discounts affect baseline or rate
- [`../product-and-packaging/`](../product-and-packaging/) — editions this pricing attaches to
