---
type: meta
title: ICP
description: Tiered ICP (A/B/C) with firmographics, technographics, triggers, disqualifiers.
owner: rasmus@latentflows.com
reviewers:
  - revops-lead
  - sales-lead
  - marketing-lead
last_reviewed: 2026-04-19
verified_until: 2026-10-19
---

# ICP

Tiered Ideal Customer Profile. Shared by Marketing (targeting), Sales (qualification), CS (fit and churn risk), Finance (segmentation), Product (prioritization).

Template: [`../../schema/page-templates/shared/icp.md`](../../schema/page-templates/shared/icp.md).

---

## Tier structure

One ICP artifact per tier. Three tiers:

- **[Tier 1](tier-1.md)** — prime fit. Concentrated focus for outbound, inbound conversion priority, dedicated CS.
- **[Tier 2](tier-2.md)** — broader addressable market. ABM/demand-gen territory. Conversion + CS at scale.
- **[Tier 3](tier-3.md)** — qualified opportunities when they self-serve in. Minimal outbound.

Marketing typically targets Tier 1 + Tier 2. Sales qualifies tight to Tier 1 in outbound and Tier 1 + 2 in inbound. CS treats Tier 1 with dedicated coverage; Tier 2 with pooled; Tier 3 with self-serve.

## Disqualifiers

See [`disqualifiers.md`](disqualifiers.md). Across all tiers — companies we don't sell to regardless of tier-match signals. Captures hard exclusions (regulated industries we're not cleared for, too-small ARR bands, geographies we don't support).

## Ownership

- **Owner**: RevOps lead (single accountability).
- **Co-authors**: Sales lead, Marketing lead.
- **Consumers**: Marketing, Sales, CS, Finance, Product.

Changes to ICP tiers always PR (per `PRINCIPLES.md` §6). Reviewer routing: RevOps lead first, Sales + Marketing tagged.

## What's sourced where

- **Firmographics** — from HubSpot/Salesforce closed-won analysis, enriched with Clearbit / Apollo.
- **Triggers** — from Gong call transcripts (what the buyer said triggered their search), plus external intent data (G2, Bombora, 6sense).
- **Disqualifiers** — from closed-lost analysis, churn postmortems, and regulatory/contractual constraints.

Source references are claim-level. Every firmographic range, every trigger, every disqualifier cites the source it came from.

## Review cadence

- **Quarterly** — re-verify firmographic bands against closed-won data. Update `last_reviewed` and extend `verified_until`.
- **On strategy shift** — new segment, new vertical, new motion: full tier re-evaluation.
- **On drift signal** — when closed-won patterns diverge materially from the tier definition (detected by lint), open a PR.

## Related

- [`../personas/`](../personas/) — buying-committee personas for each tier
- [`../pricing/`](../pricing/) — tier-specific pricing guidance and guardrails
- [`../positioning/`](../positioning/) — tier-specific positioning
