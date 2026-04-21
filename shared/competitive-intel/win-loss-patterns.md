---
type: win-loss-pattern
title: Cross-competitor win-loss patterns
description: Observed patterns from closed deals. What correlates with wins and losses.
owner: rasmus@latentflows.com
reviewers:
  - marketing-lead
  - sales-lead
  - revops-lead
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
  - product
sources:
  - sources/internal-docs/README.md
source_drift: false
verification_stale: false
has_contradiction: null
confidence: medium
---

# Cross-competitor win-loss patterns

> Phase 0 abstract example. Replace with real observed patterns from closed-deal data when forking.

## Patterns that correlate with wins

### Pattern W1, multi-product evaluation

When the buyer is evaluating for multi-product or multi-team rollout, we win at a 1.6x higher rate than single-team evaluations [source: sources/internal-docs/README.md]. The pattern holds across competitors.

Implication: qualify for multi-team scope early. If single-team, set expectations about the landing narrative.

### Pattern W2, new-hire champion in first 90 days

Deals where the champion is net-new to their role (<90 days) close at 1.4x the baseline rate. New-role champions prioritize tooling decisions as a quick win.

Implication: track hiring signals in target accounts. Time outbound to new-hire windows.

### Pattern W3, second-generation RevOps investment

Companies that have had at least one previous RevOps tooling investment that did not stick close at a higher rate. They have learned what to look for, so "we've been burned before" reads as a buying signal rather than a disqualifier.

Implication: lead with risk-mitigation and incremental-trust language with these buyers.

## Patterns that correlate with losses

### Pattern L1, single-stakeholder evaluation

Deals where only one person is involved from the buyer side close at half the baseline rate and churn at twice the rate post-close.

Implication: push to expand the committee in discovery. Disqualify deals that stay single-stakeholder through evaluation.

### Pattern L2, pricing discussion in first meeting

Deals where the buyer anchors on pricing in the first call close at 0.7x the baseline rate. Pricing-first buyers are usually shopping rather than buying.

Implication: redirect pricing conversations to discovery in meeting one. Reschedule a later call for commercial.

### Pattern L3, procurement involvement before technical fit confirmed

Deals where procurement enters before the technical buyer confirms fit stall or lose at high rates.

Implication: flag when procurement contacts us. Route to AE to slow-walk and re-engage the technical buyer.

## Competitor-independent wins

When we lose head-to-head but do not lose to a specific competitor ("evaluated, chose to build internally" or "deprioritized the initiative"):

- Most common cause: business case not made strong enough for the CFO.
- Counter: invest more in ROI models and reference stories with named financial outcomes.

## Freshness

Patterns extracted from rolling 12-month closed-deal analysis. Re-verified quarterly via `ci verify` lint against current deal data. If a pattern strength drops below a significance threshold, demote it to a hypothesis or remove.

## Related

- [`competitors/`](competitors/), per-competitor profiles
- [`../positioning/`](../positioning/), positioning we use against these patterns
- [`../../functions/sales/`](../../functions/sales/) (Phase 1), playbooks informed by these patterns
