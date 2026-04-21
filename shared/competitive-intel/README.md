---
type: meta
title: Competitive Intelligence
description: Competitor profiles and cross-competitor win-loss patterns. Battlecards downstream in functions/sales/.
owner: rasmus@latentflows.com
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

- **[`competitors/`](competitors/).** One file per competitor. Profile, positioning, strengths, weaknesses, our counter-positioning.
- **[`win-loss-patterns.md`](win-loss-patterns.md).** Cross-competitor patterns observed from closed deals. What correlates with wins or losses, independent of which competitor.

## Ownership

- **Owner**: Marketing lead (primary research).
- **Co-authors**: Sales lead (deal-level evidence), Product lead (product truth).
- **Consumers**: Marketing, Sales, CS, Product.

## What's sourced where

- **Profile.** Public sources (website, pricing page, docs, analyst reports), enriched with deal-level evidence from closed-won and closed-lost.
- **Strengths and weaknesses.** From win-loss interviews and Gong call patterns where the competitor was mentioned.
- **Counter-positioning.** From tested sales plays and marketing content that converted against this competitor.
- **Pricing signals.** From deal-level head-to-head evidence with named confidence.

## Review cadence

- **Quarterly per competitor.** Refresh profile against current public signals and recent deal evidence.
- **On major competitor event.** Funding round, pricing change, product launch, or acquisition: PR same week.
- **On losing streak.** If we lose 3+ head-to-head deals to a single competitor in 30 days, open a counter-positioning PR regardless of cadence.

## Change class

- **Profile updates.** Routine. Can auto-merge at Stage 2+.
- **Counter-positioning changes.** Always PR. Strategic content.
- **New competitor page.** Always PR.

## Related

- [`../positioning/`](../positioning/), our positioning we're differentiating
- [`../../functions/sales/`](../../functions/sales/) (Phase 1), battlecards and objection handlers
- [`../../functions/FUTURE-FUNCTIONS.md`](../../functions/FUTURE-FUNCTIONS.md), where the marketing function (competitive content, category narrative) is described.
