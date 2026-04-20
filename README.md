---
type: meta
title: Company Index
description: Open framework for an LLM-maintained GTM/RevOps intelligence layer. Adapted from Karpathy's LLM Wiki.
owner: rasmus@unfrankenstein.io
last_reviewed: 2026-04-20
---

# Company Index

**An open framework for an LLM-maintained GTM/RevOps intelligence layer.**

Every AI agent in your revenue org reads from a knowledge base. That knowledge base isn't a single wiki — it's the entire GTM + RevOps intelligence layer, spanning six functions (Marketing, Sales, CS, Support, RevOps, Finance/Legal), ~100 tools, and a handful of company motions. This repo is the open framework for building and maintaining it.

Adapted from [Andrej Karpathy's LLM Wiki framework](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f), specialized for B2B SaaS revenue operations.

> **Status: Phase 1 shipped.** Shared spine + consumption surface + governance (Phase 0) plus the Sales function filled end-to-end (Phase 1). Other functions come in Phase 2 — see [`PHASES.md`](PHASES.md).

---

## What this is

An abstract framework — not a product. Four parts:

1. **Schema** — authoring contract, frontmatter spec, section-label grammar, page templates.
2. **Corpus** — markdown in git: a `shared/` spine used by every function, plus per-function directories.
3. **Consumption** — a CLI (`ci`) and a `SKILL.md` that turn the corpus into a retrieval surface for humans and agents. Grep-native, no embeddings.
4. **Governance** — graduated trust: every change PRs on day one; auto-merge expands as the system earns a track record.

The durable value is the framework. Instances are proof.

## Three layers

1. **Raw sources** — files in `sources/` (synthesized call summaries, cleaned exports, redacted deal reviews) plus connector specs for live systems (HubSpot, Gong, Stripe, etc.) that stay in their systems of record. Hybrid in-repo/out-of-repo policy in [`sources/POLICY.md`](sources/POLICY.md).
2. **The wiki** — `shared/` (seven co-authored components) + `functions/<function>/` (function-specific content). Motion (`plg` / `sales-assisted` / `enterprise`) and segment (`smb` / `mid-market` / `enterprise`) are frontmatter tags + in-file section labels. Never directory trees.
3. **The schema** — [`schema/authoring-contract.md`](schema/authoring-contract.md), [`schema/frontmatter.md`](schema/frontmatter.md), [`schema/section-labels.md`](schema/section-labels.md), [`schema/page-templates/`](schema/page-templates/). The operating agreement between human authors, LLM authors, and reviewers.

## Three operations

- **Ingest** — changes land via PR. In v1 that's artifact-commit (function heads commit). Automated connectors are specified as an abstract pattern in [`ingestion/connectors/PATTERN.md`](ingestion/connectors/PATTERN.md); real implementations come in Phase 3.
- **Query** — humans and agents retrieve via `ci` (see [`consumption/`](consumption/)) or native Read/Grep against the markdown. Provenance is claim-level.
- **Lint** — a weekly pass detects three freshness signals (source drift, verification stale, contradictions) and opens reconciliation PRs. Nothing auto-rewrites. See [`ingestion/drift-detection.md`](ingestion/drift-detection.md).

## Navigation trio

Three files at the repo root handle routing and audit. Each has a distinct role:

- [`CLAUDE.md`](CLAUDE.md) — **routing** (hand-written). Loaded by Claude Code / Cowork on session start. Where each type of knowledge lives.
- [`index.md`](index.md) — **catalog** (generated, never hand-edited). `ci reindex` walks the tree, reads frontmatter, rebuilds it. CI fails the build if it's stale.
- [`log.md`](log.md) — **audit** (automation-appended). PR merges, lint runs, ingest events.

The LLM reads `index.md` first to locate relevant pages, then drills into them. This replaces embedding-based retrieval at the scale we expect (hundreds to low thousands of pages).

## Consumption model

Convenience wrappers around grep, find, and frontmatter filtering — not a retrieval engine. Implementation: Bash + `yq`. Zero runtime install. Agents invoke via the Bash tool.

```bash
ci list --type icp --motion sales-assisted
ci show shared/pricing/price-book
ci search "mid-market discount guardrail"
ci verify --all
ci reindex --check
```

Eleven commands, all documented in [`consumption/cli/README.md`](consumption/cli/README.md). The [`consumption/SKILL.md`](consumption/SKILL.md) registers `ci` as the canonical retrieval path for Claude Code / Cowork.

## Component model

**Shared spine (Phase 0).** Seven co-authored-shared components in [`shared/`](shared/):

- `icp/` — tiered ICP (A/B/C) with firmographics, triggers, disqualifiers
- `personas/` — individual roles and buying-committee configurations
- `product-and-packaging/` — SKUs, editions, add-ons
- `pricing/` — price book, discount guardrails, usage meters
- `positioning/` — value props, category narrative, elevator pitches
- `competitive-intel/` — competitor profiles, win-loss patterns
- `data-definitions/` — MQL, SQL, ARR, NRR, CAC, payback — opinionated, research-grounded

**Function-specific (Phase 1+).** Six function directories in [`functions/`](functions/). Sales is filled end-to-end in Phase 1 — methodology (MEDDPICC), seven-stage playbooks, three decision frameworks, four repeatable plays, battlecards and objections scaffolds with worked examples, tool-category map. The other five function directories remain scaffolded with READMEs pointing to phase status.

## Governance

Graduated trust along two axes:

- **Maturity**: Stage 1 (months 0-3) = 100% PR. Stage 2 (months 3-6) = routine auto-merge for low-risk classes. Stage 3 (months 6+) = multi-source consensus and pattern-matched autonomy.
- **Content type**: some classes (ICP, pricing, packaging, legal, strategic positioning, page creation/deletion) always PR — no matter the stage.

Every change — auto-merged or PR'd — appends to `log.md`. Rollback is one `git revert` away. Details in [`ingestion/pr-workflow.md`](ingestion/pr-workflow.md).

## Phase status

- **Phase 0 — shipped.** Shared spine, schema, CLI MVP, SKILL.md, navigation trio, PR workflow, graduated trust rules, abstract connector pattern.
- **Phase 1 — shipped.** Sales function filled — methodology, playbooks, frameworks, plays, battlecards, objections, tools-and-stack. Shared-spine additions: VP Sales persona, enterprise-direct buying committee.
- **Phase 2 — next.** Marketing, CS, Support, RevOps, Finance/Legal.
- **Phase 3 — proof.** Synthetic company instance (full worked example) + first real connector implementations.
- **Phase 4+ — research.** Conversation-harvest ingestion, automated staleness detection with LLM, cross-corpus consistency.

Full roadmap: [`PHASES.md`](PHASES.md).

---

## Pilot implementation

The framework in this repo is open and free. Paid pilot is how you skip the 3-month learning curve: I work alongside your team for 4-6 weeks. Details: [`PILOT.md`](PILOT.md). Two of three spots remaining.

## Credits

- [Andrej Karpathy's LLM Wiki framework](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f) — the core pattern (navigation trio, `index.md`-first retrieval, append-only log)
- [GitLab Handbook](https://handbook.gitlab.com/docs/frontmatter/) — frontmatter conventions
- [AGENTS.md](https://agents.md/) — agent-instruction file standard (donated to the Linux Foundation AAIF, 2025)
- RevOps leaders who commented on the original [LinkedIn thread](https://linkedin.com/in/rasmussikk) and pulled this out of my head

## License

MIT. Fork it, ship it, change it.
