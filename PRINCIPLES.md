---
type: meta
title: Principles
description: Eleven binding principles for the framework. Function-agnostic; principles outlive instances.
owner: rasmus@latentflows.com
last_reviewed: 2026-04-21
---

# Principles

The abstract framework, function-agnostic. These principles outlive any instance. If you fork this repo to build a Company Index for your org, the directory layout can change. The principles cannot, without breaking the system.

---

## 1. Intelligence layer, not knowledge base

A "knowledge base" implies a single artifact. Company Index is wider than that. It is an intelligence *layer* that spans six functions (Marketing, Sales, CS, Support, RevOps, Finance/Legal), about 100 tools, and a company's motions. A single flat schema cannot carry that weight. The layer has a shared spine (co-authored by multiple functions) plus function-specific content.

**Test for the spine.** The same artifact is referenced as the *same object* by two or more functions. If Marketing's ICP and Sales's ICP are different documents, they are not shared. They are two artifacts with a naming collision.

The test is binding. The list of components a given fork ends up with in its spine is not. It is an instance choice, driven by where multi-author artifacts and cross-function friction actually sit in that business. The seven filled in this repo are one worked example for B2B SaaS sales-assisted at $10 to $100M ARR.

## 2. Markdown in git, LLM-maintained, human-reviewed

The corpus is markdown files in a git repo. Humans curate sources and define the schema. LLMs do the bookkeeping by opening PRs with diffs, citations, and confidence scores. Humans review and merge. Git provides the audit trail. No CMS, no database, no vendor lock.

This is the maintenance-economics shift that makes a self-maintained evolving knowledge system credible. LLMs do not get bored, and a single ingest pass can touch 15 files. Maintenance cost approaches zero as trust is earned.

## 3. Principles over instances

The durable value is the framework: schema, authoring contract, governance rules, consumption patterns. Your fork is the instance, the framework is the product. Do not confuse the two.

When something in a specific instance conflicts with a principle, the principle wins and the instance gets corrected.

## 4. Consumption is the product

Without a reliable way for humans and agents to query the wiki in-workflow with provenance, the wiki is dead storage. The CLI (`ci`) and `SKILL.md` are first-class, not afterthoughts. Every design decision about the corpus (naming, frontmatter, section labels) is evaluated against one question: does this make retrieval easier for an agent in a workflow?

The CLI is a convenience wrapper, not a retrieval engine. The actual retrieval is grep, find, and frontmatter filtering.

## 5. Native tools over magic

No embeddings, no vector DB, no sync pipeline. Just grep, find, glob, frontmatter filtering, and the three-file navigation layer (`CLAUDE.md`, `index.md`, `log.md`). The result is deterministic, fast, inspectable, and portable.

At the scale a single company's wiki reaches (hundreds to low thousands of pages), reading `index.md` first to locate candidates and then drilling into pages replaces embedding-based retrieval. When you hit scale where that breaks, the answer is better structure (sub-indexes, function-level indexes), not a vector DB with its own drift, opacity, and re-embedding cost.

## 6. Graduated trust

"Every change goes through PR review forever" kills the self-maintained promise. Trust is earned in stages instead.

- **Stage 1 (months 0 to 3).** 100% PR. Build confidence in the corpus and in the LLM's change quality.
- **Stage 2 (months 3 to 6).** Routine auto-merge for low-risk classes (backlink updates, single-canonical-source factual updates, format fixes). Higher-risk classes (ICP, pricing, packaging, legal, strategic positioning, page creation, page deletion) always PR.
- **Stage 3 (months 6+).** Pattern-matched autonomy and multi-source consensus changes. The always-PR list does not shrink.

Every change, auto-merged or PR'd, appends to `log.md`. Rollback is always one `git revert` away. Human-in-the-loop is not only the PR. It is also periodic audits, lint-exception reviews, and rollback authority.

## 7. Build in phases by function

The suggested rollout is Phase 0 (shared spine), then Phase 1 (one vertical function end to end), then Phase 2 (remaining functions), then Phase 3+ (advanced ingestion, conversation-harvest, cross-corpus consistency). Full sequencing in [`docs/03-IMPLEMENTATION.md`](docs/03-IMPLEMENTATION.md).

Pick the Phase 1 function based on where your org has the strongest pull: the function with the most pain today, the densest references back to the shared spine, or the cleanest existing templates to salvage. This repo fills `functions/sales/` as its worked example because that is where we started, not because sales is the right starting point for every company. A marketing-led, CS-led, or RevOps-led fork is equally valid.

## 8. Shared spine plus function-specific plus motion/segment as tags

The component model has exactly three layers.

1. **Shared spine.** Seven co-authored components referenced by every function.
2. **Function-specific.** Each function has its own methodology, playbooks, frameworks, plays.
3. **Motion and segment variation.** `motion` and `segment` are frontmatter tags on pages and in-file section labels on headings. Never parallel directory trees. Never overlay directories. Default values ship in [`schema/enums.yaml`](schema/enums.yaml) (motion: `plg`, `sales-assisted`, `enterprise`; segment: `smb`, `mid-market`, `enterprise`). A fork can adjust the enum to fit its GTM shape.

Most $10 to $100M ARR SaaS run 1 to 3 motions at the same time. The tag and label model lets a single canonical page project multiple views without multiplying maintenance cost three to five times over.

## 9. The wiki is a reconciled artifact, not a replica

You cannot "re-sync" a page from its source. A page often synthesizes multiple sources (Confluence + three Gong calls + a deal review = one ICP tier definition). Re-syncing would overwrite the synthesis.

**Two source models.**

- **Files in `sources/`.** Synthesized markdown copies of calls, cleaned Confluence exports, redacted deal reviews. In-repo, hybrid policy per [`sources/POLICY.md`](sources/POLICY.md).
- **Live systems via connector specs.** HubSpot, Salesforce, Gong, Stripe, Slack. Never duplicated into the repo. Citations are point-in-time references with `as_of:` timestamps.

Drift is detected and surfaced as frontmatter flags (`source_drift: true`, `verification_stale: true`, `has_contradiction`), then reconciled by a human-reviewed PR. Nothing auto-rewrites.

## 10. Provenance at the claim level

Every factual claim cites its source inline. Two formats are allowed: a file reference, or a system-query with an `as_of:` timestamp.

```
[source: sources/calls/YYYY-MM-DD-acme-discovery.md]
[source: hubspot://deals?stage=closed-won as_of:YYYY-MM-DD]
```

Every cited source appears in the page's frontmatter `sources:` list. `ci verify` enforces this, and an unsourced assertion fails the build.

Why this matters: agents hallucinate confidently. A corpus without claim-level citations turns into one where the LLM extrapolates. A corpus with them forces the LLM to refuse, hedge, or escalate.

## 11. Staleness and drift are explicit signals

Three first-class freshness signals.

| Signal | Meaning | Detection |
|---|---|---|
| **Source drift** | Source changed since snapshot | Webhook (where supported) or weekly lint pass |
| **Verification stale** | `verified_until` passed; no re-confirmation | `ci verify` plus weekly lint |
| **Contradiction** | Another page now cites a conflicting claim | Weekly lint, graph-aware |

When any of these fires, the page gets a frontmatter flag, surfaces in `ci stale`, and the LLM opens a reconciliation PR. Nothing auto-rewrites. Reconciliation is a judgment call, which is what the PR process is for.

---

These eleven principles are binding. Any design decision downstream (new page type, new CLI command, new enum value, new function directory) must be checkable against them.
