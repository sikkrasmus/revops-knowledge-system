---
type: persona
title: "<Role title, e.g., VP RevOps>"
description: "<one-line summary of this persona in 1-2 clauses>."
owner: "<email-or-github-handle>"
reviewers:
  - <sales-lead>
  - <marketing-lead>
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

# <Role title>

> Template for individual persona pages. Replace frontmatter and content, remove this blockquote.

## Role summary

<One paragraph: what this role owns, how senior, who they report to, who reports to them.>

## Scope and authority

- **Owns**: `<budget lines, decisions, KPIs>`
- **Reports to**: `<typical manager>`
- **Direct reports**: `<typical team size and roles>`
- **Budget authority**: `<range if known>`

## Primary pains

- `<pain 1 [source: ...]>`
- `<pain 2 [source: ...]>`
- `<pain 3 [source: ...]>`

## What they care about

- `<metric or outcome 1>`
- `<metric or outcome 2>`

## What they dismiss

- `<what doesn't resonate, trap to avoid>`

## How they buy

- **Typical buying committee role**: `<champion / decision-maker / influencer / blocker>`
- **Buying motion preference**: `<self-serve / sales-led / RFP>`
- **Evaluation criteria**: `<top 3>`

## Objections (top 3)

- `<objection 1>`, counter in [`shared/competitive-intel/`](../competitive-intel/) or [`functions/sales/`](../../functions/sales/)
- `<objection 2>`
- `<objection 3>`

## Motion-specific notes

### PLG motion  {motion: plg}

<How this persona behaves in PLG context, e.g., self-signup, tool champion, discovers via community.>

### Enterprise motion  {motion: enterprise}

<How this persona behaves in enterprise, e.g., evaluates via formal RFP, loops in CFO early.>

## Related

- [`shared/personas/buying-committees/`](./buying-committees/), configurations where this persona appears
- [`shared/icp/`](../icp/), ICP tiers where this persona is the primary buyer

## Change log

- `<YYYY-MM-DD>`, `<change summary>` [source: <PR>]
