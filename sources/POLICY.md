---
type: meta
title: Source Storage Policy
description: Hybrid in-repo/out-of-repo policy, PII handling, retention rules for source artifacts.
owner: rasmus@unfrankenstein.io
last_reviewed: 2026-04-19
---

# Source Storage Policy

The hybrid policy that decides what lives in-repo vs. referenced externally, and the PII/sensitivity rules that apply to everything in `sources/`.

This is policy, not a suggestion. PRs that violate it get blocked at review. `ci verify` can flag some violations mechanically; others require human judgment.

---

## 1. In-repo vs. out-of-repo

### In-repo (lives in `sources/`)

All three criteria must hold:

- **Small** — single-digit megabytes max per file; typically kilobytes.
- **Non-sensitive** — no personal data, no trade secrets beyond what's acceptable on GitHub, no customer-identifying info unless permission is explicit.
- **Auditable** — markdown or text format that a human can read and review.

Typical in-repo content:

- Synthesized call summaries (LLM-generated with humans in the loop)
- Cleaned internal-doc exports (Confluence/Notion pages with PII stripped)
- Deal-review notes with customer name aliased
- Competitive intel excerpts from public content (with URL back to source)

### Out-of-repo (referenced by URL or connector spec)

- **Raw recordings** (audio, video) — stay in Gong / Fathom / etc.
- **Sensitive contracts** — stay in Legal vault. Can cite with `[source: drive://...]` syntax.
- **Full unredacted transcripts** — stay in the transcription tool.
- **Customer data exports** — stay in the CRM or data warehouse.
- **Production system data** — cited via connector specs (`hubspot://`, `salesforce://`, `stripe://`) with `as_of:` timestamps.

## 2. PII handling

Three PII statuses, tracked in every source page's frontmatter:

- **`pii_status: none`** — no personal data in the file. Safest category.
- **`pii_status: redacted`** — personal data removed or aliased. Requires PR review confirming redaction quality.
- **`pii_status: needs-review`** — PII present, pending redaction or exclusion. Blocks merge.

### What counts as PII

- Individual names of customer employees (unless explicitly consented for naming — rare)
- Email addresses of customer employees
- Phone numbers
- Account identifiers that resolve to individuals
- Compensation data
- Health information
- Financial data that identifies individuals or small entities

### Redaction approach

- **Names** → role or alias: "VP Operations at FabricatorCo" instead of "Jane Smith".
- **Emails** → domain: "@fabricator.co" or aliased entirely.
- **Phone numbers** → remove entirely.
- **Quotes** → paraphrase if the quote identifies. Preserve quote verbatim only with explicit consent.

### Redaction does NOT mean

- Removing all names (internal stakeholders without customer data are fine)
- Redacting customer company names if the relationship is public (case studies, press releases)
- Obfuscating numeric data that isn't tied to an individual

## 3. Consent

A customer conversation can only be stored in-repo (even synthesized) if:

- The call recording tool's ToS permits internal use for training and retention, AND
- The in-repo synthesized version either contains no identifying info, or has explicit permission.

When in doubt: synthesize without identifying content, and keep the raw recording in Gong/Fathom only.

## 4. Retention

- **In-repo source files**: retained for the life of the repo. Git history preserves them even if deleted from HEAD, which is deliberate (auditability).
- **Out-of-repo references**: we don't control retention. Citations note `as_of:` so we know what was true when.
- **Drift**: a citation pointing at out-of-repo content that's since been deleted or changed stays valid (the snapshot was taken at `as_of:`), but the wiki page that cites it may get `source_drift: true` from the lint pass.

## 5. Deletion

- **Never `git rm` + force-push** — history preservation is the audit trail.
- **When a customer revokes consent**: remove the synthesized source file via PR (normal commit); optionally cite BFG-repo-cleaner for full history purge if contractually required. Coordinate with legal.
- **When a source is factually wrong**: don't delete. Add a `correction.md` alongside it that cites the correction, and mark the original with a frontmatter flag. History preserves both.

## 6. Frontmatter for source pages

Every file in `sources/` has:

```yaml
---
type: source
title: <descriptive title>
description: <one-line summary>
owner: <email-or-github-handle>
last_reviewed: <YYYY-MM-DD>
source_system: <gong | fathom | confluence | notion | drive | hubspot | stripe | salesforce | email | slack | other>
source_url: <URL in original system>
source_captured_at: <YYYY-MM-DD>
source_drift: false
pii_status: <none | redacted | needs-review>
consumers:
  - <function>
---
```

`pii_status: needs-review` blocks merge. `ci verify` enforces.

## 7. What `ci verify` enforces mechanically

- Required frontmatter fields present and typed correctly.
- `pii_status` is a valid enum value.
- `source_captured_at` is a valid ISO date.
- `source_url` has a URL-like structure (http/https/drive/hubspot/gong/etc.).

What it doesn't enforce (humans do, at review):

- Whether the redaction is actually complete.
- Whether consent was obtained.
- Whether the synthesis faithfully represents the source.

## 8. Escalation

If any of the following: flag to the repo's data-policy owner (typically RevOps lead + Legal) before merging:

- Large volume of customer-identifying quotes.
- Contract language reproduced verbatim.
- Health, financial, or sensitive category data.
- External regulatory scope (GDPR / CCPA / HIPAA applicable).

When in doubt, keep it out of the repo and reference externally.

## Related

- [`README.md`](README.md) — directory layout and citation formats
- [`../schema/authoring-contract.md`](../schema/authoring-contract.md) — citation requirements
- [`../ingestion/drift-detection.md`](../ingestion/drift-detection.md) — drift handling
