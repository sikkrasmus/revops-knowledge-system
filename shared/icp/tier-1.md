---
type: icp
title: Tier 1 ICP, prime-fit profile
description: Tier 1 ICP for the prime-fit addressable segment. Abstract Phase 0 example.
owner: rasmus@latentflows.com
reviewers:
  - revops-lead
  - sales-lead
  - marketing-lead
last_reviewed: 2026-04-19
verified_until: 2026-07-19
motion:
  - sales-assisted
  - enterprise
segment:
  - mid-market
  - enterprise
consumers:
  - marketing
  - sales
  - cs
  - finance
  - product
sources:
  - sources/internal-docs/README.md
source_drift: false
verification_stale: false
has_contradiction: null
confidence: medium
---

# Tier 1 ICP, prime-fit profile

> Phase 0 abstract example. Replace ranges and triggers with real numbers when forking.

## Summary

Tier 1 is the prime-fit segment. These are the companies where the product's unit economics, buyer composition, and technographic context most cleanly match an accelerated sales path. Concentrated outbound, inbound conversion priority, dedicated CS.

## Firmographics

- **ARR band**: `<e.g., $25 to $100M>` [source: sources/internal-docs/README.md]
- **Employee count**: `<e.g., 150 to 800>`
- **Headquarters / region**: North America, UK, Western Europe
- **Funding stage**: Series B+ or equivalent (profitable with board, PE-backed, or public)
- **Vertical concentration**: `<top 3 verticals>`. Not a hard gate, used as a prioritization signal.

## Technographics

- **CRM**: HubSpot or Salesforce, active usage rather than legacy.
- **Data stack**: cloud data warehouse (Snowflake, BigQuery, or Redshift) in production
- **Adjacent tools**: `<any tools that integrate tightly with our product>`
- **Integration signals**: API-first posture; recent data-stack or RevOps investment

## Triggers (buying signals)

- Hired a new VP of RevOps, CRO, or Head of Data in the last 90 days [source: sources/internal-docs/README.md]
- Raised a growth round in the last 180 days
- Launched a second product line or expanded into a new segment
- Completed a tool consolidation (sunset a competitor) in the last 6 months
- Cited in a stakeholder's public content (podcast, post, case study) as having a pain in our category

## Disqualifiers (even if firmographics match)

- Pre-product-market-fit (under ~$10M ARR signals this)
- Single-product, single-segment, no growth engine
- Regulated industry we don't have compliance posture for
- Active procurement freeze
- See [`disqualifiers.md`](disqualifiers.md) for the full list

## Motion-specific variants

### Sales-assisted variant  {motion: sales-assisted}

Typical deal structure in this motion: 1 to 3 month sales cycle, $30 to $80K ACV, 1 to 2 year term. Evaluation involves a champion plus decision-maker plus one reviewer. Economic buyer typically VP-level.

### Enterprise variant  {motion: enterprise, segment: enterprise}

Longer cycle (4 to 9 months), $150 to $500K+ ACV, MSA-anchored, multi-year with ramp. Buying committee expands to include procurement, security, and legal.

## Related

- [`../personas/`](../personas/), buying-committee personas typical in this tier
- [`tier-2.md`](tier-2.md), the next-broader tier
- [`disqualifiers.md`](disqualifiers.md), hard exclusions
- [`../pricing/`](../pricing/), Tier 1 pricing guidance

## Change log

- 2026-04-19. Phase 0 abstract example scaffolded. Replace with real firmographics and triggers before using in production.
