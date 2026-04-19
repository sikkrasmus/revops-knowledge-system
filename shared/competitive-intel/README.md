---
type: meta
title: Competitive Intelligence
description: Competitor profiles and cross-competitor win-loss patterns. Battlecards downstream in functions/sales/.
owner: rasmus@unfrankenstein.io
reviewers:
  - marketing-lead
  - sales-lead
  - product-lead
last_reviewed: 2026-04-19
verified_until: 2026-07-19
---

# Competitive Intelligence

Competitor profiles and cross-competitor win-loss patterns. This directory holds the shared competitive context that every function reads from. Sales-specific battlecards (opener, trap-set, objection counter) live downstream in [`functions/sales/`](../../functions/sales/) (Phase 1).

Template: [`../../schema/page-templates/shared/competitor.md`](../../schema/page-templates/shared/competitor.md).

---

## Structure

- **[`competitors/`](competitors/)** — one file per competitor. Profile, positioning, strengths, weaknesses, our counter-positioning.
- **[`win-loss-patterns.md`](win-loss-patterns.md)** — cross-competitor patterns observed from closed deals. What correlates with wins / losses, independent of which competitor.

## Ownership

- **Owner**: Marketing lead (primary research).
- **Co-authors**: Sales lead (deal-level evidence), Product lead (product truth).
- **Consumers**: Marketing, Sales, CS, Product.

## What's sourced where

- **Profile** — public sources (website, pricing page, docs, analyst reports), enriched with deal-level evidence from closed-won and closed-lost.
- **Strengths / weaknesses** — from win-loss interviews and Gong call patterns where the competitor was mentioned.
- **Counter-positioning** — from tested sales plays and marketing content that converted against this competitor.
- **Pricing signals** — from deal-level head-to-head evidence with named confidence.

## Review cadence

- **Quarterly per competitor** — refresh profile against current public signals and recent deal evidence.
- **On major competitor event** — funding round, pricing change, product launch, acquisition: PR same week.
- **On losing streak** — if we lose 3+ head-to-head deals to a single competitor in 30 days, open a counter-positioning PR regardless of cadence.

## Change class

- **Profile updates** — routine, can auto-merge at Stage 2+.
- **Counter-positioning changes** — always PR. Strategic content.
- **New competitor page** — always PR.

## Related

- [`../positioning/`](../positioning/) — our positioning we're differentiating
- [`../../functions/sales/`](../../functions/sales/) (Phase 1) — battlecards, objection handlers
- [`../../functions/marketing/`](../../functions/marketing/) (Phase 2) — competitive content, category narrative
