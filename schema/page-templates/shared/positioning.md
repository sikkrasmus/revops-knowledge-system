---
type: value-prop
title: "<Positioning label — e.g., Core value prop — for multi-product platforms>"
description: "<one-line summary of this positioning artifact>."
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

# <Positioning label>

> Template for positioning pages (value props, category narrative, elevator pitches). Replace frontmatter and content, remove this blockquote.
>
> For category narrative pages use `type: category-narrative`. For elevator-pitch pages use `type: elevator-pitch`. For value props use `type: value-prop`.

## Audience

- **Primary persona**: link to [persona](../personas/<slug>.md)
- **Motion**: `<plg / sales-assisted / enterprise>`
- **Segment**: `<smb / mid-market / enterprise>`

## The one-sentence pitch

> `<one-sentence value prop, grammatically complete, no hedge words>`

## The problem

<One paragraph: the buyer's pain, phrased in their language. Cite sources.>

## The category / frame

<Which category do we place ourselves in? If we're fighting category definitions, which frame do we lead with and why.>

## The differentiator

<One paragraph: why us, not them. Concrete, measurable, hard to copy. Cite sources.>

## Proof points

- `<proof 1 — e.g., "customer X reduced cycle time by 40% in 90 days" [source: ...]>`
- `<proof 2>`
- `<proof 3>`

## Variants by motion

### PLG landing-page narrative  {motion: plg}

<Shorter, self-serve-oriented, product-first.>

### Sales-assisted first-call opener  {motion: sales-assisted}

<Outcome-led, buyer-pain-first, proof-point-backed.>

### Enterprise board-deck narrative  {motion: enterprise, segment: enterprise}

<Strategic, category-setting, CFO-language, ROI-framed.>

## What to avoid saying

- `<anti-pattern 1 — overpromise, trigger word, objection-inducing phrase>`
- `<anti-pattern 2>`

## Related

- [`shared/icp/`](../icp/) — audiences this positioning targets
- [`shared/competitive-intel/`](../competitive-intel/) — competitor positioning we're differentiating against
- [`shared/product-and-packaging/`](../product-and-packaging/) — SKUs this positions

## Change log

- `<YYYY-MM-DD>` — `<change summary>` [source: <PR>]
