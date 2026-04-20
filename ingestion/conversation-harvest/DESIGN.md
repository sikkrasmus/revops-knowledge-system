---
type: meta
title: Conversation-harvest design
description: Phase 3+ ingestion path — extract candidate wiki changes from Claude Code / Cowork transcripts. Design only; not built in v1.
owner: rasmus@latentflows.com
last_reviewed: 2026-04-19
---

# Conversation-harvest design

Phase 3+ ingestion path. Not built in v1. This document captures the design so future work can reference it.

---

## Why this pattern

Teams already have Claude Code / Cowork sessions happening daily across Sales, CS, RevOps. These sessions generate tacit knowledge — pricing rationale discussed while an AE asks for discount approval, a persona insight surfaced while CS preps a QBR, a competitive signal spotted while marketing drafts a campaign. Most of this is lost when the session ends.

Conversation-harvest ingestion reads session transcripts, extracts candidate wiki changes, and opens PRs against the corpus with proposed diffs and provenance.

## Why Phase 3, not v1

Hard problems — genuinely hard, not just under-scoped:

1. **PII filtering** — transcripts include named customers, internal personnel discussion, compensation, potentially regulated data.
2. **Consent** — users have to opt in; organizations have to policy-bless.
3. **Cross-session deduplication** — five AEs all discuss the same competitor pattern in the same week. How does the harvester avoid five PRs saying the same thing?
4. **Confidence scoring** — a passing comment in one session is different signal than a deliberate decision discussed across three sessions. How are these weighted?
5. **Author attribution** — each candidate change has an inferred "author" (the Claude session user) — how does that interact with review routing?
6. **Generalizable vs. deal-specific** — a conversation about one account's pricing ask might be relevant to pricing-policy.md, or might not generalize. Who decides?

Shipping this in v1 would land half-working — and half-working means low trust, which means adoption fails.

## Sketch of the design

### Inputs

- Claude Code / Cowork session transcripts (JSONL or equivalent) accessible to the harvester.
- Per-user opt-in status.
- Per-organization PII and scope policy.

### Extraction

An LLM pass over each transcript:

1. Extract **candidate claims** — factual statements, patterns noted, decisions.
2. Classify by content domain — ICP, pricing, persona, positioning, competitive, data-definition.
3. Tag **deal-specificity** — does this generalize or not?
4. Tag **confidence** — explicit decision vs. passing remark.

### Dedup across sessions

- **Embedding or TF-IDF match** on candidate claim text (not the broader session).
- Group candidates that match a threshold.
- Choose the highest-confidence representative; others boost group confidence.

### PII + consent filters

- Drop claims with PII that can't be redacted without losing meaning.
- Drop claims from non-opted-in users.
- Drop claims from sessions flagged confidential.
- Drop claims that include deal-specific info clearly not generalizable.

### PR generation

For each deduped, filtered candidate:

1. **Match to existing page** via `ci graph` + content match.
2. **Generate proposed diff** — add a claim, update a value, note a pattern.
3. **Cite provenance** — session IDs (anonymized) plus the cluster count.
4. **Route to reviewer** per [`../pr-workflow.md`](../pr-workflow.md).

One PR per cluster. Bulk-batch PRs discouraged — reviewers can't process ten-page diffs well.

## Safeguards

- **Pattern-confirmation threshold** — a single-session insight doesn't generate a PR unless confidence is high. Multi-session clusters pass a lower threshold.
- **Per-directory rate limit** — max N harvest-generated PRs per directory per day. Prevents overwhelming review.
- **Cooldown** — after a reviewer rejects a similar claim, don't re-propose for K days.
- **Auditable trace** — every harvest-PR links back to session IDs the reviewer can inspect if they need to verify.

## What Phase 3 ships

- Harvester service (opt-in per-user, per-org).
- Dedup + confidence algorithm.
- PII filters.
- PR-generation pipeline.
- Reviewer-facing UI or GitHub-native workflow for triaging harvest PRs.
- Metrics: candidates-per-week, PRs-per-week, accept-rate, rollback-rate.

## Related

- [`../pr-workflow.md`](../pr-workflow.md) — all PRs follow this
- [`../connectors/PATTERN.md`](../connectors/PATTERN.md) — different pattern for system connectors
- [`../../sources/POLICY.md`](../../sources/POLICY.md) — same PII rules apply

## Open questions

- Federated harvest across multiple organizations (shared competitive-intel corpus) — out of scope.
- Real-time harvest (during session) vs. batch (end of session / end of day) — TBD based on ergonomics.
- Cross-tool harvest (VSCode Cowork + ChatGPT + terminal Claude Code) — TBD based on availability of transcripts.
