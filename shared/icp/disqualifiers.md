---
type: icp
title: ICP Disqualifiers
description: Hard exclusions that override tier-match signals.
owner: rasmus@latentflows.com
reviewers:
  - revops-lead
  - sales-lead
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
  - legal
sources:
  - sources/internal-docs/README.md
source_drift: false
verification_stale: false
has_contradiction: null
confidence: high
---

# ICP Disqualifiers

Hard exclusions. A company that matches these is not an ICP, regardless of tier-match signals on firmographics or triggers. Unlike "Not a fit" signals (which vary by tier), disqualifiers are policy: marketing doesn't target them, sales doesn't pursue them, CS doesn't accept them if they self-serve in.

---

## Stage / size

- **Pre-product-market-fit** — typically under ~$5M ARR with customer concentration risk. The product isn't valuable yet.
- **Declining revenue** — companies losing net revenue and cutting budget. We'll be cut.

## Regulatory / compliance

- **Industries we lack compliance posture for** — `<e.g., fully-regulated banks, defense contractors, healthcare providers handling PHI>` when we can't meet the required controls.
- **Geographies we can't serve** — `<data residency requirements we don't meet>`.
- **Sanctions exposure** — OFAC-listed entities or ownership; referenced in [`../../functions/finance-legal/`](../../functions/finance-legal/) (Phase 2).

## Commercial

- **Active procurement freeze** — won't close.
- **Known-bad-payer** — referenced in finance's unpaid-invoice list (Phase 2).
- **Litigation against us or a peer in our category** — legal review always.

## Product fit

- **Competing product deeply embedded with a multi-year renewal just signed** — displacement cycle too long.
- **Required workflow we don't support and won't add** — specific product gap that kills the use case.

## Relational

- **Relationship with an active customer that creates a conflict** — CS surfaces this via the account graph.

## How to use this list

- **Marketing** — exclude disqualified accounts from targeting lists. Enforce at list-upload time.
- **Sales outbound** — sequence tools should filter on disqualifier flags where possible. AE does a manual check before sequencing.
- **Inbound qualification** — automatic disqualification of matching firmographic / domain signals; route to self-serve or politely decline.
- **CS** — if a disqualified account self-serves in, surface for review rather than onboarding.

## Sources

Disqualifier inputs:

- **Closed-lost analysis** [source: sources/internal-docs/README.md] — patterns where we lost and couldn't have won.
- **Churn postmortems** — accounts that churned because they shouldn't have closed.
- **Legal / compliance constraints** — from the legal function.
- **Finance constraints** — from the finance function.

## Review cadence

Quarterly review against the last 90 days of closed-lost and churn data. If a new pattern emerges, add it. If a historical disqualifier no longer holds, remove it.

## Related

- [`tier-1.md`](tier-1.md), [`tier-2.md`](tier-2.md), [`tier-3.md`](tier-3.md)
