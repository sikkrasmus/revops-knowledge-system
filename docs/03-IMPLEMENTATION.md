# Implementation

Teams that fork this framework to run in production burn three months on four specific problems. Documenting them so you can skip the learning curve or know what the paid pilot takes off your plate.

---

## Hard part 1 — source-system plumbing

**The problem**: connector implementations against HubSpot, Salesforce, Gong, Fathom, Stripe, Confluence, Notion are real engineering projects. Auth, rate limits, pagination, webhook signatures, schema drift in the source system itself. Each takes 1-2 weeks of focused work to ship well.

**What fails**: teams underestimate, ship a hacky v1, then spend months patching edge cases. Or they lean on vendor-provided integrations that don't give them the extraction control they need.

**What works**:

- Follow the abstract pattern in [`../ingestion/connectors/PATTERN.md`](../ingestion/connectors/PATTERN.md). Five stages, same for every connector: auth → extract → synthesize → snapshot → PR.
- Start with one high-signal source (usually the call recorder). Get extract-synthesize working end-to-end. Then add others.
- Treat PII filtering as load-bearing from day one. Retrofit is painful.
- Use `sources/POLICY.md` to decide in-repo vs. out-of-repo *before* writing the connector.

## Hard part 2 — schema design

**The problem**: the schema (frontmatter, page types, enums, section labels) is the operating agreement between humans and LLMs. Get it wrong and every page is off; every query surfaces noise; every ingest pass needs heavy human cleanup.

**What fails**: teams design from first principles. They over-engineer, add fields no one fills in, invent page types for hypothetical uses, and end up with a 40-page spec nobody follows.

**What works**:

- Start with the schema in this repo. It's battle-tested against the 7 shared components.
- When adding a page type, constrain sharply. Required structure, required frontmatter, anti-patterns. Document those three before adding.
- Keep enums small. [`../schema/enums.yaml`](../schema/enums.yaml) is machine-validated — adding a value requires a PR. Feature, not bug.
- Motion and segment are tags, not directories. Parallel directory trees for variants are the most common early-stage mistake.

## Hard part 3 — reviewer fatigue

**The problem**: at Stage 1 (100% PR), every change hits a human. At 50 pages and 3 PRs/week, fine. At 300 pages and 30 PRs/week, reviewers burn out. Quality drops. Things get rubber-stamped. Trust erodes.

**What works**:

- **Stage appropriately.** Stage 1 for 90 days. Stage 2 once you have pattern confidence. Stage 3 when pattern-matched changes have clean track records.
- **Funnel by class, not page.** Auto-merge routine classes (backlinks, cross-refs, format) from Stage 2. Keep always-PR classes (ICP, pricing, packaging, legal, positioning) gated forever.
- **Rotate review ownership.** Each function has a primary reviewer + co-reviewers. Primary gets notified first; if unavailable in 24h, next reviewer picks up.
- **Post-hoc audits.** Sample auto-merged changes weekly. If quality drops, pull the class back to PR-required.

## Hard part 4 — trust calibration

**The problem**: when is the LLM right enough to rely on? When do you trust auto-merge? How do you spot corpus rot from under-review?

**What fails**: teams either over-trust (auto-merge everything, discover six months later that 30% of pages have subtle errors) or under-trust (gate everything forever, never ship the productivity gain that justifies the project).

**What works**:

- **Start at 100% PR.** Build trust empirically.
- **Track rollback rate per change class.** One reverted backlink update in 90 days, fine. Three, pull backlinks back to PR-required.
- **`ci stale` + `ci log` weekly.** Stale list growing → review is falling behind. Log activity dropping → LLM isn't being invoked enough. Both are signals.
- **Per-page confidence.** LLM-authored PRs carry `confidence: low / medium / high`. Low-confidence always PR. High-confidence on routine classes are auto-merge candidates.

---

## Where this fits alongside adjacent tools

These categories overlap unevenly. A team in production usually runs three or four together.

| Category | What they do well | What they don't | How this framework relates |
|---|---|---|---|
| **Enterprise search** (Glean, Elastic, Coveo) | Unified search across many systems | They surface content, don't maintain it | Point them at this corpus for universal-search UX; maintenance stays here |
| **Sales enablement** (Highspot, Seismic, Guru) | Content distribution, rollouts, analytics | No maintenance layer behind the delivery | Publish from this corpus to their UX; corpus is source of truth |
| **Knowledge-base tools** (Notion, Confluence) | Collaborative writing, comments, versions | No git, no typed schemas, no lint, no PR review | Pick one. Don't bridge them in production |
| **Sales agents** (11x, Artisan, Clay) | Run outbound, enrichment, qualification | Hallucinate when substrate is thin | They read from this corpus. Substrate-first resolves the churn pattern |
| **CPQ / deal desk** (Salesforce CPQ, DealHub) | Quote generation, approval workflows | Pricing policy lives in tool config, not as a reviewable artifact | This framework is the canonical pricing definition; CPQ is the enforcement |
| **CRM-native AI** (Agentforce, Breeze) | AI on top of CRM records | Records without context produce generic output | CRM stays system of record; this framework is the reasoning layer |
| **Data/analytics** (dbt, Hightouch, Metabase) | Data models, reverse-ETL, dashboards | About data, not mental models / policies / patterns | Complementary. dbt owns the model; this owns the narrative. Cite dbt as a source |

## What this isn't

- Not a CRM replacement.
- Not a CMS for customer-facing content.
- Not a data modeling tool.
- Not a tool-in-a-box — it's a framework you fork, adapt, and run.

## What the paid pilot takes off your plate

The [`../PILOT.md`](../PILOT.md) is built around the four hard parts:

- Week 1 audit + schema design solves part 2 for your context.
- Weeks 2-3 ingest pipeline ships one connector end-to-end — hardest half of part 1.
- Weeks 4-5 wire the review pipeline + train reviewers — part 3.
- Week 6 handoff + retainer on trust calibration — part 4.

Ship in 4-6 weeks vs. 3-6 months DIY.

## Related

- [`01-WHY.md`](01-WHY.md) — failure modes this avoids
- [`02-ARCHITECTURE.md`](02-ARCHITECTURE.md) — three layers + operations
- [`04-AGENTS-IN-ACTION.md`](04-AGENTS-IN-ACTION.md) — what agents do on this substrate
- [`../PILOT.md`](../PILOT.md) — paid implementation
