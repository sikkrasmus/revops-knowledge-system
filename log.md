# Company Index — Log

Append-only audit trail. Appended by automation on PR merge, lint runs, and ingest events. Do not edit by hand.

Entry format:
```
## [YYYY-MM-DD] <event-type> | <short-description> | <path-or-id>
```

Event types: `ingest`, `auto-merge`, `lint`, `pr-merged`, `pr-opened`, `rollback`, `drift-detected`, `verification-refreshed`, `bootstrap`.

Read filtered: `ci log --since 7d --type ingest`.

---

## [2026-04-19] bootstrap | repo initialized for v1 rebuild | README.md, CLAUDE.md, PRINCIPLES.md, PHASES.md
