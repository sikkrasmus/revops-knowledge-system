---
type: metric-definition
title: "<Metric name, e.g., Net Revenue Retention (NRR)>"
description: "<one-line definition, ends with period>."
owner: "<email-or-github-handle>"
reviewers:
  - <revops-lead>
  - <finance-lead>
last_reviewed: <YYYY-MM-DD>
verified_until: <YYYY-MM-DD>
consumers:
  - marketing
  - sales
  - cs
  - revops
  - finance
  - product
sources:
  - <source path, benchmark research citation>
source_drift: false
verification_stale: false
has_contradiction: null
confidence: high
---

# <Metric name>

> Template for metric definition pages. RevOps-authored, consumed by all. Opinionated, research-grounded. Replace frontmatter and content, remove this blockquote.

## Definition

<One-paragraph precise definition. Include time window if applicable.>

## Formula

```
<formula, with variable names>
```

Where:

- `<variable 1>`: `<precise definition>`
- `<variable 2>`: `<precise definition>`

## Worked example

<Calculation with toy numbers so a reader can reproduce.>

## Typical benchmarks

| Stage / segment | Range | Source |
|---|---|---|
| `<early-stage B2B SaaS>` | `<range>` | `<benchmark source>` |
| `<mid-market B2B SaaS>` | `<range>` | `<benchmark source>` |
| `<enterprise B2B SaaS>` | `<range>` | `<benchmark source>` |

Cite sources: SaaS Capital, OPEXEngine, Bessemer State of the Cloud, KeyBanc SaaS Survey, etc.

## Common mistakes / misdefinitions

- `<mistake 1, e.g., confusing NRR with GRR>`
- `<mistake 2, e.g., including logo churn in GRR>`
- `<mistake 3>`

## How our corpus uses it

- **Where cited**: `<list of pages or page-types that depend on this metric>`
- **Owner for updates**: `<role>`
- **Re-verification cadence**: `<e.g., quarterly>`

## Dependencies

- **Depends on**: `<other metrics or data definitions>`
- **Used to compute**: `<downstream metrics>`

## Related

- [`shared/data-definitions/`](./), other metrics
- [`../../functions/revops/`](../../functions/revops/), RevOps analytics (Phase 2)
- [`../../functions/finance-legal/`](../../functions/finance-legal/), finance reporting (Phase 2)

## Change log

- `<YYYY-MM-DD>`, `<change summary>` [source: <PR>]
