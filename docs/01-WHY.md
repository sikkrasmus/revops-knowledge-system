# Why every RevOps knowledge base has rotted (until now)

Every company has tried to build a single source of truth for GTM. Every attempt has died. The failures are structural, baked into maintenance economics that never added up before LLMs. Now they do.

---

## 1. The wiki graveyard

Every RevOps leader has built one, watched it die, and moved on. The Notion page grows to 300 subpages. Confluence splits between Marketing's definition of "enterprise" and Sales's. Guru overlaps with Highspot. A new VP arrives, declares bankruptcy on the old wiki, and proposes a rebuild.

The root cause is ownership. A wiki with 300 pages needs 20 hours a week to stay current across six functions. Nobody has that time. So the owner role floats, the pages drift, and the corpus silently goes wrong.

**Why this framework changes this.** One artifact is replaced by three layers: sources (immutable), wiki (reconciled markdown in git), schema (operating agreement). Drift is detected and surfaced through frontmatter flags like `source_drift` and `verification_stale`, instead of being silently ignored. Graduated trust lets auto-merge expand over time, so the system does not depend on one person.

## 2. Unfindable content

The wiki exists. Often several wikis exist: Notion, Confluence, Guru, Highspot, SharePoint, a Slack channel called `#enablement-dump`. Reps ask in Slack because search fails. Content lives but never surfaces.

**Why LLMs change this.** A structured corpus with frontmatter, a grep-native CLI, and a routing map makes retrieval deterministic. The LLM reads the catalog first (`index.md`), narrows to candidates, then reads those pages. Seconds, not minutes. Every answer cites its source.

## 3. Staleness as a structural problem

Everything operational has a half-life. Pricing changes. Product ships a new SKU. A competitor repositions. A lost deal reveals a new trap. ICP tightens when the new CFO arrives. The battlecard that was right in January is wrong by March. The ICP doc that was right at $5M ARR is wrong at $25M.

Keeping any of this current is somebody's side project. It rots until the next quarterly refresh, by which point the team has been operating on bad information for weeks.

**Why LLMs change this.** One pass can refresh every competitor page against the last 30 days of call transcripts and closed-deal evidence in 15 minutes. The same pass reruns across pricing, ICP, and objection handling. Maintenance cost approaches zero.

## 4. AI rollouts on stale corpus

This is the most expensive version of the staleness problem. A company buys an AI SDR, AI CSM, or AI deal desk expecting uplift. The agent drafts generic email. The agent recommends a discount that violates policy. The agent references last quarter's ICP. 50 to 70% of AI SDR deployments churn in three months.

The substrate is the problem. Agents inherit whatever lives in the corpus they read from, so hallucinated output traces back to stale content, and grounded output requires citations, current dates, and typed fields.

**Why this framework changes this.** Agents read from a corpus that is maintained by the same kind of agent reading from it. Ingestion runs on real sources with provenance. Staleness is a first-class signal. Contradictions are surfaced, not buried.

## 5. Ramp-time regression

New-hire AE ramp has grown to 5.7 months on average, up from 4.3 months in 2020. Every enablement-tool boom of the last five years has added capability without reducing ramp. The underlying knowledge-surface problem got worse, not better.

**Why this framework changes this.** A new hire reads `index.md`, follows pointers to the pages relevant to their first segment, and is operational in days. Every claim is cited. No Slack archaeology. Tacit knowledge becomes explicit.

---

## The maintenance-economics shift

Prior attempts failed because maintenance was a human tax. Nobody has 20 hours a week for it. Pages rot.

LLMs reverse the economics. One pass touches fifteen files, refreshes citations, detects drift, and opens a PR in 20 minutes. Human review compresses to accepting or rejecting the diff.

Cheap maintenance is the unlock. For the first time, a living operational wiki is viable for GTM and RevOps.

## Foundation before agents

Build the foundation before buying agents.

Teams that buy agents first discover the substrate problem in month three. Teams that build the substrate first ship agents in weeks, because the agents have something real to read from.

Four properties make a knowledge base fit for agent consumption:

1. **Structure.** Typed schemas instead of prose. Agents read a structured answer rather than parsing a paragraph.
2. **Provenance.** Every factual claim cites a source as a first-class field, not a footnote.
3. **Freshness signals.** `verified_until`, `source_drift`, `has_contradiction`, and `last_reviewed` are queryable. Agents refuse, hedge, or escalate instead of guessing.
4. **Navigation.** A catalog the agent reads first (`index.md`), a routing map (`CLAUDE.md`), an audit log (`log.md`). Deterministic retrieval, not vector similarity.

The agents come after. This framework is phase-zero work for any AI GTM initiative.

## Related

- [`02-ARCHITECTURE.md`](02-ARCHITECTURE.md), three layers plus three operations
- [`03-IMPLEMENTATION.md`](03-IMPLEMENTATION.md), the 8 hard parts and where adjacent tools fit
- [`04-AGENTS-IN-ACTION.md`](04-AGENTS-IN-ACTION.md), what changes when agents read from structured substrate
- [`../PRINCIPLES.md`](../PRINCIPLES.md), binding principles
