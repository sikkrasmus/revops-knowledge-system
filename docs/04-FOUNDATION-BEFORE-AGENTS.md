# Foundation before agents

Every AI agent in a revenue org — AI SDR, AI deal desk, AI CSM, forecasting agent, territory-planning agent — reads from a knowledge base. If that knowledge base is stale, scattered, and untyped, the agent's output inherits the problem.

This is the "substrate" argument: agents aren't broken, the substrate they're plugged into is. Foundation before agents isn't a preference — it's a prerequisite.

---

## The evidence

**50-70% of AI SDR deployments churn in 3 months.** Ten times typical SaaS churn rates. The postmortems converge on the same cause: the agent reads from a knowledge surface that was never designed for agent consumption, re-derives context every query, and confidently hallucinates in the gaps.

**AI deal desk pilots stall.** Because discount policy lives partly in a Notion doc (90 days stale), partly in a CFO's email thread, partly in the implicit memory of the deal desk lead. The AI can't be right-by-construction. It guesses and gets overridden, and after the fifth override the pilot gets shut down.

**AI CSM tooling** has the worst failure mode: it's plausibly right most of the time, which means failure surfaces late. Churn risk predictions miss the segment-specific patterns that CS has in their head but never wrote down.

## What's missing

Four properties the knowledge base has to carry for agents to benefit:

### 1. Structure

Pages aren't just markdown — they have typed schemas. ICP pages carry firmographics, technographics, triggers, disqualifiers in predictable shapes. Pricing pages carry approval thresholds, discount bands, and conditions. When the agent queries "what's the discount guardrail for mid-market?", it doesn't parse prose — it reads a structured answer.

### 2. Provenance

Every factual claim carries a source. Not as a footnote — as a first-class field that the query surface can read. When the agent answers, it cites back to the source. When the source drifts, the lint detects it. When two sources contradict, the page gets flagged and humans decide.

### 3. Freshness signals

`verified_until`, `source_drift`, `has_contradiction`, `last_reviewed` — all first-class frontmatter. The agent can check these before trusting a claim. Staleness isn't invisible; it's explicit.

### 4. Navigation

A catalog the agent reads first (`index.md`), a routing map for context (`CLAUDE.md`), an audit log for history (`log.md`). Not embedding-based guessing, not vector similarity. Deterministic, inspectable retrieval.

## What agents look like on top of this layer

### AI SDR reading from a Company Index

Without: "Hi [name], noticed you're focused on operations. At our company we help optimize your operations." Generic. Off-brand.

With: first-call pitch anchored on the specific buyer's pain pattern (pulled from the persona page), the two comparable closed deals (pulled from win-loss patterns), and the product mix right for this segment (pulled from product-and-packaging). Cited back to the corpus.

The difference is not a better agent. It's the substrate.

### AI deal desk approving discounts

Without: agent reads CFO email, guesses at guardrails, recommends something, CFO overrides. Pilot churns.

With: agent reads [`../shared/pricing/discount-guardrails.md`](../shared/pricing/discount-guardrails.md), applies the four-condition strategic-exception check, cites the guardrail + the observed pattern from closed deals, routes to human for approval. Every recommendation traceable.

### AI CSM predicting churn risk

Without: generic "stage down" risk score based on CRM stage changes.

With: segment-specific risk model pulling from [`../shared/icp/`](../shared/icp/) fit signals, persona-level champion-departure signals from the CRM, expansion-trigger patterns from the corpus. Surface risk with the citations that back the assessment.

## The order matters

Foundation → Agents, not Agents → Foundation.

Teams that buy agents first discover the substrate problem in month three. Teams that build the substrate first ship agents in weeks, not quarters, because the agents have something to read from.

This is why the framework in this repo is "phase 0" work for any AI GTM initiative. The agents come after.

## Why this isn't "just good docs"

A well-maintained wiki is better than a rotting one. But for agents, the relevant axis is structure-for-machine-consumption, not readability-for-humans.

Three differences:

1. **Typed pages** — agents can navigate by type, by motion, by segment. A flat wiki requires the agent to re-derive structure every query.
2. **Claim-level provenance** — agents can cite back. A prose wiki makes the agent either drop citations or fabricate them.
3. **Freshness signals** — agents can refuse, hedge, or escalate when a page is stale. A prose wiki forces the agent to guess.

This framework is engineered for both. Humans browse it in Obsidian; agents query it through `ci` or native grep. Same corpus, two access patterns.

## Related

- [`01-WHY.md`](01-WHY.md) — failure modes prior attempts ran into
- [`02-ARCHITECTURE.md`](02-ARCHITECTURE.md) — three layers + navigation trio
- [`06-AGENTS-IN-ACTION.md`](06-AGENTS-IN-ACTION.md) — concrete before/after scenarios
- [`../PRINCIPLES.md`](../PRINCIPLES.md) — binding principles
