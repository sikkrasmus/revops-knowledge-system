---
type: meta
title: Notion landing page
description: Paste-ready Notion landing page — non-technical framing for RevOps leaders.
owner: rasmus@unfrankenstein.io
last_reviewed: 2026-04-19
---

# Company Index — Notion landing page

Non-technical framing for RevOps leaders. Paste this into a Notion page you share with your team or post publicly. Strip the frontmatter block when pasting.

---

## The problem every RevOps leader has tried to solve

Your company's knowledge — ICP, personas, pricing, positioning, competitive intel, playbooks — lives in six places at once. Notion has one version, Sales has a different one in their Slack channel, Marketing's content team works from a Google Doc from last quarter, and your AI SDR is drafting emails off whatever it could find.

Every RevOps leader has tried to fix this. Every attempt has rotted within six months. Maintenance cost grows faster than the value.

## What changes with LLMs

LLMs reverse the maintenance economics. A pass can touch fifteen files, refresh citations, detect drift, and open a PR in 20 minutes. Human review compresses to accepting or rejecting the diff. For the first time, a living operational knowledge base for GTM and RevOps is viable.

## The framework

**Markdown files in git, maintained by an LLM, reviewed by humans via PR.**

Three layers:

1. **Raw sources** — your call recordings, CRM records, Slack deal rooms, contracts. The LLM ingests; your reviewers approve.
2. **The wiki** — markdown pages with structured frontmatter. Browseable in Obsidian, edited via pull request.
3. **The schema** — the operating agreement between your team and the LLM. This is the one file you write by hand.

Seven shared components every function reads from: ICP, personas, product-and-packaging, pricing, positioning, competitive-intel, data-definitions. Function-specific content layered on top (sales, marketing, CS, support, RevOps, finance-legal).

## What agents do differently when the substrate is real

Three things, every time:

- **Output stops being generic.** Agents reference specific patterns, named postmortems, the right product mix per segment.
- **Hallucinations become detectable.** When pages are typed, dated, and cited, the agent refuses, hedges, or escalates instead of confidently making things up.
- **Cycle times collapse on the queries that matter.** Discount approvals in 45 minutes instead of 2 days. Discovery prep in 4 minutes instead of 4 hours.

## Who this is for

B2B SaaS, $10M-$100M ARR, 8+ person GTM team, already using a call recorder and a CRM. You've tried at least one previous "single source of truth" initiative and watched it die.

## Pilot implementation

The framework is open and free on [GitHub](https://github.com/sikkrasmus/revops-knowledge-system). If you want it running in production in your revenue org in 4-6 weeks instead of 3-6 months DIY: I'm taking 3 companies through a paid pilot.

- Week 1: audit + schema design.
- Weeks 2-3: ingest pipeline (one connector end-to-end).
- Weeks 4-5: routing, review, and lint.
- Week 6: handoff.

Details and how to apply: [`PILOT.md`](https://github.com/sikkrasmus/revops-knowledge-system/blob/main/PILOT.md).

**2 of 3 spots remaining.**

## What this isn't

- Not a CRM replacement.
- Not a CMS.
- Not an enterprise-search tool (Glean, Elastic).
- Not an AI agent — it's what agents read from.

If you're evaluating AI SDRs, AI deal desks, AI CSM tooling: this is prerequisite infrastructure. Agents get materially better when they read from a typed, cited, current substrate. Without it, 50-70% of AI GTM pilots churn in 3 months.

## Next steps

- Read the [framework](https://github.com/sikkrasmus/revops-knowledge-system) — start with the README.
- Fork it, adapt to your org.
- Or message me directly for a pilot slot: rasmus@unfrankenstein.io / [LinkedIn](https://linkedin.com/in/rasmussikk).

---

*Adapted from [Andrej Karpathy's LLM Wiki framework](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f), specialized for B2B SaaS RevOps.*
