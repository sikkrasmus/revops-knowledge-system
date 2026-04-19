# Implementation: the 4 hard parts

Teams that fork this framework to run in production burn three months on four specific problems. Documenting them so you can skip the learning curve or know what the paid pilot takes off your plate.

---

## Hard part 1 — source-system plumbing

**The problem**: connector implementations against HubSpot / Salesforce / Gong / Fathom / Stripe / Confluence / Notion are meaningful engineering projects. Auth, rate limits, pagination, webhook signatures, schema drift in the source system itself. Each takes 1-2 weeks of focused work to ship well.

**What fails**: teams underestimate, ship a hacky v1, and then spend months patching edge cases. Or they use vendor-provided integrations that don't give them the extraction control they need.

**What works**:

- Follow the abstract pattern in [`../ingestion/connectors/PATTERN.md`](../ingestion/connectors/PATTERN.md). Five stages, same for every connector: auth → extract → synthesize → snapshot → PR.
- Start with one high-signal source (usually the call recorder). Get the extract-synthesize loop working end-to-end. Then add others.
- Treat PII filtering as load-bearing from day one. Retrofit is painful.
- Use `sources/POLICY.md` to decide in-repo vs. out-of-repo *before* writing the connector, not after.

**What Phase 0 ships**: the abstract pattern. No real connectors.

**Phase 3** ships real connectors alongside the synthetic-company example. Community-contributed connectors welcome via PR.

## Hard part 2 — schema design

**The problem**: the schema (frontmatter, page types, enums, section labels) is the operating agreement between humans and LLMs. Get it wrong and every page is off; every downstream query surfaces noise; every ingest pass PR'd by the LLM requires heavy human cleanup.

**What fails**: teams try to design the schema from first principles. They over-engineer, add fields no one fills in, invent page types for hypothetical uses, and end up with a 40-page spec that nobody follows.

**What works**:

- Start with the schema in this repo. It's battle-tested against the 7 shared components.
- When adding a page type, constrain it sharply. What's the required structure? Which frontmatter fields? What are the anti-patterns? Document those three answers before adding anything.
- Keep enums small. [`../schema/enums.yaml`](../schema/enums.yaml) is machine-validated — adding a value requires a PR. That's feature, not bug.
- Motion and segment are tags, not directories. Always. Parallel directory trees for motion/segment variants are the most common early-stage mistake.

**What this repo ships**: a full schema you can fork and adapt. The authoring contract in [`../schema/authoring-contract.md`](../schema/authoring-contract.md) is the exact thing a reviewer can hand an LLM as context when PR-reviewing.

## Hard part 3 — reviewer fatigue

**The problem**: at Stage 1 (100% PR), every change hits a human. If the corpus has 50 pages and 3 are changing per week, reviewers process 3 PRs per week — fine. If the corpus has 300 pages and 30 PRs land per week, reviewers burn out. Quality drops. Things get rubber-stamped. Trust erodes.

**What fails**: teams never move past Stage 1 because they don't have a bridge. Reviewer fatigue kills the project.

**What works**:

- **Stage appropriately.** Stage 1 for the first 90 days. Stage 2 once you have pattern confidence. Stage 3 when pattern-matched changes have clean track records.
- **Funnel by class, not by page.** Auto-merge the routine classes (backlinks, cross-refs, format) from Stage 2 onward. Keep the always-PR list (ICP, pricing, packaging, legal, positioning) gated forever.
- **Rotate review ownership.** Each function's content has a primary reviewer + co-reviewers. The primary gets notified first; if unavailable in 24h, the next reviewer picks it up.
- **Post-hoc audits** — sample auto-merged changes weekly. If quality has dropped, pull that class back to PR-required.
- **Lint-exception reviews** as a separate surface — when `ci verify` flags many warnings, review in bulk.

**What the framework provides**: [`../ingestion/pr-workflow.md`](../ingestion/pr-workflow.md) (reviewer routing matrix), [`../ingestion/auto-merge-rules.yaml`](../ingestion/auto-merge-rules.yaml) (change-class matrix by stage).

## Hard part 4 — trust calibration

**The problem**: when is the LLM right enough to rely on? When do you trust an auto-merge, and when does something need human eyes? How do you spot when the corpus is starting to rot from under-review?

**What fails**: teams either over-trust (auto-merge everything, discover six months later that 30% of pages have subtle errors) or under-trust (gate everything forever, never ship the productivity gain that justifies the project).

**What works**:

- **Start with 100% PR.** Build the trust empirically.
- **Track rollback rate per change class.** If backlink updates auto-merge and one gets reverted in 90 days, fine. If three get reverted, pull backlinks back to PR-required.
- **`ci stale` + `ci log` weekly.** If the stale list grows, review is falling behind. If log activity drops, the LLM isn't being invoked enough. Both are signals.
- **Run `ci verify` in CI** — not as a gate only, but as a surfacer. Failures in a PR's verify output are the reviewer's first read.
- **Per-page confidence.** LLM-authored PRs carry `confidence: low / medium / high`. Low-confidence changes always PR. High-confidence on routine classes are auto-merge candidates.

**What the framework provides**: the three freshness signals (source drift, verification stale, contradiction) wired through frontmatter; `ci verify` + `ci stale` as operator surfaces; an explicit rollback model.

---

## What the paid pilot takes off your plate

The [`../PILOT.md`](../PILOT.md) is built around these four hard parts:

- Week 1 audit + schema design solves part 2 for your context.
- Weeks 2-3 ingest pipeline ships one connector end-to-end — solving the hardest half of part 1.
- Weeks 4-5 wire the review pipeline + train the reviewers — solving part 3.
- Week 6 handoff + continued retainer work on trust calibration — solving part 4.

Ship in 4-6 weeks vs. 3-6 months DIY.

## Related

- [`01-WHY.md`](01-WHY.md) — the five failure modes this avoids
- [`02-ARCHITECTURE.md`](02-ARCHITECTURE.md) — the three layers + operations
- [`05-COMPARISON.md`](05-COMPARISON.md) — adjacent tools and how this differs
- [`../PILOT.md`](../PILOT.md) — paid implementation
