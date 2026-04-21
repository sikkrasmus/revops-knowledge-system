---
type: objection
title: "<Objection, short quote or label>"
description: "<one-line summary of when this objection surfaces and the tested response, ends with period>."
owner: "<email-or-github-handle>"
reviewers:
  - sales-lead
  - marketing-lead
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

# <Objection, short quote or label>

> Template for objection-handling pages. Replace frontmatter values and placeholder content; remove this blockquote.
> Persona × stage × frequency × tested response. Cite win-loss patterns or call snippets where the response has been validated.

## The objection in the buyer's words

> "<Verbatim or paraphrased quote of what the buyer actually says.>"

## When it surfaces

- **Persona(s)**: `<e.g., Head of RevOps, CFO, VP Sales>`
- **Deal stage(s)**: `<discovery / demo / evaluation / proposal / negotiation>`
- **Frequency**: `<e.g., heard in ~40% of mid-market discovery calls>` [source: ...]
- **Upstream cause**: `<e.g., prior failed tool rollout, recent budget freeze>`

## What it actually means

<One paragraph: the unspoken concern underneath the stated objection. Usually risk aversion, sunk cost, or buyer fatigue. Name it explicitly.>

## Tested response

<The response that has worked. Specific language, not platitudes. If the response has multiple beats, number them.>

1. `<First beat: acknowledge without defending>`
2. `<Second beat: reframe the concern>`
3. `<Third beat: offer a concrete next step that de-risks>`

## What NOT to say

- **Don't** `<response that has lost deals>`. [source: ...]
- **Don't** `<response that feels defensive>`. [source: ...]

## Segment / motion variants

### Mid-market variant  {segment: mid-market}

<What changes for mid-market. Often budget-anchored; often one champion and one decision-maker.>

### Enterprise variant  {segment: enterprise}

<What changes for enterprise. Broader committee; procurement and legal amplify the objection.>

## Follow-up artifacts

- `<link to a case study or reference that de-risks this objection>`
- `<link to an ROI model or TCO comparison that addresses the underlying concern>`

## Related

- [`../../shared/personas/`](../../shared/personas/), the persona(s) that raise this objection
- [`../../shared/competitive-intel/`](../../shared/competitive-intel/), whether the objection is competitively triggered
- [`../../functions/sales/playbooks/`](../../functions/sales/playbooks/), stages where it surfaces

## Change log

- `<YYYY-MM-DD>`, `<change summary>` [source: <PR>]
