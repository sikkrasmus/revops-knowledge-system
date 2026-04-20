---
type: meta
title: Artifact-commit Ingestion
description: v1 ingestion path — function heads and LLMs commit artifact changes via PR.
owner: rasmus@latentflows.com
last_reviewed: 2026-04-19
---

# Artifact-commit Ingestion

The v1 ingestion path. Function heads, contributors, and LLMs commit changes via PR when they make them. Same workflow as any docs repo. Low friction, no new infrastructure. Governance = PR review + graduated trust (see [`../pr-workflow.md`](../pr-workflow.md)).

This is what Phase 0 ships as the "working" ingestion surface. Real connectors are Phase 3 / community.

---

## Contents

| File | Purpose |
|---|---|
| [`pr-template.md`](pr-template.md) | PR description template — required fields |
| [`commit-conventions.md`](commit-conventions.md) | Commit-message conventions |
| [`issue-templates/`](issue-templates/) | Issue templates — "claim looks stale", "source drift detected", "contradiction found" |

## Flow

```
[human or LLM]
     │
     ├── edits page(s) in a branch
     ├── runs `ci verify --all` locally
     ├── opens PR with description from pr-template.md
     │
     ▼
[CI]
     ├── runs `ci reindex --check` (fails if index.md stale)
     ├── runs `ci verify --all` (fails on missing frontmatter, broken links, citation mismatches)
     ├── posts `ci stale` report as PR comment (informational)
     │
     ▼
[reviewer per pr-workflow.md]
     ├── reads diff + sources + confidence
     ├── approves / requests changes / blocks
     │
     ▼
[merge]
     ├── log-append.yml appends to log.md
     ├── if index.md needs regeneration, triggers next reindex commit
```

## When to open an issue first (vs. a PR directly)

Open an issue before PR when:

- **Staleness suspected** without clear corrected content. Use `issue-templates/stale-claim.md`.
- **Source drift detected** by lint but resolution is a judgment call. Use `issue-templates/source-drift.md`.
- **Contradiction found** between two pages or between a page and a source. Use `issue-templates/contradiction.md`.
- **New page proposed** — always issue first so the team can debate whether the page should exist.
- **Rename or delete** — always issue first with rationale and affected inbound-links enumerated.

## When to skip the issue and go straight to PR

- Routine content update with clear source.
- Typo, broken link, frontmatter-field fix.
- Cross-reference addition following an existing pattern.

## Related

- [`../pr-workflow.md`](../pr-workflow.md) — graduated trust + reviewer routing
- [`../../schema/authoring-contract.md`](../../schema/authoring-contract.md) — editing rules
