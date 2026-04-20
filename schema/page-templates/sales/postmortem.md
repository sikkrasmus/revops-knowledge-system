---
type: postmortem
title: "<Deal postmortem — account / outcome label>"
description: "<one-line summary of the deal, outcome, and single-sentence root cause, ends with period>."
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
  - product
sources:
  - <source path or system://query as_of:date>
source_drift: false
verification_stale: false
has_contradiction: null
confidence: high
---

# <Deal postmortem — account / outcome label>

> Template for blameless deal postmortems. Replace frontmatter values and placeholder content; remove this blockquote.
> Pattern: timeline + single-sentence root cause + action items with owners. The purpose is to generalize a lesson into the shared spine, not assign blame.

## Outcome

- **Result**: `<closed-won / closed-lost / no-decision / stalled>`
- **Account type (abstract)**: `<archetype — e.g., mid-market multi-product platform>`
- **ACV**: `<range or anonymized number>`
- **Cycle length**: `<days from first touch to outcome>`
- **Competitors involved**: `<competitor archetype — not real names in the template>`

## Timeline

Sequence of events that shaped the outcome. Keep factual, no interpretation.

| Date | Event | Source |
|---|---|---|
| `<YYYY-MM-DD>` | `<first touch via source channel>` | [source: ...] |
| `<YYYY-MM-DD>` | `<discovery call with champion>` | [source: ...] |
| `<YYYY-MM-DD>` | `<POC kickoff / evaluation started>` | [source: ...] |
| `<YYYY-MM-DD>` | `<decision committed / lost / stalled>` | [source: ...] |

## Single-sentence root cause

> `<One sentence. No hedging. What actually decided the outcome.>`

## Contributing factors

- `<factor 1 — e.g., champion turnover mid-cycle>` [source: ...]
- `<factor 2>` [source: ...]
- `<factor 3>` [source: ...]

## What worked

- `<behavior or tactic that advanced the deal>` [source: ...]

## What didn't

- `<behavior or gap that hurt the deal>` [source: ...]

## Action items

| Action | Owner | Due | Downstream page to update |
|---|---|---|---|
| `<action>` | `<owner>` | `<YYYY-MM-DD>` | `<page path>` |
| `<action>` | `<owner>` | `<YYYY-MM-DD>` | `<page path>` |

## Pattern signal

<Does this postmortem reinforce or contradict an existing pattern in [`../../shared/competitive-intel/win-loss-patterns.md`](../../shared/competitive-intel/win-loss-patterns.md)? If new, open a PR to add it.>

## Related

- [`../../shared/competitive-intel/win-loss-patterns.md`](../../shared/competitive-intel/win-loss-patterns.md) — the corpus this feeds
- [`../../functions/sales/frameworks/qualification.md`](../../functions/sales/frameworks/qualification.md) — whether the deal was mis-qualified upstream
- [`../../functions/sales/methodology/`](../../functions/sales/methodology/) — if a methodology gap shows up repeatedly

## Change log

- `<YYYY-MM-DD>` — `<change summary>` [source: <PR>]
