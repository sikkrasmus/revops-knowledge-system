---
type: meta
title: Contributing
description: How to extend the framework — new connectors, new page types, governance changes.
owner: rasmus@unfrankenstein.io
last_reviewed: 2026-04-19
---

# Contributing

Contributions welcome. This framework is meant to be forked and adapted. The public repo accepts contributions that make the framework more useful, not contributions that bolt on specific-to-your-org content.

---

## What to contribute

### New connectors (most valuable)

Real connector implementations for source systems we haven't covered. Follow [`ingestion/connectors/PATTERN.md`](ingestion/connectors/PATTERN.md) — the five lifecycle stages (auth → extract → synthesize → snapshot → PR).

Each connector contribution includes:

- A `<system>.md` spec file in `ingestion/connectors/` documenting the connector's query format, webhook vs. pull pattern, and citation convention.
- Link to implementation (this repo's `connectors/impl/` subdir if a reasonable size, or a separate repo link).
- Smoke test.
- Documented auth, rate-limit, and PII handling.

Open a PR adding the spec file and tag a maintainer.

### New page types

New `type` enum values + accompanying page template. Justify:

- Which function(s) use this type.
- Why it needs its own structure (vs. using an existing type).
- An abstract example showing the shape.

### Schema refinements

Frontmatter field additions, section-label grammar extensions, verify rule improvements. These go through PR review with maintainer approval (schema is load-bearing — changes ripple everywhere).

### Governance improvements

Better auto-merge rules, better lint detection heuristics, better issue templates. The graduated-trust model is open for iteration.

### Documentation

Especially: worked examples of how a real team adopted this. Case studies with permission.

## What not to contribute

- **Your specific ICP / pricing / positioning** — that belongs in your own fork of this repo, not the public framework.
- **Framework rewrites** — work within the schema, don't replace it. If you believe a replacement is needed, open an issue first.
- **Specific-vendor biases** — connectors should be abstract where possible. If your connector requires vendor-specific fields, document them as extensions.

## Process

1. **Issue first for non-trivial PRs** — describe the change, the justification, the affected surfaces.
2. **Small PRs, focused** — one change per PR.
3. **Tests** — for CLI changes: add to `consumption/cli/tests/smoke.sh`. For schema changes: add fixture pages demonstrating valid and invalid cases.
4. **Docs updated** — CLI flag change → update `consumption/cli/README.md`. Schema change → update `schema/frontmatter.md`. Always regenerate `index.md` with `ci reindex` and commit that too (unless the `[bootstrap]` pattern applies).

## Code of conduct

Standard open-source expectations. Be kind; critique ideas not people; assume good intent.

## License

MIT. Contributions are accepted under the same license.

## Related

- [`README.md`](README.md) — framework overview
- [`PRINCIPLES.md`](PRINCIPLES.md) — binding principles (new contributions must not violate these)
- [`ingestion/pr-workflow.md`](ingestion/pr-workflow.md) — graduated trust model
- [`PILOT.md`](PILOT.md) — paid implementation
