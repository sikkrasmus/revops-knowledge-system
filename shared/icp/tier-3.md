---
type: icp
title: Tier 3 ICP — opportunistic / self-serve-qualified
description: Tier 3 ICP — minimal outbound, self-serve conversion when signals align.
owner: rasmus@latentflows.com
reviewers:
  - revops-lead
  - marketing-lead
last_reviewed: 2026-04-19
verified_until: 2026-07-19
motion:
  - plg
  - sales-assisted
segment:
  - smb
  - mid-market
consumers:
  - marketing
  - sales
  - cs
sources:
  - sources/internal-docs/README.md
source_drift: false
verification_stale: false
has_contradiction: null
confidence: medium
---

# Tier 3 ICP — opportunistic / self-serve-qualified

> Phase 0 abstract example.

## Summary

Tier 3 is the tail of the addressable market. We don't spend outbound effort here, but if a qualified-looking account self-serves in, it deserves appropriate treatment. CS is pooled or self-serve; expansion potential is low-to-moderate per account but real at volume.

## Firmographics

- **ARR band**: `<e.g., $1-10M>`
- **Employee count**: `<e.g., 20-80>`
- **Funding stage**: Seed+ with product-market fit signal

## Why Tier 3, not higher

Typically one or more of:

- Below the cost-to-serve floor of sales-assisted
- Unit economics only work with self-serve or low-touch motion
- Product footprint sufficient but buying-committee composition not yet there

## Motion variants

### PLG variant  {motion: plg}

Self-signup, product-qualified-lead handoff only when expansion triggers fire. See [`../pricing/`](../pricing/) PLG pricing.

## When a Tier 3 account should be promoted

Promotion signals to Tier 2:

- ARR growth puts them in Tier 2 firmographic band
- They hire into a qualifying role (new VP RevOps / Head of Data)
- Usage expansion crosses a seat/volume threshold indicating budget authority

## Related

- [`tier-1.md`](tier-1.md), [`tier-2.md`](tier-2.md)
- [`../pricing/`](../pricing/) — self-serve pricing
