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

- **[Tier 1](tier-1.md).** Prime fit. Concentrated outbound, inbound conversion priority, dedicated CS.
- **[Tier 2](tier-2.md).** Broader addressable market. ABM and demand-gen territory. Conversion and CS at scale.
- **[Tier 3](tier-3.md).** Qualified opportunities when they self-serve in. Minimal outbound.

Marketing typically targets Tier 1 and Tier 2. Sales qualifies tight to Tier 1 in outbound, opens to Tier 1 and 2 in inbound. CS gives Tier 1 dedicated coverage, Tier 2 pooled coverage, Tier 3 self-serve.

## Disqualifiers

See [`disqualifiers.md`](disqualifiers.md). Hard exclusions that apply across every tier (regulated industries we are not cleared for, ARR bands below our cost-to-serve floor, geographies we cannot support).

## Ownership

- **Owner**: RevOps lead (single accountability).
- **Co-authors**: Sales lead, Marketing lead.
- **Consumers**: Marketing, Sales, CS, Finance, Product.

Changes to ICP tiers always PR (per `PRINCIPLES.md` §6). Reviewer routing: RevOps lead first, Sales + Marketing tagged.

## What's sourced where

- **Firmographics.** From HubSpot or Salesforce closed-won analysis, enriched with Clearbit or Apollo.
- **Triggers.** From Gong call transcripts (what the buyer said triggered their search), plus external intent data (G2, Bombora, 6sense).
- **Disqualifiers.** From closed-lost analysis, churn postmortems, and regulatory or contractual constraints.

Source references are claim-level. Every firmographic range, every trigger, every disqualifier cites the source it came from.

## Review cadence

- **Quarterly.** Re-verify firmographic bands against closed-won data. Update `last_reviewed` and extend `verified_until`.
- **On strategy shift.** New segment, new vertical, or new motion triggers a full tier re-evaluation.
- **On drift signal.** When closed-won patterns diverge materially from the tier definition (detected by lint), open a PR.

## Related

- [`../personas/`](../personas/), the buying-committee personas for each tier
- [`../pricing/`](../pricing/), tier-specific pricing guidance and guardrails
- [`../positioning/`](../positioning/), tier-specific positioning
