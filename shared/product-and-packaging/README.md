---
type: meta
title: Product and Packaging
description: SKUs, editions, and add-ons. The product spine referenced by every function.
owner: rasmus@latentflows.com
reviewers:
  - product-lead
  - revops-lead
  - finance-lead
last_reviewed: 2026-04-19
verified_until: 2026-10-19
---

# Product and Packaging

SKUs, editions, and add-ons. The product spine that pricing, positioning, sales playbooks, and CS expansion all reference.

Templates: [`../../schema/page-templates/shared/product-sku.md`](../../schema/page-templates/shared/product-sku.md), [`../../schema/page-templates/shared/packaging.md`](../../schema/page-templates/shared/packaging.md).

---

## Structure

- **[`skus/`](skus/).** One file per SKU. Core product capabilities, add-ons, and integrations sold as SKUs.
- **[`editions.md`](editions.md).** Edition definitions (Starter, Growth, Enterprise, or equivalent). Which SKUs are included, usage limits, upgrade paths.
- **[`add-ons.md`](add-ons.md).** Add-ons that extend editions. What each is, which editions it attaches to, pricing reference.

## Ownership

- **Owner**: Product lead (primary accountability for what the SKUs are).
- **Co-authors**: RevOps lead (packaging decisions intersect GTM), Finance lead (revenue recognition implications).
- **Consumers**: All functions. Every function references product spec in some form.

## Change management

SKU renames, edition re-packaging, and add-on restructures have outsized downstream impact. Every page in the corpus that cites a SKU or edition needs update when these change. `ci graph` enumerates the dependency set before a PR merges.

**Never rename or restructure without a PR issue that lists every affected page.** Breaks cascades fast.

## What's sourced where

- **SKU capabilities.** From product PRDs, release notes, and in-product documentation.
- **Edition inclusions.** From packaging decisions logged in the product or pricing committee.
- **Usage limits.** From the billing system (source of truth) cross-referenced with the packaging doc.
- **Known limitations.** From support ticket patterns and postmortem analyses.

## Review cadence

- **On release.** Every product release that adds, removes, or changes SKU behavior triggers a PR to the SKU page as part of the release process.
- **Quarterly.** Edition-level re-verification against the billing system. Catch drift between documented inclusions and actual entitlement enforcement.
- **On packaging change.** Full re-verification of all downstream pages.

## Related

- [`../pricing/`](../pricing/), pricing attaches to SKUs and editions
- [`../positioning/`](../positioning/), positioning attaches to SKUs
- [`../../functions/sales/`](../../functions/sales/) (Phase 1), sales plays reference SKUs
- [`../../functions/FUTURE-FUNCTIONS.md`](../../functions/FUTURE-FUNCTIONS.md), where the customer success function (expansion plays that reference add-ons) is described.
