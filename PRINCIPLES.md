---
type: meta
title: Principles
description: Eleven binding principles for the framework. Function-agnostic; principles outlive instances.
owner: rasmus@latentflows.com
last_reviewed: 2026-04-19
---

# Principles

The abstract framework, function-agnostic. These principles outlive any instance. If you fork this repo to build a Company Index for your org, the directory layout can change — the principles cannot, without breaking the system.

---

## 1. Intelligence layer, not knowledge base

A "knowledge base" implies a single artifact. This isn't that. It's an intelligence *layer* that spans six functions (Marketing, Sales, CS, Support, RevOps, Finance/Legal), ~100 tools, and a company's motions. A single flat schema can't carry that weight. The layer has a shared spine (co-authored by multiple functions) plus function-specific content.

**Test for the spine**: the same artifact is referenced as the *same object* by two or more functions. If Marketing's ICP and Sales's ICP are different documents, they aren't shared — they're two artifacts with a naming collision.

## 2. Markdown in git, LLM-maintained, human-reviewed

The corpus is markdown files in a git repo. Humans curate sources and define the schema. LLMs do the bookkeeping — opening PRs with diffs, citations, and confidence scores. Humans review and merge. Git provides the audit trail. No CMS, no database, no vendor lock.

This is the maintenance-economics shift that makes a "self-maintained evolving knowledge system" credible. LLMs don't get bored. A single ingest pass can touch 15 files. Maintenance cost approaches zero as trust is earned.

## 3. Principles over instances

The durable value is the framework — schema, authoring contract, governance rules, consumption patterns. A worked synthetic-company instance is proof, not the product. This is why Phase 0 ships the framework and defers the synthetic company to Phase 3. Don't confuse the two.

When something in a specific instance conflicts with a principle, the principle wins and the instance gets corrected.

## 4. Consumption is the product

Without a reliable way for humans and agents to query the KB in-workflow with provenance, the wiki is dead storage. The CLI (`ci`) and `SKILL.md` are first-class, not afterthoughts. Every design decision about the corpus (naming, frontmatter, section labels) is evaluated against "does this make retrieval easier for an agent in a workflow."

The CLI is a convenience wrapper, not a retrieval engine. The actual retrieval is grep + find + frontmatter filtering.

## 5. Native tools over magic

No embeddings. No vector DB. No sync pipeline. Grep, find, glob, frontmatter filtering, and the three-file navigation layer (`CLAUDE.md` + `index.md` + `log.md`). Deterministic, fast, inspectable, portable.

At the scale a single company's KB reaches (hundreds to low thousands of pages), reading `index.md` first to locate candidates, then drilling into pages, replaces embedding-based retrieval. When you hit scale where that breaks, the answer is better structure (sub-indexes, function-level indexes) — not a vector DB with its own drift, opacity, and re-embedding cost.

## 6. Graduated trust

"Every change goes through PR review forever" kills the self-maintained promise. Real answer: trust is earned in stages.

- **Stage 1 (months 0-3)**: 100% PR. Build confidence in the corpus and in the LLM's change quality.
- **Stage 2 (months 3-6)**: routine auto-merge for low-risk classes (backlink updates, single-canonical-source factual updates, format fixes). Higher-risk classes (ICP, pricing, packaging, legal, strategic positioning, new page, delete page) always PR.
- **Stage 3 (months 6+)**: pattern-matched autonomy and multi-source consensus changes. The always-PR list doesn't shrink.

Every change — auto-merged or PR'd — appends to `log.md`. Rollback is always one `git revert` away. HITL isn't only the PR; it's also periodic audits, lint-exception reviews, and rollback authority.

## 7. Build in phases by function

Phase 0 (shared spine) → Phase 1 (one vertical function end-to-end: Sales) → Phase 2+ (remaining functions) → Phase 3 (synthetic company instance + first real connectors) → Phase 4+ (advanced ingestion).

Sales is Phase 1 because (a) audience demand lives there, (b) sales has the densest downstream references to shared components, and (c) existing templates (battlecard, objection, postmortem, champion profile) salvage cleanly into `schema/page-templates/sales/`.

## 8. Shared spine + function-specific + motion/segment as tags

The component model has exactly three layers:

1. **Shared spine** — seven co-authored components referenced by every function.
2. **Function-specific** — each function has its own methodology, playbooks, frameworks, plays.
3. **Motion/segment variation** — `motion` (`plg` / `sales-assisted` / `enterprise`) and `segment` (`smb` / `mid-market` / `enterprise`) are frontmatter tags on pages and in-file section labels on headings. Never parallel directory trees. Never overlay directories.

Most $10-100M ARR SaaS run 1-3 motions simultaneously. The tag/label model lets a single canonical page project multiple views without multiplying maintenance cost 3-5x.

## 9. The wiki is a reconciled artifact, not a replica

You can't "re-sync" a page from its source. A page often synthesizes multiple sources (Confluence + three Gong calls + a deal review = one ICP tier definition). Re-syncing would overwrite the synthesis.

**Two source models:**

- **Files in `sources/`** — synthesized markdown copies of calls, cleaned Confluence exports, redacted deal reviews. In-repo, hybrid policy per [`sources/POLICY.md`](sources/POLICY.md).
- **Live systems via connector specs** — HubSpot, Salesforce, Gong, Stripe, Slack. Never duplicated into the repo. Citations are point-in-time references with `as_of:` timestamps.

Drift is detected and surfaced as frontmatter flags (`source_drift: true`, `verification_stale: true`, `has_contradiction`), then reconciled by a human-reviewed PR. Nothing auto-rewrites.

## 10. Provenance at the claim level

Every factual claim cites its source inline. Two formats — file reference or system-query with `as_of:` timestamp:

```
[source: sources/calls/YYYY-MM-DD-acme-discovery.md]
[source: hubspot://deals?stage=closed-won as_of:YYYY-MM-DD]
```

Every cited source appears in the page's frontmatter `sources:` list. `ci verify` enforces this — an unsourced assertion fails the build.

Why this matters: agents hallucinate confidently. A corpus without claim-level citations turns into one where the LLM extrapolates. A corpus with them forces the LLM to refuse, hedge, or escalate instead.

## 11. Staleness and drift are explicit signals

Three first-class freshness signals:

| Signal | Meaning | Detection |
|---|---|---|
| **Source drift** | Source changed since snapshot | Webhook (where supported) or weekly lint pass |
| **Verification stale** | `verified_until` passed; no re-confirmation | `ci verify` + weekly lint |
| **Contradiction** | Another page now cites a conflicting claim | Weekly lint, graph-aware |

When any fires, the page gets a frontmatter flag, surfaces in `ci stale`, and the LLM opens a reconciliation PR. Nothing auto-rewrites. Reconciliation is a judgment call — and that's exactly what the PR process is for.

---

These eleven principles are binding. Any design decision downstream (new page type, new CLI command, new enum value, new function directory) must be checkable against them.
