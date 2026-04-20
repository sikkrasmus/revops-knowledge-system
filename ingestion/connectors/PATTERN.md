---
type: meta
title: Connector Pattern
description: Abstract pseudo-code template for any source-system connector. Phase 0 ships this pattern, not implementations.
owner: rasmus@latentflows.com
last_reviewed: 2026-04-19
---

# Connector Pattern

Abstract pseudo-code template for any source-system connector. Phase 0 specifies this pattern; real implementations come in Phase 3 or as community contributions.

---

## Five lifecycle stages

Every connector implementation has exactly these stages:

1. **Auth** — obtain credentials and a valid session against the source system.
2. **Extract** — query the source and retrieve data.
3. **Synthesize** — transform extracted data into markdown + structured metadata.
4. **Snapshot** — persist to `sources/` (Model A) or record a system-query citation (Model B).
5. **PR** — open a pull request with proposed wiki changes.

## Abstract pseudo-code

```
# <system>-connector

def run(trigger):
    # Stage 1: Auth
    credentials = load_credentials_from_env("<SYSTEM>_API_KEY")
    session     = source_system.authenticate(credentials)

    # Stage 2: Extract
    query       = build_query(trigger)                      # trigger defines scope
    extracted   = session.query(query)                      # paginate if needed
    extracted   = rate_limit(extracted)                     # respect source-side limits

    # Stage 3: Synthesize
    summary     = llm_synthesize(extracted, prompt=system_prompt_template)
    pii_status  = redact_pii(summary, policy=sources_policy)
    metadata    = extract_structured_metadata(extracted)    # dates, identifiers, counts

    # Stage 4: Snapshot
    if in_repo_eligible(summary, pii_status):
        snapshot_path = f"sources/<category>/{today}-{slug(summary)}.md"
        write_source_file(
            path      = snapshot_path,
            body      = summary,
            frontmatter = {
                "type": "source",
                "title": metadata.title,
                "description": metadata.one_line_summary,
                "owner": connector_owner,
                "last_reviewed": today,
                "source_system": "<system>",
                "source_url": metadata.source_url,
                "source_captured_at": today,
                "source_drift": False,
                "pii_status": pii_status,
                "consumers": metadata.affected_functions,
            },
        )
        citation = f"[source: {snapshot_path}]"
    else:
        # Out-of-repo — cite as system-query with as_of timestamp
        citation = f"[source: <system>://{query.serialize()} as_of:{today}]"

    # Stage 5: PR
    affected_pages = compute_wiki_impact(metadata, citation)
    diffs          = llm_propose_diffs(affected_pages, new_content=summary, citation=citation)
    contradictions = lint_for_contradictions(diffs)

    pr = open_pr(
        branch        = f"connector/<system>/{run_id}",
        diffs         = diffs,
        description   = render_pr_template(
            connector_run_id = run_id,
            sources_cited    = [citation],
            affected_pages   = affected_pages,
            confidence       = compute_confidence(extracted, summary),
            contradictions   = contradictions,
            change_class     = classify_changes(diffs),
        ),
        reviewers    = route_reviewers(affected_pages),
    )

    # Do NOT merge. PR routes per ingestion/pr-workflow.md.
    return pr
```

## Trigger patterns

A connector's `run()` is invoked by a **trigger**. Two supported patterns:

### Webhook trigger

```
POST /webhooks/<system>
{
  "event_type": "<system>.<event>",
  "payload":    { ... },
  "timestamp":  "ISO-8601"
}
```

Connector validates the webhook signature, maps event → query, and invokes `run(trigger=event)`.

Used for: deal stage change, call transcript ready, contract signed, new page published.

### Scheduled pull

```
cron: 0 */6 * * *   # every 6 hours, for example

run(trigger=ScheduledPull(since=last_run_timestamp))
```

Connector queries for deltas since the last run.

Used for: bulk data (weekly deal summaries), backfill, batch refresh.

## What the LLM synthesis prompt does

The `llm_synthesize` step depends on a prompt template per source type (call, doc, deal review, contract excerpt). Each prompt:

