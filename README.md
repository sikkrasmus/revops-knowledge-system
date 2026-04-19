# Company Index

**An open framework for an LLM-maintained knowledge base for GTM and RevOps teams.**

Every AI agent in your revenue org reads from a knowledge base. Most of those knowledge bases are stale, scattered, and wrong. This is the substrate that makes the rest of your AI investment actually work.

![Company Index Architecture](docs/assets/architecture.png)

---

## What this is

For 15 years, RevOps leaders have tried to build a single source of truth for company knowledge — ICPs, battlecards, objection libraries, pricing patterns, win/loss postmortems. Every attempt has rotted within 6 months because the maintenance cost grew faster than the value.

LLMs change the maintenance economics. The shift: stop treating your knowledge base as a place humans write into. Treat it as a git repo that LLMs maintain, with humans reviewing PRs.

This repo is the framework, the schema, the routing rules, the conflict-resolution patterns, and a worked example. Adapted from [Andrej Karpathy's LLM Wiki framework](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f), specialized for B2B SaaS revenue operations.

## The architecture in 60 seconds

**Three layers.**

1. **Raw sources** — Gong/Fathom calls, HubSpot/Salesforce records, Slack deal rooms, customer emails, Stripe invoices, MSAs, competitor intel. Immutable. Every source is a commit.
2. **The wiki** — markdown files in a git repo, owned by the LLM. Six page types: ICP, Battlecard, Objection, Pricing Pattern, Postmortem, Champion Profile. Browseable in Obsidian or any markdown editor.
3. **The schema** — `CLAUDE.md` defines where pages live, required fields, source-precedence rules, reviewer routing, conflict-resolution policy. The one file you write by hand. The operating agreement between you and the LLM.

**Three operations.**

- **Ingest** — every call, email, closed deal triggers an LLM update. Touches 10-15 affected pages. Opens a PR with diffs, citations, confidence score.
- **Query** — agents and reps ask real questions; answers are synthesized from a current corpus with claim-level provenance.
- **Lint** — weekly health-check pass. Stale claims, contradictions, deprecated SKUs, ICP claims contradicting the last 20 closed deals.

## Why this finally works

- LLMs don't get bored. Touch 15 files in one pass. Maintenance cost approaches zero.
- Git gives you audit trails. When did the ICP shift? Pull the PR.
- Humans curate sources, define the schema, and approve PRs. The LLM does the bookkeeping.

## Foundation before agents

Every AI agent in your revenue org — AI SDR, AI deal desk, AI CSM, forecasting agent — reads from this layer.

Without it: agents re-derive context every query. They hallucinate confidently. They contradict each other. *50-70% of teams buying AI SDRs churn within 3 months* — [the substrate is missing](https://prospeo.io/s/ai-sdrs).

With it: agents read from a current, cross-referenced, schema-typed knowledge base. The shape of their output changes. See [`docs/06-AGENTS-IN-ACTION.md`](docs/06-AGENTS-IN-ACTION.md) for worked scenarios.

This is foundation before agents. Not optional.

---

## Navigate this repo

**Start here:**
- [`docs/01-WHY.md`](docs/01-WHY.md) — Why every previous knowledge base attempt died (with evidence)
- [`docs/02-ARCHITECTURE.md`](docs/02-ARCHITECTURE.md) — Three layers, three operations, in detail
- [`docs/06-AGENTS-IN-ACTION.md`](docs/06-AGENTS-IN-ACTION.md) — Show, don't tell: how agents query the index

**Build it:**
- [`schema/CLAUDE.md`](schema/CLAUDE.md) — The operating agreement template
- [`schema/page-templates/`](schema/page-templates/) — 6 page-type templates (ICP, Battlecard, Objection, Pricing Pattern, Postmortem, Champion Profile)
- [`pipelines/`](pipelines/) — Routing rules, conflict resolution, lint prompts, ingest prompts

**Connect your sources:**
- [`pipelines/connectors/`](pipelines/connectors/) — v1 stack: HubSpot, Fathom, Slack, Stripe (Gong/Salesforce/Gmail in v2)

**See it in action:**
- [`examples/seed-corpus/`](examples/seed-corpus/) — Synthetic raw sources from a fictional $25M ARR SaaS company
- [`examples/seed-wiki/`](examples/seed-wiki/) — The wiki state after ingesting that corpus
- [`examples/agent-scenarios/`](examples/agent-scenarios/) — 6 agent queries against the seed wiki

**Honest comparison:**
- [`docs/05-COMPARISON.md`](docs/05-COMPARISON.md) — How this fits alongside Glean, Guru, Notion AI, LoopBridge, Highspot, 11x, Clay, etc.

**Where DIY breaks:**
- [`docs/03-IMPLEMENTATION.md`](docs/03-IMPLEMENTATION.md) — The 4 hard parts where teams burn 3 months

---

## Pilot Implementation

If you want to skip the 3-month learning curve and have a Company Index running in your revenue org in 4-6 weeks, I'm taking 3 companies through a paid pilot.

**2 of 3 spots remaining.**

Details, scope, and how to apply: [`PILOT.md`](PILOT.md)

---

## Credits

- [Andrej Karpathy's LLM Wiki framework](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f) — the core pattern
- [coleam00/claude-memory-compiler](https://github.com/coleam00/claude-memory-compiler) — architectural inspiration for the hooks-extract-compile-index pipeline (h/t Romeo Mann for the pointer)
- [GitLab Handbook](https://handbook.gitlab.com/docs/frontmatter/) — frontmatter conventions
- [AGENTS.md](https://agents.md/) — the agent-instruction file standard (donated to the Linux Foundation AAIF, 2025)
- The 21 RevOps leaders who commented on the [original LinkedIn post](https://linkedin.com/in/rasmussikk) and pulled this out of my head

## License

MIT. Fork it, ship it, change it.
