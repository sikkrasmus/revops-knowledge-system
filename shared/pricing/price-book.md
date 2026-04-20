---
type: pricing-policy
title: Canonical price book
description: Canonical price book across all motions and segments. Phase 0 abstract example.
owner: rasmus@latentflows.com
reviewers:
  - revops-lead
  - finance-lead
  - sales-lead
last_reviewed: 2026-04-19
verified_until: 2026-07-19
motion:
  - plg
  - sales-assisted
  - enterprise
segment:
  - smb
  - mid-market
  - enterprise
consumers:
  - sales
  - finance
  - legal
  - cs
  - marketing
sources:
  - sources/internal-docs/README.md
source_drift: false
verification_stale: false
has_contradiction: null
confidence: high
---

# Canonical price book

> Phase 0 abstract example. Replace ranges and rates with real numbers when forking.

## Effective date

- **From**: 2026-04-01
- **To**: current

## Common principles

Applies across all motions and segments.

- **Currency**: USD primary; EUR / GBP per contract.
- **Billing cadence**: annual prepay default; monthly PLG self-serve; enterprise per-MSA.
- **Tax treatment**: list prices exclude VAT/GST; local tax added at invoice.
- **Renewal default**: auto-renew 12 months; 60-day opt-out notice. Enterprise per-contract.

## Self-serve / PLG pricing  {motion: plg}

| Edition | Monthly | Annual (2mo free) | Seat range |
|---|---|---|---|
| Starter | `$X` | `$Y` | 1-10 |
| Growth | `$X` | `$Y` | 1-25 |

Usage beyond tier triggers upgrade prompt. Overage not billed on self-serve.

## Sales-assisted pricing  {motion: sales-assisted, segment: mid-market}

- **Typical ACV range**: $15-80K annual
- **Deal structure**: 1-year annual prepay or 2-year with mid-term ramp
- **Seat pricing**: tiered by seat band, with volume discount
- **Discount guardrails**: see [`discount-guardrails.md`](discount-guardrails.md)

## Sales-assisted pricing  {motion: sales-assisted, segment: enterprise}

Applies to early-enterprise deals handled sales-assisted (not full enterprise motion):

- **Typical ACV range**: $80-200K annual
- **Deal structure**: annual or 3-year with ramp
- **Seat pricing**: custom volume bands
- **MSA**: standard MSA template applies
- **Custom usage meters**: see [`usage-meters.md`](usage-meters.md)

## Enterprise pricing  {motion: enterprise, segment: enterprise}

- **MSA-anchored** — custom per contract
- **Deal structure**: 3-year typical with annual ramps
- **Per-deal pricing** — committee approves floor and ceiling
- **Custom SLAs premium**: percentage uplift on base ACV
- **Legal involvement**: MSA redlines always go through legal; finance signs off on revenue recognition before verbal commitment

## Ramp patterns

- **1-year**: no ramp, full fee Year 1
- **3-year standard**: Year 1 = 70-80%, Year 2 = 90%, Year 3 = 100% of committed full-ramp fee
- **Multi-entity / multi-region**: per-contract, with consolidation rebate structure

## Non-standard asks that require CFO sign-off

- Discounts above 25% (see [`discount-guardrails.md`](discount-guardrails.md))
- Multi-year with no annual ramp
- Payment terms beyond Net 60
- Non-USD billing not on approved currency list
- Deferred revenue recognition outside policy
- Custom indemnification caps above standard MSA language

## Related

- [`discount-guardrails.md`](discount-guardrails.md) — discount approval thresholds
- [`usage-meters.md`](usage-meters.md) — usage-billed motions
- [`../product-and-packaging/`](../product-and-packaging/) — what these prices map to
- [`../icp/`](../icp/) — segment definitions anchor here

## Change log

- 2026-04-19 — Phase 0 abstract example scaffolded. Replace with real price points before using in production.
