---
type: buying-committee
title: "<Committee label, e.g., Mid-market multi-product buying committee>"
description: "<one-line summary, ends with period>."
owner: "<email-or-github-handle>"
reviewers:
  - <sales-lead>
  - <revops-lead>
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

# <Committee label>

> Template for buying-committee configurations. Replace frontmatter and content, remove this blockquote.

## Context

<When does this committee configuration apply? Deal size / segment / motion / product combination.>

## Committee members

| Role | Involvement | Typical objection | Links |
|---|---|---|---|
| `<role 1>` | Champion / Decision-maker / Influencer / Blocker | `<primary objection>` | [persona](../personas/<persona-slug>.md) |
| `<role 2>` | ... | ... | ... |
| `<role 3>` | ... | ... | ... |

## Decision flow

<Paragraph or numbered list: how decisions actually move through this committee. Who needs to say yes first, who can kill the deal, who drives.>

1. `<step 1, e.g., Champion validates fit>`
2. `<step 2, e.g., Security review loops in CISO>`
3. `<step 3, e.g., CFO sign-off on ACV >$100K>`

## Typical pushback patterns

- `<pattern 1>` [source: ...]
- `<pattern 2>` [source: ...]

## Deal risks

- **Stalled at** `<step>`: `<typical cause and recovery>`
- **Lost when**: `<typical loss pattern>`

## Segment-specific variants

### SMB variant  {segment: smb}

<What changes: smaller committee, faster decisions, different objections.>

### Enterprise variant  {segment: enterprise}

<What changes: larger committee, procurement plus security plus legal, longer cycles.>

## Related

- [`shared/personas/`](../personas/), individual persona pages
- [`shared/icp/`](../icp/), ICP tiers this committee configuration serves

## Change log

- `<YYYY-MM-DD>`, `<change summary>` [source: <PR>]
