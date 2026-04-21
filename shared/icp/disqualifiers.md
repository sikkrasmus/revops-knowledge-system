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

## Stage and size

- **Pre-product-market-fit.** Typically under ~$5M ARR with customer concentration risk. The product is not valuable enough to them yet.
- **Declining revenue.** Companies losing net revenue and cutting budget. We will be cut.

## Regulatory and compliance

- **Industries we lack compliance posture for.** `<e.g., fully-regulated banks, defense contractors, healthcare providers handling PHI>` when we cannot meet the required controls.
- **Geographies we cannot serve.** `<data residency requirements we do not meet>`.
- **Sanctions exposure**, OFAC-listed entities or ownership. The finance and legal function (described in [`../../functions/FUTURE-FUNCTIONS.md`](../../functions/FUTURE-FUNCTIONS.md)) owns the screening policy when filled.

## Commercial

- **Active procurement freeze.** Will not close.
- **Known-bad-payer.** Referenced in finance's unpaid-invoice list.
- **Litigation against us or a peer in our category.** Always routes to legal review.

## Product fit

- **Competing product deeply embedded with a multi-year renewal just signed.** Displacement cycle is too long.
- **Required workflow we do not support and will not add.** A specific product gap kills the use case.

## Relational

- **Relationship with an active customer that creates a conflict.** CS surfaces this via the account graph.

## How to use this list

- **Marketing.** Exclude disqualified accounts from targeting lists. Enforce at list-upload time.
- **Sales outbound.** Sequence tools should filter on disqualifier flags where possible. AE does a manual check before sequencing.
- **Inbound qualification.** Automatic disqualification of matching firmographic or domain signals. Route to self-serve or politely decline.
- **CS.** If a disqualified account self-serves in, surface for review rather than onboarding.

## Sources

Disqualifier inputs:

- **Closed-lost analysis** [source: sources/internal-docs/README.md]. Patterns where we lost and could not have won.
- **Churn postmortems.** Accounts that churned because they should not have closed.
- **Legal and compliance constraints.** From the legal function.
- **Finance constraints.** From the finance function.

## Review cadence

Quarterly review against the last 90 days of closed-lost and churn data. If a new pattern emerges, add it. If a historical disqualifier no longer holds, remove it.

## Related

- [`tier-1.md`](tier-1.md), [`tier-2.md`](tier-2.md), [`tier-3.md`](tier-3.md)
