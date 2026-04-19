---
type: pricing-policy
title: "<Price book label — e.g., Canonical price book 2026-Q2>"
description: "<one-line summary of this pricing artifact>."
owner: "<email-or-github-handle>"
reviewers:
  - <revops-lead>
  - <finance-lead>
  - <sales-lead>
last_reviewed: <YYYY-MM-DD>
verified_until: <YYYY-MM-DD>
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
sources:
  - <source path or system://query as_of:date>
source_drift: false
verification_stale: false
has_contradiction: null
confidence: high
---

# <Price book label>

> Template for pricing policy pages. Highest-conflict shared artifact — reviewer routing is strict. Replace frontmatter and content, remove this blockquote.

## Effective date

- **From**: `<YYYY-MM-DD>`
- **To**: `<YYYY-MM-DD or "current">`

## Common principles

<What's true across all motions and segments. Billing cadence, currency, tax treatment, renewal defaults.>

## Self-serve / PLG pricing  {motion: plg}

| Edition | Monthly | Annual (2mo free) | Notes |
|---|---|---|---|
| `<edition>` | $X | $Y | `<notes>` |

## Sales-assisted pricing  {motion: sales-assisted, segment: mid-market}

<Anchor ACVs, list price, typical effective price, volume ramp structure, seat tiers.>

## Sales-assisted pricing  {motion: sales-assisted, segment: enterprise}

<Larger-deal structure, multi-year ramps, custom usage tiers.>

## Enterprise pricing  {motion: enterprise, segment: enterprise}

<MSA-anchored. Per-deal pricing. Usage bands. Custom SLAs premium. Legal involvement.>

## Ramp patterns

- **1-year term**: `<structure>`
- **3-year term**: `<structure with annual ramps>`
- **Multi-entity / multi-region**: `<structure>`

## Non-standard asks that require CFO sign-off

- Discounts above `<X>%` (normal guardrails in [`discount-guardrails.md`](./discount-guardrails.md))
- Multi-year with no annual ramp
- Deferred revenue recognition outside policy
- Non-standard payment terms (anything beyond Net 30)

## Related

- [`discount-guardrails.md`](./discount-guardrails.md) — discount rules and strategic exception bands
- [`usage-meters.md`](./usage-meters.md) — for usage-billed motions
- [`../product-and-packaging/`](../product-and-packaging/) — SKUs and editions this prices

## Change log

- `<YYYY-MM-DD>` — `<change summary>` [source: <PR>]
