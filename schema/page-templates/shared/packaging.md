---
type: packaging
title: "<Edition / package name>"
description: "<one-line summary of this edition and who it's for>."
owner: "<email-or-github-handle>"
reviewers:
  - <product-lead>
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
  - finance
sources:
  - <source path or system://query as_of:date>
source_drift: false
verification_stale: false
has_contradiction: null
confidence: high
---

# <Edition / package name>

> Template for edition / package pages. Replace frontmatter and content, remove this blockquote.

## Summary

<One paragraph: target customer profile, price point, headline value.>

## Included SKUs

| SKU | Included? | Notes |
|---|---|---|
| `<sku-slug>` | ✅ | |
| `<sku-slug>` | ✅ with limits | `<limit>` |
| `<sku-slug>` | ❌ (add-on) | |

Links: see [`shared/product-and-packaging/skus/`](./skus/).

## Usage limits

- `<limit 1 — e.g., 10K API calls/month>`
- `<limit 2 — e.g., 5 seats>`
- `<limit 3 — e.g., 30-day data retention>`

## Who it's for

- **Target segment**: `<smb / mid-market / enterprise>`
- **Typical buyer**: link to [persona](../personas/) pages
- **Not a fit when**: `<disqualifiers>`

## Motion-specific notes

### PLG onboarding  {motion: plg}

<Self-serve signup, trial, activation flow, paywalls.>

### Sales-assisted onboarding  {motion: sales-assisted}

<How an AE positions this edition, negotiation levers.>

## Upgrade path

- **From**: `<previous edition>`
- **To**: `<next edition>`
- **Triggers**: `<signals that indicate an upgrade is ready>`

## Related

- [`shared/pricing/`](../pricing/) — pricing for this edition
- [`shared/product-and-packaging/skus/`](./skus/) — SKU specs

## Change log

- `<YYYY-MM-DD>` — `<change summary>` [source: <PR>]
