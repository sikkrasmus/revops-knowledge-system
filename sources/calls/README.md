---
type: meta
title: Call Summaries
description: Synthesized summaries of sales / CS / product calls. Raw recordings live in Gong/Fathom.
owner: rasmus@latentflows.com
last_reviewed: 2026-04-19
---

# Call Summaries

Synthesized summaries of sales, CS, product, or research calls. Raw recordings stay in Gong, Fathom, Chorus, or Avoma. This directory holds markdown summaries that can be cited by wiki pages.

## What to include in a synthesis

- **Context.** Who was on the call, when, what segment, what product context.
- **Claims worth citing.** Statements from the buyer that inform ICP, persona, pricing, positioning, or competitive intel pages.
- **Explicit quotes only with consent.** Paraphrase by default. Verbatim only when the customer has consented.
- **Ground-truth signals.** What happened (next step agreed, deal stage shift, expansion trigger, objection voiced).

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

## What ships here

No actual call summaries. This repo is the abstract framework. A fork populates this directory with real call snapshots.
