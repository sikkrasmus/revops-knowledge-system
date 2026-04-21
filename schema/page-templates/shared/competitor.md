---
type: competitor
title: "<Competitor name>"
description: "<one-line summary of this competitor profile>."
owner: "<email-or-github-handle>"
reviewers:
  - <marketing-lead>
  - <sales-lead>
  - <product-lead>
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
  - product
sources:
  - <source path or system://query as_of:date>
source_drift: false
verification_stale: false
has_contradiction: null
confidence: medium
---

# <Competitor name>

> Template for competitor profile pages. Battlecards live downstream in `functions/sales/` (Phase 1). Replace frontmatter and content, remove this blockquote.

## Snapshot

- **Category**: `<category>`
- **Funding**: `<stage and last round>`
- **Employees**: `<range>`
- **Founded**: `<year>`
- **HQ**: `<location>`

## Their positioning

<One paragraph: how they position themselves, primary category claim, lead differentiator.>

## Where they win

- `<segment / use case 1 [source: ...]>`
- `<segment / use case 2 [source: ...]>`

## Where we win

- `<segment / use case 1 [source: ...]>`
- `<segment / use case 2 [source: ...]>`

## Typical buyer who chooses them

<Paragraph: what kind of company picks them over us, what they care about, what signals predict a loss to this competitor.>

## Price and packaging (public signals)

- **Visible pricing**: `<published prices if any>`
- **Packaging structure**: `<editions they offer>`
- **Discount behavior in deals**: `<what we've seen in head-to-head>`

## Their weaknesses (well-sourced)

- `<weakness 1 [source: ...]>`
- `<weakness 2 [source: ...]>`

## Our counter-positioning

<How we position against them. What to say first, what to lead with, what to never say.>

## Segment-specific notes

### SMB  {segment: smb}

<How they behave in SMB deals if they play here.>

### Enterprise  {segment: enterprise}

<How they behave in enterprise: longer cycles, MSA negotiation, security review posture.>

## Win-loss evidence

- `<closed deal pattern 1, e.g., "last 6 head-to-head mid-market deals: we won 4, lost 2. Wins had multi-product, losses had single-product." [source: ...]>`

## Related

- [`shared/competitive-intel/win-loss-patterns.md`](./win-loss-patterns.md), cross-competitor patterns
- [`../../functions/sales/`](../../functions/sales/), battlecards (Phase 1)
- [`../positioning/`](../positioning/), our positioning we're differentiating

## Change log

- `<YYYY-MM-DD>`, `<change summary>` [source: <PR>]
