# Agents in action

Agents in a revenue org are as good as the corpus they read from. This framework is engineered as that corpus. What changes when the substrate is structured, cited, and dated.

---

## Three properties agents gain

### 1. Deterministic retrieval

Agents read `index.md` first — the catalog — narrow to candidate pages by frontmatter (type, motion, segment), then drill in. No embedding guesses. No vector similarity. The retrieval path is inspectable and reproducible: same query, same pages, same answer.

### 2. Claim-level provenance

Every factual claim carries a `[source: ...]` inline reference. When the agent answers, it cites back to the corpus. When a source drifts, lint detects it. When two sources contradict, the page flags `has_contradiction` and a human decides.

Agents don't fabricate citations because the citations are first-class data, not prose footnotes.

### 3. Freshness as a first-class signal

`verified_until`, `source_drift`, `has_contradiction`, `last_reviewed` are queryable fields. The agent checks them before trusting a claim. When a page is stale, the agent refuses, hedges, or escalates — rather than confidently filling the gap.

The index knows what it doesn't know.

---

## Three agent workloads this unlocks

### Sales agents (outbound, qualification, enrichment)

Given a lead, the agent queries the personas for the buyer's role, the win-loss patterns for recent deals in that segment, the product-and-packaging page for the right mix, the competitive-intel page for counter-positioning. The output anchors on the real pain pattern and cites the pages that back it.

The substrate problem behind the 50-70% AI SDR churn rate is exactly this: agents re-derive context every query and fill gaps with generic output. With a structured corpus, context is retrieved, not guessed.

### Deal desk and approval workflows

Pricing guardrails, discount bands, and strategic-exception conditions live as typed pages, not as policy trapped in a CFO's Slack. The agent applies the guardrail, cites the observed pattern from closed deals, and routes to a human for approval. Every recommendation traceable.

### Forecasting, renewal risk, RFPs

Workloads that require synthesizing across many pages — MEDDPICC completeness against deal stage, segment pricing patterns, champion-departure signals, postmortem patterns — become tractable when every page is typed and cross-referenced. The agent traverses the corpus; the human reviews the reasoning chain.

---

## What changes, observed

Three consistent effects when teams run agents against a structured corpus:

1. **Output stops being generic.** Agents reference specific patterns, named postmortems, the right product mix per segment — because those artifacts exist as pages.
2. **Hallucinations become detectable.** Typed schemas and dated sources let the agent refuse, hedge, or escalate instead of confidently making things up.
3. **Cycle times collapse on the queries that matter.** Discount approvals compress from days to under an hour. Discovery prep from hours to minutes. Forecast confidence from gut to mechanical.

The difference isn't a better agent. It's the substrate.

## Order matters

Foundation → Agents, not Agents → Foundation.

Teams that buy agents first discover the substrate problem in month three. Teams that build the substrate first ship agents in weeks — because the agents finally have something to read from.

## Related

- [`01-WHY.md`](01-WHY.md) — why prior attempts rotted
- [`02-ARCHITECTURE.md`](02-ARCHITECTURE.md) — three layers + navigation trio
- [`../consumption/SKILL.md`](../consumption/SKILL.md) — Claude Code skill definition
- [`../consumption/usage-patterns.md`](../consumption/usage-patterns.md) — worked `ci` sequences
