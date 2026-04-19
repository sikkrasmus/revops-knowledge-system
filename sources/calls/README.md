---
type: meta
title: Call Summaries
description: Synthesized summaries of sales / CS / product calls. Raw recordings live in Gong/Fathom.
owner: rasmus@unfrankenstein.io
last_reviewed: 2026-04-19
---

# Call Summaries

Synthesized summaries of sales, CS, product, or research calls. Raw recordings stay in Gong / Fathom / Chorus / Avoma. This directory holds markdown summaries that can be cited by wiki pages.

## What to include in a synthesis

- **Context** — who was on the call, when, what segment, what product context.
- **Claims worth citing** — statements from the buyer that inform ICP, persona, pricing, positioning, or competitive intel pages.
- **Explicit quotes only with consent** — paraphrase by default; verbatim only when customer has consented.
- **Ground-truth signals** — what happened (next step agreed, deal stage shift, expansion trigger, objection voiced).

## What to exclude

- Personal names of customer employees (use role/alias per [`../POLICY.md`](../POLICY.md)).
- Compensation or HR discussion.
- Anything unrelated to what the wiki uses calls for.

## Naming

```
<YYYY-MM-DD>-<topic-slug>.md
```

Where `<topic-slug>` is anonymized if needed: `acme-discovery`, `mid-market-pricing-feedback`, `churn-postmortem-q3`.

## Template frontmatter

```yaml
---
type: source
title: <call topic>
description: <one-line summary>
owner: <email-or-github-handle>
last_reviewed: <YYYY-MM-DD>
source_system: gong
source_url: https://gong.io/calls/<call-id>
source_captured_at: <YYYY-MM-DD>
source_drift: false
pii_status: redacted
consumers:
  - sales
  - cs
  - marketing
---
```

## Phase 0 content

No actual call summaries ship in Phase 0 — this is an abstract framework release. Phase 3 synthetic-company instance populates this directory as a worked example.
