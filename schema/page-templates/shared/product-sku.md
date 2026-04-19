---
type: sku
title: "<SKU name>"
description: "<one-line summary of what this SKU is and who it's for>."
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

# <SKU name>

> Template for individual SKU pages. Replace frontmatter and content, remove this blockquote.

## What it is

<One paragraph: what the product does, primary use case, differentiator.>

## Feature list

- `<feature 1>`
- `<feature 2>`
- `<feature 3>`

## Included in editions

- **Starter**: ❌ / ✅
- **Growth**: ❌ / ✅
- **Enterprise**: ❌ / ✅

(See [`shared/product-and-packaging/editions.md`](./editions.md).)

## Add-on availability

- Available as add-on to: `<list editions>`
- Add-on price: see [`shared/pricing/price-book.md`](../pricing/price-book.md)

## Dependencies

- **Requires**: `<other SKUs or components>`
- **Incompatible with**: `<if any>`

## Known limitations

- `<limitation 1>` [source: ...]
- `<limitation 2>` [source: ...]

## Roadmap

- **Current version**: `<version>`
- **Next major release**: `<date and theme>`

## Related

- [`shared/pricing/`](../pricing/) — pricing for this SKU
- [`shared/positioning/`](../positioning/) — positioning and messaging

## Change log

- `<YYYY-MM-DD>` — `<change summary>` [source: <PR>]
