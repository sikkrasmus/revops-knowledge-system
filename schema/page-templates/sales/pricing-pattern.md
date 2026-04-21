---
type: pricing-pattern
title: "<Pricing pattern, descriptive label>"
description: "<one-line summary of the pattern and when to deploy it, ends with period>."
owner: "<email-or-github-handle>"
reviewers:
  - sales-lead
  - revops-lead
  - finance-lead
last_reviewed: <YYYY-MM-DD>
verified_until: <YYYY-MM-DD>
motion:
  - <enum value>
segment:
  - <enum value>
consumers:
  - sales
  - finance
  - revops
sources:
  - <source path or system://query as_of:date>
source_drift: false
verification_stale: false
has_contradiction: null
confidence: medium
---

# <Pricing pattern, descriptive label>

> Template for sales-side pricing patterns. Replace frontmatter values and placeholder content; remove this blockquote.
> A pricing-pattern page documents a recurring deal shape and the quoting approach that tends to close it. The canonical price book lives in [`../../shared/pricing/price-book.md`](../../shared/pricing/price-book.md).

## Pattern in one paragraph

<Which deal shape this applies to: segment, motion, buying-committee composition, typical ACV range, procurement characteristics.>

## Typical quote shape

| Component | Value | Notes |
|---|---|---|
| Edition / SKU | `<edition>` | `<why this tier>` |
| Seat count / usage tier | `<range>` | `<ramp notes>` |
| Term | `<1yr / 3yr / multi-year ramp>` | `<why>` |
| Headline ACV | `<range>` | `<anchor logic>` |
| Effective discount | `<range>` | `<against list>` |

## Discount structure

<Reference the canonical guardrails; do not duplicate percentages. Name which bands typically apply to this pattern.>

- Standard band: `<0-10% / 10-18% / 18-25%>`. See [`../../shared/pricing/discount-guardrails.md`](../../shared/pricing/discount-guardrails.md).
- Non-price concessions typically granted: `<3-year term, reference-call commitment, multi-entity rollout>`

## Q2R gotchas

Quote-to-revenue considerations specific to this pattern.

- **Proration handling**: `<what goes wrong if proration isn't explicit>`
- **True-ups**: `<usage true-up cadence and what triggers a billing dispute>`
- **Co-term / renewal anchoring**: `<how term structure affects the next renewal>`
- **Revenue recognition**: `<anything Finance flags at signature>`

## Common trap

<One paragraph: the most frequent mis-quote or mis-structured deal in this pattern. What the fix looks like.>

## Segment variants

### Mid-market variant  {segment: mid-market}

<What changes in mid-market. Typical buyer, cycle length, deal-desk involvement.>

### Enterprise variant  {segment: enterprise}

<What changes in enterprise. MSA structure, legal, procurement, multi-entity.>

## Related

- [`../../shared/pricing/price-book.md`](../../shared/pricing/price-book.md), canonical price book
- [`../../shared/pricing/discount-guardrails.md`](../../shared/pricing/discount-guardrails.md), discount rules
- [`../../shared/pricing/usage-meters.md`](../../shared/pricing/usage-meters.md), for usage-billed motions
- [`../../functions/sales/frameworks/deal-desk-escalation.md`](../../functions/sales/frameworks/deal-desk-escalation.md), when to escalate

## Change log

- `<YYYY-MM-DD>`, `<change summary>` [source: <PR>]
