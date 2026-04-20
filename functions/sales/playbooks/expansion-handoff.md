---
type: playbook
title: Expansion handoff playbook
description: Expansion handoff passes the signed customer from Sales to CS with enough context that expansion signals surface and renewal risk drops.
owner: rasmus@unfrankenstein.io
reviewers:
  - sales-lead
  - cs-lead
  - revops-lead
last_reviewed: 2026-04-20
verified_until: 2026-10-20
motion:
  - sales-assisted
  - enterprise
segment:
  - mid-market
  - enterprise
consumers:
  - sales
  - cs
  - revops
sources:
  - sources/internal-docs/README.md
source_drift: false
verification_stale: false
has_contradiction: null
confidence: high
---

# Expansion handoff playbook

Expansion handoff is the bridge between Sales-closed and CS-owned. Done well, CS starts with a full picture of the buyer's business case, success criteria, committee, and risks — and expansion signals are easier to spot early. Done poorly, CS rebuilds context from scratch, the customer tells their story three times, and expansion opportunities die in the seams [source: sources/internal-docs/README.md].

A structured handoff is the single highest-leverage ritual for NRR — see [`../../../shared/data-definitions/metrics/nrr.md`](../../../shared/data-definitions/metrics/nrr.md) for the definition NRR is measured against.

---

## Entry criteria

- Close exit criteria met ([`close.md`](close.md)).
- CS kickoff task triggered in CRM with a named CS owner.
- MEDDPICC final snapshot written.

## What expansion handoff produces

- A written handoff doc covering account, buyer committee, pain, metrics, success criteria, deployment plan, risks.
- A joint kickoff meeting on the calendar within 5 business days of signature.
- CS-owned 30/60/90 plan aligned to the customer's success criteria.
- Named expansion-watch signals (what to monitor) and the timeframe over which to monitor them.

## MEDDPICC letters this stage references

Handoff does not fill letters — it transfers the closed snapshot so CS can keep the story straight when expansion conversations begin. Metrics and Identify pain are especially load-bearing: they are the north star for customer success and the starting frame for expansion and renewal.

## The handoff artifact

A single shared doc (template in [`../../../schema/page-templates/sales/champion-profile.md`](../../../schema/page-templates/sales/champion-profile.md) captures the champion portion; the rest is structured prose). Canonical sections:

1. **Account shape.** Tier, segment, motion, ACV, term, edition, add-ons, SKUs.
2. **Committee map.** Economic buyer, champion, technical evaluator, security / procurement / legal contacts. Names, titles, roles in the purchase, observed disposition.
3. **Pain and metric.** The pain in the buyer's words; the metric with baseline, target, deadline, owner.
4. **Success criteria.** What the buyer said has to be true for this to be a success.
5. **Deployment plan.** Technical scope, integrations, timelines, dependencies.
6. **Committed mutual plan.** The close-period mutual close plan, carried forward into the first 30 days.
7. **Risks and watches.** Political risk (champion turnover, org change), technical risk, competitor presence elsewhere in the account, public events (funding, acquisition, exec departures).
8. **Expansion-watch signals.** Concrete triggers for upsell / cross-sell conversations — seat utilization, feature adoption, segment expansion signals, executive sponsor asks.
9. **Reference posture.** Was reference-call right granted? Under what conditions? When to ask for the first reference.
10. **Sales-era evidence links.** Call recordings, email threads, demo sandboxes, evaluation artifacts.

## The joint kickoff call

A 45-60 minute call within 5 business days of signature. Customer-facing participants: champion, economic buyer (if possible), technical lead. Our side: AE (attending, not running), CS owner (leading), solutions / implementation lead.

- AE introduces CS owner as the customer's new primary contact.
- CS owner walks the success criteria — not the product. Customer confirms or adjusts.
- Customer names their success metric owner.
- A 30/60/90 milestone plan is co-committed with named dates.
- AE commits to the expansion-watch cadence with CS — typically a 60-day check-in, 6-month pre-renewal review, and ad-hoc signal triggers.

## Common failure modes

- **AE disengages immediately.** CS rebuilds context; customer repeats the story; trust leaks. The AE does not go dark after signature; the AE co-walks the first 30 days.
- **No joint kickoff.** CS meets the customer cold; the champion has to re-earn credibility.
- **Success criteria dropped.** CS focuses on technical deployment; the buyer's business metric goes unwatched.
- **Committee map not transferred.** CS doesn't know who the economic buyer is; six months later the EB leaves and the renewal is in trouble.
- **No expansion signals named.** Expansion conversations start when there's a budget event rather than when utilization says there's demand.

## Exit criteria (binary)

- [ ] Handoff doc written and filed in the customer account in CRM.
- [ ] Joint kickoff completed; 30/60/90 plan agreed.
- [ ] CS owner confirmed; AE role in first 30 days confirmed.
- [ ] Expansion-watch signals listed with named timeframe.
- [ ] Renewal date on calendar with a pre-renewal review ≥90 days before (enterprise) or ≥45 days before (mid-market).

## Motion and segment variants

### Mid-market sales-assisted variant  {motion: sales-assisted, segment: mid-market}

- Handoff doc is condensed — 1-2 pages.
- Joint kickoff is 45 minutes; often also serves as onboarding start.
- CS ownership is pooled or low-touch; expansion-watch signals are mostly behavioral (seat utilization, feature adoption).
- AE stays engaged through 30-day mark, then steps back.

### Enterprise variant  {motion: enterprise, segment: enterprise}

- Handoff doc is 4-8 pages with appendices (architecture diagram, security posture, executive bios).
- Dedicated CS manager and onboarding manager; joint kickoff is 60-90 minutes.
- 30/60/90 plan is formal with executive sponsor buy-in.
- Executive business reviews (EBRs) scheduled at 90 and 180 days.
- AE stays peripherally engaged through first EBR, then hands off fully.

## Shared-spine inputs

- [`../../../shared/data-definitions/metrics/nrr.md`](../../../shared/data-definitions/metrics/nrr.md) — the metric this ritual protects
- [`../../../shared/personas/buying-committees/`](../../../shared/personas/buying-committees/) — committee frame used in the handoff doc
- [`../../../shared/product-and-packaging/`](../../../shared/product-and-packaging/) — SKU and add-on context CS inherits

## Related

- [`../methodology/`](../methodology/) — MEDDPICC snapshot carried forward
- [`close.md`](close.md) — entry stage
- [`../plays/`](../plays/) — renewal-acceleration and expansion plays that consume this handoff

## Change log

- 2026-04-20 — Phase 1 initial page.
