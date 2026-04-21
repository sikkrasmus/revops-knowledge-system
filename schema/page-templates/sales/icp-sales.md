---
type: icp
title: "<Sales-lens ICP view, tier / segment label>"
description: "<one-line summary of the sales qualification lens on top of the canonical shared ICP, ends with period>."
owner: "<email-or-github-handle>"
reviewers:
  - sales-lead
  - revops-lead
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

# <Sales-lens ICP view, tier / segment label>

> Template for a sales-lens ICP view. Replace frontmatter values and placeholder content; remove this blockquote.
> The canonical ICP definition lives in [`../../../shared/icp/`](../../../shared/icp/). This template is for a Sales-function adaptation that surfaces qualification-ready signals (firmographics, technographics, triggers, negative filters) in the form an AE consumes them. Default `verified_until` to 90 days. Qualification signals stale fast.
> Any ICP definitional change must PR through `shared/icp/` first; this page cites it.

## Canonical reference

This view is derived from [`../../../shared/icp/<tier>.md`](../../../shared/icp/) and must never contradict it. If a contradiction surfaces, flag `has_contradiction` and open a reconciliation PR per [`../../../schema/authoring-contract.md`](../../../schema/authoring-contract.md) §5.

## Qualification-ready firmographics

Hard gates. If any miss, the account is out of scope for this tier.

- **ARR band**: `<range>` [source: ...]
- **Employee count**: `<range>` [source: ...]
- **Region**: `<list>`
- **Funding stage**: `<Series B+ / PE-backed / public>`

## Technographics that unlock engagement

- **Core CRM**: `<e.g., Salesforce, HubSpot>`. Confirms discovery talks can be concrete.
- **Data warehouse**: `<e.g., Snowflake, BigQuery>`. Confirms integration story holds.
- **Adjacent stack signals**: `<tools our product tightly integrates with>`

## Triggers (active buying signals)

- `<hire in last 90 days signal>` [source: ...]
- `<funding event signal>`
- `<product / segment expansion>`
- `<tool consolidation or replacement window>`

## Negative filters

Hard disqualifiers. Override tier-match signals when present.

- `<e.g., pre-PMF / below $10M ARR>` [source: ...]
- `<regulated vertical we lack compliance posture for>`
- `<active procurement freeze>`
- `<recently churned / paused>`

See [`../../../shared/icp/disqualifiers.md`](../../../shared/icp/disqualifiers.md) for the canonical list.

## First-call qualification questions

The 4-6 questions that let an AE confirm tier fit on the first call.

1. `<question>`, signals `<fit attribute>`
2. `<question>`, signals `<fit attribute>`
3. `<question>`, signals `<fit attribute>`
4. `<question>`, signals `<fit attribute>`

## Segment variants

### Mid-market variant  {segment: mid-market}

<Typical deal shape, committee, ACV, cycle.>

### Enterprise variant  {segment: enterprise}

<Typical deal shape, committee, ACV, cycle.>

## Related

- [`../../../shared/icp/`](../../../shared/icp/), canonical ICP tiers
- [`../../../shared/personas/`](../../../shared/personas/), buying-committee composition per tier
- [`../../../functions/sales/frameworks/qualification.md`](../../../functions/sales/frameworks/qualification.md), the qualification framework that consumes this view
- [`../../../functions/sales/methodology/`](../../../functions/sales/methodology/), methodology hooks into these signals

## Change log

- `<YYYY-MM-DD>`, `<change summary>` [source: <PR>]
