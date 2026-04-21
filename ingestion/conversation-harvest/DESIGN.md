---
type: meta
title: Conversation-harvest design
description: Aspirational ingestion path. Extract candidate wiki changes from Claude Code or Cowork transcripts. Design only, not built in v1.
owner: rasmus@latentflows.com
last_reviewed: 2026-04-21
---

# Conversation-harvest design

> [!IMPORTANT]
> Aspirational design only. Not built. Not in scope for v1.
> This document captures the intended pattern so future work can reference it. Nothing here is wired up to the corpus today.

---

## Why this pattern

Teams already have Claude Code or Cowork sessions happening daily across Sales, CS, RevOps. These sessions generate tacit knowledge: pricing rationale discussed while an AE asks for discount approval, a persona insight surfaced while CS preps a QBR, a competitive signal spotted while marketing drafts a campaign. Most of this is lost when the session ends.

Conversation-harvest ingestion reads session transcripts, extracts candidate wiki changes, and opens PRs against the corpus with proposed diffs and provenance.

## Why aspirational, not v1

Hard problems. Genuinely hard, not just under-scoped.

1. **PII filtering.** Transcripts include named customers, internal personnel discussion, compensation, potentially regulated data.
2. **Consent.** Users have to opt in. Organizations have to policy-bless.
3. **Cross-session deduplication.** Five AEs all discuss the same competitor pattern in the same week. How does the harvester avoid five PRs saying the same thing?
4. **Confidence scoring.** A passing comment in one session is different signal than a deliberate decision discussed across three sessions. How are these weighted?
5. **Author attribution.** Each candidate change has an inferred "author" (the Claude session user). How does that interact with review routing?
6. **Generalizable vs. deal-specific.** A conversation about one account's pricing ask might be relevant to pricing-policy.md, or might not generalize. Who decides?

Shipping this in v1 would land half-working. Half-working means low trust, which means adoption fails.

## Sketch of the design

### Inputs

- Claude Code / Cowork session transcripts (JSONL or equivalent) accessible to the harvester.
- Per-user opt-in status.
- Per-organization PII and scope policy.

### Extraction

An LLM pass over each transcript.

1. Extract **candidate claims**: factual statements, patterns noted, decisions.
2. Classify by content domain: ICP, pricing, persona, positioning, competitive, data-definition.
3. Tag **deal-specificity**. Does this generalize or not?
4. Tag **confidence**. Explicit decision vs. passing remark.

### Dedup across sessions

- **Embedding or TF-IDF match** on candidate claim text, not the broader session.
- Group candidates that match a threshold.
- Choose the highest-confidence representative. Others boost group confidence.

### PII + consent filters

- Drop claims with PII that can't be redacted without losing meaning.
- Drop claims from non-opted-in users.
- Drop claims from sessions flagged confidential.
- Drop claims that include deal-specific info clearly not generalizable.

### PR generation

For each deduped, filtered candidate:

1. **Match to existing page** via `ci graph` plus content match.
2. **Generate proposed diff.** Add a claim, update a value, note a pattern.
3. **Cite provenance.** Session IDs (anonymized) plus the cluster count.
4. **Route to reviewer** per [`../pr-workflow.md`](../pr-workflow.md).

One PR per cluster. Bulk-batch PRs are discouraged. Reviewers can't process ten-page diffs well.

## Safeguards

- **Pattern-confirmation threshold.** A single-session insight doesn't generate a PR unless confidence is high. Multi-session clusters pass a lower threshold.
- **Per-directory rate limit.** Max N harvest-generated PRs per directory per day. Prevents overwhelming review.
- **Cooldown.** After a reviewer rejects a similar claim, don't re-propose for K days.
- **Auditable trace.** Every harvest-PR links back to session IDs the reviewer can inspect if they need to verify.

## What this design would ship

- Harvester service (opt-in per-user, per-org).
- Dedup + confidence algorithm.
- PII filters.
- PR-generation pipeline.
- Reviewer-facing UI or GitHub-native workflow for triaging harvest PRs.
- Metrics: candidates-per-week, PRs-per-week, accept-rate, rollback-rate.

## Related

- [`../pr-workflow.md`](../pr-workflow.md), all PRs follow this
- [`../connectors/PATTERN.md`](../connectors/PATTERN.md), different pattern for system connectors
- [`../../sources/POLICY.md`](../../sources/POLICY.md), same PII rules apply

## Open questions

- Federated harvest across multiple organizations (shared competitive-intel corpus). Out of scope.
- Real-time harvest (during session) vs. batch (end of session, end of day). TBD based on ergonomics.
- Cross-tool harvest (VS Code Cowork, ChatGPT, terminal Claude Code). TBD based on availability of transcripts.
