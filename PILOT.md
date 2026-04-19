---
type: meta
title: Pilot implementation
description: Paid pilot — fork this framework into production in 4-6 weeks, with direct implementation support.
owner: rasmus@unfrankenstein.io
last_reviewed: 2026-04-19
---

# Pilot Implementation

I'm taking 3 companies through a Company Index implementation as paid pilots.

**2 of 3 spots remaining.**

The framework in this repo is open and free. The pilot is paid implementation: I do the work alongside your team so you ship in 6 weeks instead of 6 months.

---

## What you get

A working, owned, in-production Company Index for your revenue org in 4-6 weeks.

### Week 1 — Audit + schema design
- Audit your current knowledge surfaces (Notion / Guru / Confluence / Highspot / Slack / CRM custom fields).
- Interview 4-6 people across Sales, Marketing, RevOps, CS.
- Design your schema: which page types you need, which sources feed them, who reviews what.
- **Output**: your `CLAUDE.md` + page-template set, tailored to your archetypes and Q2R motion.

### Week 2-3 — Ingest pipeline
- Wire 1-2 source systems (typically your call recording tool + CRM).
- Build the LLM extraction prompts per source.
- Backfill from the last 90 days of source data.
- **Output**: a populated wiki you can browse, search, and query.

### Week 4-5 — Routing, review, and lint
- Wire the PR workflow + reviewer routing per label.
- Train the 2-3 humans who'll review LLM-generated diffs.
- Run the first weekly lint pass.
- **Output**: a maintained, reviewed, current wiki — the operating system, not just the artifact.

### Week 6 — Handoff
- Documentation, runbook, retrospective.
- Decision: continue with me on a retainer, or run it internally.

---

## What I expect from you

- **An executive sponsor** — typically Head of RevOps, VP Sales, or COO.
- **4-6 SMEs available for ~3 hours each** across the 6 weeks.
- **Access to source systems** — call recording, CRM, Slack, billing.
- **A reviewer pool** — 2-3 humans willing to review LLM-generated diffs ~30 minutes/week each after launch.

---

## Who this is for

- B2B SaaS, **$10M-$100M ARR**.
- 8+ person GTM team.
- Already using a call recorder (Gong / Fathom / Chorus / Avoma / Fireflies) and a CRM (HubSpot or Salesforce).
- You've tried at least one previous attempt at a "single source of truth" and watched it die.

## Who this isn't for

- Pre-product-market-fit. The wiki encodes proven patterns; if your patterns are still in flux, this is premature.
- Single-product, single-segment startups under $5M ARR. The maintenance overhead doesn't pay back yet.
- Teams that won't commit a reviewer pool. The PR workflow needs humans for the first 90 days.

---

## Apply

Five short questions. DM me on [LinkedIn](https://linkedin.com/in/rasmussikk) or email **rasmus@unfrankenstein.io** with answers:

1. Company name + ARR band ($10-25M / $25-50M / $50-100M).
2. Your role.
3. What's your current "company knowledge base" today, and where does it break?
4. Which source systems are in play (call recorder, CRM, Slack, billing)?
5. What would success look like in 90 days?

I respond within 48 hours. No-fit responses get explicit no-fit + a reason. Engagement scope and pricing get discussed after the application — both depend on company size and source-system complexity.

---

*After 3 pilots ship, I'll publish anonymized case studies and open the next batch of slots.*
