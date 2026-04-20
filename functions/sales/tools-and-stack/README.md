---
type: function-readme
title: Sales tools and stack
description: Curated tool-category map for the Sales function. Categories with purpose and 1-2 representative tools per category; not a vendor endorsement list.
owner: rasmus@unfrankenstein.io
reviewers:
  - sales-lead
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
  - revops
sources:
  - sources/internal-docs/README.md
source_drift: false
verification_stale: false
has_contradiction: null
confidence: medium
---

# Sales tools and stack

A curated category map, not a vendor list. The page describes the categories a functioning sales stack typically spans, what each category is for, and — where useful — one or two representative tools that buyers in this segment commonly use. The page does not endorse specific vendors; endorsements belong in procurement documents, not in function documentation [source: sources/internal-docs/README.md].

The purpose is enablement: a new rep or a new Sales leader should read this page and understand the categorical shape of the stack they're joining, without being steered toward a specific vendor before they evaluate for themselves.

---

## The six categories

| Category | Purpose | Where tool-category choice affects deal outcomes |
|---|---|---|
| CRM | System of record for accounts, contacts, opportunities, activities | Every playbook reads and writes here; stale CRM = unusable forecast |
| Sequencer | Outbound cadence automation, email / LinkedIn / call orchestration | Directly affects [`../plays/outbound-sequence-mid-market.md`](../plays/outbound-sequence-mid-market.md) efficacy |
| Call recorder | Recording, transcription, and search across sales calls | Backs MEDDPICC evidence; enables postmortems and coaching |
| CPQ (configure-price-quote) | Quoting, pricing logic, approval routing, proposal generation | Enforces [`../../../shared/pricing/`](../../../shared/pricing/) and [`../frameworks/deal-desk-escalation.md`](../frameworks/deal-desk-escalation.md) |
| Deal desk tooling | Approval workflows, exception handling, deal review surfaces | Operationalizes deal-desk escalation and forecast methodology |
| Forecasting | Roll-up of opportunity data into commit / best-case / pipeline | Consumes MEDDPICC + stage + base rates per [`../frameworks/forecast-methodology.md`](../frameworks/forecast-methodology.md) |

Each category is discussed below. Representative tools are named sparingly — the category matters more than the vendor.

## CRM

The system of record. Everything downstream reads from CRM. A CRM with inconsistent data is a CRM that breaks the forecast and the pipeline; category choice matters less than the discipline of CRM hygiene [source: sources/internal-docs/README.md].

- **What good looks like.** Schema aligned to the shared data-definitions ([`../../../shared/data-definitions/`](../../../shared/data-definitions/)); account + opportunity + contact object consistent across reps; activity logging adequate for MEDDPICC inspection; backward-compatible reporting.
- **Representative tools.** Salesforce and HubSpot dominate this category at our tier. The choice between them is usually driven by existing org infrastructure, not Sales-function requirements.
- **Segment notes.** Enterprise defaults to Salesforce for committee-governance and complex reporting; mid-market is often HubSpot for ease of admin. Crossover deals exist in both directions.

## Sequencer

Outbound cadence orchestration. Reads from CRM, writes activity back, manages touch cadence across channels.

- **What good looks like.** Per-account personalization support (not just per-sequence); integrated with the CRM activity timeline; capable of cadence A/B testing without degrading deliverability; phone click-to-call and LinkedIn-adjacent touches.
- **Representative tools.** Outreach and Salesloft are the established options in this category; Apollo and a handful of mid-market-native alternatives occupy the lower tier.
- **Segment notes.** Mid-market sequences run hotter on automation; enterprise sequences are more hand-shaped per account. The tool matters less than the rep discipline around personalization — see [`../plays/outbound-sequence-mid-market.md`](../plays/outbound-sequence-mid-market.md).

## Call recorder

Recording, transcription, search. Backs MEDDPICC evidence and enables postmortems and coaching.

- **What good looks like.** Reliable recording across Zoom / Google Meet / Teams; searchable transcripts; speaker identification; integration with CRM at opportunity level; timestamp-accurate search; permission model that respects privacy laws.
- **Representative tools.** Gong is the category leader; Chorus (now part of ZoomInfo) and Clari Copilot occupy the second tier.
- **Segment notes.** Enterprise deployments require data residency controls, audit trails, and recording-consent workflows. Mid-market deployments weight transcript search and coaching workflows more.

