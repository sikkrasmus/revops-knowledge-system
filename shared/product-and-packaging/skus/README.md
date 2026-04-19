---
type: meta
title: SKUs
description: One file per SKU. Use the shared product-sku page template.
owner: rasmus@unfrankenstein.io
last_reviewed: 2026-04-19
---

# SKUs

One file per SKU. Use [`../../../schema/page-templates/shared/product-sku.md`](../../../schema/page-templates/shared/product-sku.md) as the template.

Phase 0 ships the template and this README. In-production forks fill this directory with actual SKU specs.

## Naming convention

- `<sku-slug>.md` — lowercase, hyphenated, matches the billing-system SKU identifier where possible.

## When to create a new SKU page

- New SKU ships in a release → PR to create the page as part of the release process.
- Existing SKU changes materially (capabilities added or removed) → PR to update.
- SKU is retired → PR to mark deprecated; don't delete for at least 2 renewal cycles (downstream references).

## Related

- [`../editions.md`](../editions.md) — which editions include which SKUs
- [`../add-ons.md`](../add-ons.md) — add-on structure
- [`../../pricing/`](../../pricing/) — pricing
