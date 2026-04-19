---
type: icp
title: "<Tier N ICP — descriptive label>"
description: "<one-line summary, ends with period, max 200 chars>."
owner: "<email-or-github-handle>"
reviewers:
  - <revops-lead>
  - <sales-lead>
last_reviewed: <YYYY-MM-DD>
verified_until: <YYYY-MM-DD>
motion:
  - <enum value>
segment:
  - <enum value>
consumers:
  - marketing
  - sales
  - cs
sources:
  - <source path or system://query as_of:date>
source_drift: false
verification_stale: false
has_contradiction: null
confidence: medium
---

# <Tier N ICP — descriptive label>

> Template for ICP tier pages. Replace frontmatter and content, remove this blockquote.

## Summary

<One paragraph: who is in this tier, why they're a fit, rough count or TAM signal.>

## Firmographics

- **ARR band**: `<e.g., $25-100M>`
- **Employee count**: `<range>`
- **Headquarters / region**: `<list>`
- **Funding stage**: `<e.g., Series C+ or bootstrapped>`

## Technographics

- **Core stack**: `<CRM, billing, CPQ, etc.>`
- **Integration signals**: `<e.g., uses Gong + Salesforce + Stripe>`

## Triggers (buying signals)

- `<e.g., hired new VP Sales in last 90 days [source: ...]>`
- `<e.g., raised Series C in last 180 days [source: ...]>`
- `<e.g., launched second product line [source: ...]>`

## Disqualifiers

- `<e.g., pre-PMF, under $5M ARR [source: ...]>`
- `<e.g., single-product single-segment [source: ...]>`

## Notes on variation

### PLG variant  {motion: plg}

<What changes for PLG motion, if anything.>

### Enterprise variant  {motion: enterprise, segment: enterprise}

<What changes for enterprise motion.>

## Related

- [`shared/personas/`](../personas/) — buying-committee personas for this tier
- [`shared/pricing/`](../pricing/) — tier-specific pricing guidance

## Change log

- `<YYYY-MM-DD>` — `<change summary>` [source: <PR>]
