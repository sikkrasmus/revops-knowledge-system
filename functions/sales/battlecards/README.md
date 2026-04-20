---
type: function-readme
title: Sales battlecards
description: One battlecard per competitor. Deployable counter-positioning for AEs in active deals. Stale fast; re-verified quarterly.
owner: rasmus@latentflows.com
reviewers:
  - sales-lead
  - marketing-lead
  - product-lead
last_reviewed: 2026-04-20
verified_until: 2026-07-20
motion:
  - sales-assisted
  - enterprise
segment:
  - mid-market
  - enterprise
consumers:
  - sales
  - marketing
  - cs
sources:
  - sources/internal-docs/README.md
source_drift: false
verification_stale: false
has_contradiction: null
confidence: medium
---

# Sales battlecards

One battlecard per competitor. A battlecard tells an AE, in a deal happening right now, where we win, where we lose, how to counter-position, and which traps to avoid. It is derived from the shared competitive-intel spine — a battlecard never invents claims, it operationalizes what the spine already carries.

Battlecards stale fast. The verification window for this directory is **90 days** — competitors ship, positioning shifts, prior patterns stop holding. Every battlecard is re-verified against closed-deal evidence quarterly, at minimum. Stale battlecards damage deals because reps deploy out-of-date counter-positioning [source: sources/internal-docs/README.md].

---

## What a battlecard is for

- **In-deal reference.** AE pulls the card before a demo, an objection call, or a competitive proposal moment.
- **Onboarding.** New reps learn the competitive landscape by reading the cards.
- **Signal aggregation.** Patterns across cards reveal structural competitive shifts — if three cards cite the same counter-claim, that's a narrative issue for Marketing.

## What a battlecard is not

- **Not a pitch deck.** Battlecards are internal. They contain honest assessments, including where we lose.
- **Not a source of truth on the competitor.** The canonical competitor profile lives in [`../../../shared/competitive-intel/competitors/`](../../../shared/competitive-intel/competitors/). Battlecards cite it; they don't duplicate it.
- **Not a place to encode rep opinion.** Every claim on a battlecard is sourced — call evidence, closed-deal data, a public artifact, or a competitive-intel entry.

## Structure

Every battlecard uses the template in [`../../../schema/page-templates/sales/battlecard.md`](../../../schema/page-templates/sales/battlecard.md). Sections are:

1. When to deploy
2. Competitor in one paragraph (references the canonical profile)
3. Where we win (cited)
4. Where they win (cited)
5. Counter-positioning tactics
6. Traps to avoid
7. Segment variants (via section labels)
8. Related links
9. Change log

## Authoring rules

- **Cite the canonical competitor profile.** Every battlecard links to the matching entry under [`../../../shared/competitive-intel/competitors/`](../../../shared/competitive-intel/competitors/). No unattached battlecards.
- **Every "we win" claim is sourced.** Win-loss patterns ([`../../../shared/competitive-intel/win-loss-patterns.md`](../../../shared/competitive-intel/win-loss-patterns.md)), closed-deal data, or a specific call recording.
- **Write the "where they win" section honestly.** A battlecard that claims we dominate on every axis is untrusted by AEs and useless in a deal.
- **Abstract competitor names in Phase 1.** Battlecards in this directory use abstract labels (`Competitor X — enterprise incumbent`, `Competitor Y — modern challenger`). Named real competitors arrive with the Phase 3 synthetic-company instance per [`../../../PHASES.md`](../../../PHASES.md).
- **Re-verify quarterly.** Each battlecard's `verified_until` is 90 days from `last_reviewed`. `ci stale` surfaces expiries; Sales lead owns the refresh cadence.

## Phase 1 content

- [`competitor-x-enterprise-incumbent.md`](competitor-x-enterprise-incumbent.md) — one worked battlecard demonstrating the template against an abstract competitor archetype. Intended as a reference shape for downstream battlecards rather than a production card against a specific vendor.

## Related

- [`../../../shared/competitive-intel/`](../../../shared/competitive-intel/) — competitor profiles and win-loss patterns this directory consumes
- [`../../../schema/page-templates/sales/battlecard.md`](../../../schema/page-templates/sales/battlecard.md) — template for new cards
- [`../plays/competitive-displacement.md`](../plays/competitive-displacement.md) — the displacement play that deploys these cards
- [`../objections/`](../objections/) — objection-handling sometimes overlaps with competitive counter-positioning

## Change log

- 2026-04-20 — Phase 1 scaffold. One worked battlecard included as a reference shape.
