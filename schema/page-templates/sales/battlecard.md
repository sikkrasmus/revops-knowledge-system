---
type: battlecard
title: "<Competitor name, battlecard>"
description: "<one-line summary of when and how to deploy this battlecard, ends with period>."
owner: "<email-or-github-handle>"
reviewers:
  - sales-lead
  - marketing-lead
  - product-lead
last_reviewed: <YYYY-MM-DD>
verified_until: <YYYY-MM-DD>
motion:
  - <enum value>
segment:
  - <enum value>
consumers:
  - sales
  - marketing
  - cs
sources:
  - <source path or system://query as_of:date>
source_drift: false
verification_stale: false
has_contradiction: null
confidence: medium
---

# <Competitor name, battlecard>

> Template for sales battlecards. Replace frontmatter values and placeholder content; remove this blockquote.
> Battlecards stale fast. Default `verified_until` to 60 days from creation and re-verify quarterly against closed-deal evidence in [`../../shared/competitive-intel/win-loss-patterns.md`](../../shared/competitive-intel/win-loss-patterns.md).

## When to deploy this battlecard

<One paragraph: which deal shape calls for this card. Motion, segment, buying-committee composition, observed competitive signal.>

## The competitor in one paragraph

<Neutral, factual summary of the competitor's positioning and product. No marketing voice. Cite [`../../shared/competitive-intel/competitors/`](../../shared/competitive-intel/competitors/) for the canonical profile.>

## Where we win

- `<claim 1, strength grounded in observed deal data>` [source: ...]
- `<claim 2>` [source: ...]
- `<claim 3>` [source: ...]

## Where they win

<Honest account of where the competitor is stronger. Writing this section well is what makes the card trustworthy to an AE in the room. Cite win-loss patterns where possible.>

- `<claim 1>` [source: ...]
- `<claim 2>` [source: ...]

## Counter-positioning tactics

| Their claim | Our response | Evidence |
|---|---|---|
| `<claim they make>` | `<reframe or counter>` | `<cite source>` |
| `<claim>` | `<response>` | `<source>` |

## Traps to avoid

- **Don't** `<behavior that has lost deals before>`. [source: ...]
- **Don't** `<behavior>`. [source: ...]

## Segment variants

### Mid-market variant  {segment: mid-market}

<What changes for mid-market deals. Typical ACV, buying-committee shape, motion-specific notes.>

### Enterprise variant  {segment: enterprise}

<What changes for enterprise deals. Security, procurement, legal involvement, longer cycles.>

## Related

- [`../../shared/competitive-intel/`](../../shared/competitive-intel/), canonical competitor profile and win-loss patterns
- [`../../shared/positioning/`](../../shared/positioning/), value props and elevator pitches
- [`../../functions/sales/objections/`](../../functions/sales/objections/), common objections raised in competitive deals

## Change log

- `<YYYY-MM-DD>`, `<change summary>` [source: <PR>]
