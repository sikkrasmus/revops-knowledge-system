---
type: packaging
title: Editions, Starter / Growth / Enterprise
description: Edition definitions. SKU inclusions, usage limits, segment targeting.
owner: rasmus@latentflows.com
reviewers:
  - product-lead
  - revops-lead
  - finance-lead
last_reviewed: 2026-04-19
verified_until: 2026-07-19
motion:
  - plg
  - sales-assisted
  - enterprise
segment:
  - smb
  - mid-market
  - enterprise
consumers:
  - marketing
  - sales
  - cs
  - finance
sources:
  - sources/internal-docs/README.md
source_drift: false
verification_stale: false
has_contradiction: null
confidence: high
---

# Editions, Starter / Growth / Enterprise

> Phase 0 abstract example.

## Overview

Three editions. Starter targets self-serve and PLG entry. Growth targets sales-assisted mid-market. Enterprise targets MSA-anchored custom deals.

## Edition: Starter

- **Target**: SMB, self-serve, single-team usage.
- **SKUs included**: Core (with usage limits), Community support.
- **SKUs not included**: Advanced analytics, SSO/SAML, audit logs, enterprise integrations.
- **Usage limits**: `<e.g., 10 seats, 10K events per month, 30-day data retention>`.
- **Pricing model**: Monthly or annual self-serve. See [`../pricing/`](../pricing/).

## Edition: Growth

- **Target**: Mid-market, sales-assisted.
- **SKUs included**: Core (higher limits), Advanced analytics, Basic integrations.
- **Added limits lift**: `<e.g., up to 100 seats, 1M events per month, 12-month data retention>`.
- **Pricing model**: Annual contract, ACV typical $15 to $80K. Sales-assisted onboarding.

## Edition: Enterprise

- **Target**: Enterprise segment.
- **SKUs included**: All SKUs, all integrations, SSO/SAML, audit logs, dedicated account team.
- **Limits**: Custom per contract.
- **Pricing model**: MSA-anchored, multi-year typical. Legal review required. See [`../pricing/`](../pricing/) enterprise section.

## Upgrade paths

- **Starter to Growth.** Typical triggers: seat count exceeded, integration request that Starter cannot fulfill, user activity suggesting professional use case.
- **Growth to Enterprise.** Typical triggers: multi-entity or multi-region needs, SSO/SAML requirement, audit log or compliance requirement, usage volume exceeding Growth limits.

## Edition vs. add-on decisions

When a new capability ships: does it go in an existing edition (which one), become an add-on, or require a new edition? The decision rubric lives in [`add-ons.md`](add-ons.md). Default: start as an add-on to the highest-fit edition. Graduate to edition-included when attach rate crosses a threshold.

## Related

- [`skus/`](skus/), SKU-level specs
- [`add-ons.md`](add-ons.md), add-on structure
- [`../pricing/`](../pricing/), price points by edition