- **Extracts claims** that inform wiki pages (ICP signals, pricing patterns, persona insights, competitive intel).
- **Summarizes** in markdown with preserved structure.
- **Redacts PII** per [`../../sources/POLICY.md`](../../sources/POLICY.md).
- **Returns structured metadata** (title, one-line description, affected functions).

Prompt templates are in-repo under `ingestion/artifact-commit/` (Phase 4+ — currently covered by the generalized prompt described in [`../artifact-commit/README.md`](../artifact-commit/README.md)). Versioned so changes can be rolled back.

## What the wiki-impact computation does

`compute_wiki_impact(metadata, citation)` answers: which existing pages should be updated, and are there new pages to create?

Heuristic v1:

- Grep the corpus for keywords in `metadata.title` and `metadata.keywords`.
- Check `consumers:` frontmatter — pages in the affected function's directory.
- Check graph — pages that cite similar sources.
- Rank candidates; take top N.

An LLM-based implementation (Phase 4) would use claim-level matching.

## What contradicts?

`lint_for_contradictions(diffs)` runs the same checks as the weekly lint pass (see [`../drift-detection.md`](../drift-detection.md) signal 3), focused on just the pages being changed.

When a contradiction is found, the diff gets a `has_contradiction` frontmatter flag on the affected page(s) and the PR description cites the contradiction explicitly so the reviewer sees it.

## What the PR description includes

Required per [`../artifact-commit/pr-template.md`](../artifact-commit/pr-template.md), but additionally for connector-generated PRs:

- **Connector run ID** — traces back to the specific extract.
- **Source system version / API version** used.
- **Extraction query** — the exact query that retrieved the data.
- **Synthesis prompt version** — for reproducibility.
- **LLM confidence score per claim** — where available.
- **Alternative synthesis** considered — if multiple plausible summaries, cite the one taken and note the alternative.

## Error handling

Connectors MUST handle:

- **Auth failure** — don't retry silently with stale credentials; fail the run, alert operator.
- **Rate limit** — respect source-side limits; back off, don't hammer.
- **Partial extraction** — if extraction is incomplete, don't synthesize; fail the run, alert.
- **Synthesis uncertainty** — if confidence is low, set `confidence: low` in the PR and flag in the description.
- **PII detection failure** — if PII classifier is uncertain, set `pii_status: needs-review` and block merge until human confirms.

## Observability

Every connector run emits:

- **Run ID** — UUID.
- **Trigger** — webhook event or scheduled pull metadata.
- **Timing** — start, end, duration per stage.
- **Count** — records extracted, records summarized, pages affected.
- **Outcome** — PR opened (number), no-change, or error.
- **PII status** distribution.

Logged to `log.md` via the ingest pipeline (not the merge hook — ingest appends independently on completion). Entry format:

```
## [YYYY-MM-DD] ingest | <system>:<query-summary> | run-id:<uuid>, pr:<number-or-none>
```

## What this pattern does NOT cover

- **Source system schema migrations** — if the source system changes its API, the connector spec must be versioned and updated via PR. The pattern assumes a stable source schema at the connector's version.
- **Conversation-harvest** — a different pattern for session transcripts. See [`../conversation-harvest/DESIGN.md`](../conversation-harvest/DESIGN.md).
- **Bulk re-ingestion** — if source system has historic data that wasn't previously ingested, backfill is a separate script following the same stages but in batch mode.

## Reference implementations

Phase 0: none.
Phase 3: synthetic-company examples (HubSpot, Gong, Confluence planned).
Community: TBD — follow this pattern and submit a PR adding a `<system>.md` spec file alongside this one.

## Related

- [`README.md`](README.md) — connector directory overview
- [`../pr-workflow.md`](../pr-workflow.md) — how connector PRs are reviewed
- [`../drift-detection.md`](../drift-detection.md) — how drift in sources surfaces
- [`../../sources/POLICY.md`](../../sources/POLICY.md) — in-repo vs. out-of-repo rules