## CPQ — configure-price-quote

Turns pricing rules into quoted proposals with approval routing. Enforces [`../../../shared/pricing/`](../../../shared/pricing/) mechanically; enforces [`../frameworks/deal-desk-escalation.md`](../frameworks/deal-desk-escalation.md) as workflow.

- **What good looks like.** Pricing logic driven by SKU / edition / tier; discount guardrails enforced at quote-generation time; approval routing automatic based on band; proposal output branded and legally clean; integration with CRM + e-sign.
- **Representative tools.** Salesforce CPQ and HubSpot native quoting are the default where the CRM choice has been made. Point CPQ tools (Conga, DealHub, Pricefx) arrive when the native option has become unworkable — usually at enterprise scale.
- **Segment notes.** Mid-market often operates without a dedicated CPQ — native CRM quoting plus discipline handles the volume. Enterprise without CPQ is a bottleneck; reps and deal desk spend hours per quote that the tool would do in minutes.

## Deal desk tooling

Operationalizes the approval workflows, exception handling, and deal-review surface for the Sales + RevOps + Finance triangle.

- **What good looks like.** Deal-desk request surface distinct from CRM opportunity record (keeps the CRM clean); SLA tracking on deal-desk response; aggregate reporting on exception patterns for quarterly policy review; integration with CPQ so exception requests reference the quote.
- **Representative tools.** Some orgs use a purpose-built tool; others operate deal desk in a combination of Slack channel + ticketing (Jira, Linear) + CPQ approval flow. Purpose-built tools arrive at scale when exception volume justifies them.
- **Segment notes.** Mid-market is usually informal — a dedicated Slack channel and a lightweight spreadsheet or ticketing. Enterprise requires tooling; exception volume and approval complexity otherwise eats deal desk's bandwidth.

## Forecasting

Takes opportunity data and produces weekly commit / best-case / pipeline numbers per [`../frameworks/forecast-methodology.md`](../frameworks/forecast-methodology.md).

- **What good looks like.** Opportunity-level forecast categorization surfaced to the rep (not just the manager); AI-assisted deal-risk surfacing that reads MEDDPICC completeness and engagement signals; historical accuracy feedback to the rep and manager; week-over-week change tracking.
- **Representative tools.** Clari and BoostUp lead this category at the enterprise tier. Some mid-market stacks use native CRM forecasting + a rep-self-forecast layer in a spreadsheet.
- **Segment notes.** Mid-market can run the forecast ritual without a dedicated tool — the forecast methodology works with spreadsheet inputs, provided MEDDPICC discipline is intact. Enterprise without dedicated forecasting tooling loses week-over-week visibility that managers rely on.

## Integration density as a category of its own

An under-named category: the integration wiring that connects CRM + sequencer + call recorder + CPQ + forecasting into a single operating surface. Most tool-stack pain at our segment is not "which tool to pick" but "how these tools talk to each other." The RevOps function owns this surface.

See [`../../../shared/personas/personas/head-of-revops.md`](../../../shared/personas/personas/head-of-revops.md) for the persona who drives this integration density.

## Authoring and maintenance rules

- **Categories are durable; tools are not.** This page is refreshed when a category's shape shifts (new category emerges, two categories collapse into one). Representative tools are refreshed when the landscape meaningfully changes.
- **No endorsements.** Representative tools are named for orientation; procurement decisions use real evaluation criteria against current pricing and requirements.
- **Not a comprehensive list.** Intentionally. The goal is to name the shape; a full vendor list becomes stale fast and invites false precision.
- **Segment notes over universal answers.** Mid-market and enterprise stacks look different at most of these categories; noting the difference helps more than pretending one shape fits all.

## Related

- [`../methodology/`](../methodology/) — MEDDPICC, which most of these tools exist to support
- [`../playbooks/`](../playbooks/) — stage playbooks that touch each tool
- [`../frameworks/`](../frameworks/) — forecast, deal-desk, and qualification frameworks the tooling operationalizes
- [`../../../shared/pricing/`](../../../shared/pricing/) — pricing rules CPQ enforces
- [`../../../shared/data-definitions/`](../../../shared/data-definitions/) — the data schema the CRM and forecasting should align to
- [`../../../shared/personas/personas/head-of-revops.md`](../../../shared/personas/personas/head-of-revops.md) — the persona who owns integration density

## Change log

- 2026-04-20 — Phase 1 category-map scaffold.
