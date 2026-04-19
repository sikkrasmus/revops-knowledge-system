# Agents in action

What agents do differently when they read from a Company Index. Three concrete scenarios comparing "without" and "with."

This doc is the rewrite of v0's agent scenarios, reframed around the `ci` CLI + `SKILL.md` + navigation trio. Worked `ci` commands are in [`../consumption/usage-patterns.md`](../consumption/usage-patterns.md) — this doc shows the *output* difference.

---

## Why this matters

The dirty secret of the AI GTM agent boom: [50-70% of teams buying AI SDRs churn within 3 months](https://prospeo.io/s/ai-sdrs) — ten times typical SaaS churn. The postmortems are consistent across products:

> "Despite providing detailed ICP information and brand guidelines, the output reads like generic AI-generated email." — [11x Alice review](https://marketbetter.ai/blog/11x-ai-review-2026/)

> "Hallucination is significant since they don't train their agent." — [Agentforce G2 analysis](https://www.oliv.ai/blog/salesforce-agentforce-reviews-analyzed)

> "Breeze performance is content-driven: if the knowledge base is thin, outdated, or inconsistent, you'll see that immediately in escalations." — [HubSpot Breeze review](https://www.eesel.ai/blog/hubspot-breeze-ai-review)

The agents aren't broken. The substrate they're plugged into is unstructured, undated, untyped, uncross-referenced. They re-derive context every query and confidently fill the gaps.

A Company Index closes those gaps.

---

## Scenario 1 — AI SDR drafting outbound

**Context**: $25M ARR SaaS targeting mid-market manufacturing. AI SDR receives a new lead: VP Operations at a 600-person metal fabricator. Job is a first-touch outbound email.

### Without a Company Index

Agent has: lead's LinkedIn, the company's website, basic firmographics, a generic "brand voice" prompt copied from a Notion doc 8 months ago.

```
Subject: Helping MetalCraft scale operations

Hi [First Name],

I noticed MetalCraft is a leader in metal fabrication and you're focused on
operations. At [our company] we help companies like yours optimize their
manufacturing operations and improve quality control.

Would you be open to a 15-minute conversation about how we can help
MetalCraft drive operational efficiency?

Best,
[Agent]
```

Generic. Off-brand. Mentions the wrong product mix for this segment. Doesn't reference the buyer's actual pain (VP Operations at a fabricator cares about throughput consistency under labor variability — not "operational efficiency"). Archived in 4 seconds.

### With a Company Index

Agent queries via `ci`:

```bash
ci list --segment mid-market --motion sales-assisted --consumer sales
ci show shared/personas/personas/head-of-operations       # if exists
ci show shared/competitive-intel/win-loss-patterns
ci search "fabricator throughput" --limit 5
```

Surfaced:

- Persona page for VP Operations in manufacturing: specific pain = throughput consistency under labor variability; critical event = compliance audit or labor turnover.
- Win-loss patterns: last 3 wins in this segment all opened with throughput-variability framing, not efficiency.
- Competitor page: two competitors active here, both stronger on optimization, weaker on quality integration.
- Pricing pattern page: per-line + per-quality-event is the fit unit-economics framing.

Agent drafts:

```
Subject: Throughput consistency at MetalCraft — last 3 fabricators saw
14-22% lift

Hi [First Name],

Quick note. The last three mid-market fabricators we worked with were
hitting throughput on good shifts but losing 14-22% to variability across
weeks. The pattern: defect-rate visibility was lagging the floor by 3-5
days, so corrections happened after the bad batch shipped.

Our quality module closes that gap to under 4 hours. The floor-optimizer
sequences around it.

I noticed you just hired four floor leads in Q1. If you're seeing similar
variability swings, worth 15 minutes? I can walk through a rollout from
a peer — they had their next board update in 6 weeks.

[Agent]

— Sources cited internally:
- shared/personas/personas/head-of-operations.md
- shared/competitive-intel/win-loss-patterns.md
```

Specific. On-brand. Correct product mix. Anchored on actual pain. Real proof points. Every claim traces to a page in the corpus.

**The difference is not a better agent. It's the substrate.**

---

## Scenario 2 — Deal desk handling a 25% discount ask

**Context**: A mid-market deal. Buyer asks for 25% off. AE escalates.

### Without a Company Index

Deal desk lead reads the email, opens 4 Slack channels, asks the CFO, pulls 3 prior deals from Salesforce manually, drafts a response. Round trip: 2 days. AE loses deal momentum.

CFO's instinct: "We've never gone above 18% in mid-market." Wrong. The last quarter saw 4 deals close in this segment at 22-24% with strategic-account justifications — but the pattern lives in no one's head.

### With a Company Index

Deal desk agent runs:

```bash
ci show shared/pricing/discount-guardrails
ci verify shared/pricing/discount-guardrails   # freshness check
ci sources shared/pricing/discount-guardrails  # what backs the claims
```

Surfaced:

- Standard threshold: 18% Deal Desk, 25% VP Sales.
- Strategic exception band 18-25% requires ALL FOUR conditions: 3-year term, multi-product, reference commit, target-segment net-new logo.
- Observed pattern (last 12 closed deals at >18%): all 12 had 3-year term; 10 of 12 had multi-product; 8 of 12 had reference commit.
- Verification fresh; no drift flags.

Agent drafts response in 30 seconds for deal desk approval:

```
Approve up to 22% IF buyer commits to:
1. 3-year term (currently 1-year — push)
2. Reference commitment within 90 days
3. Multi-product (Floor Optimizer + Quality Sentinel)

Otherwise hold at 18%, walk if needed.

Last 12 strategic-exception deals in this segment at 22-24% all expanded
within 9 months — pattern is real.

Sources:
- shared/pricing/discount-guardrails.md
- sources/internal-docs/2026-Q1-deal-review.md
```

Deal desk lead approves. AE counters in 45 minutes. Deal closes at 21% the following week.

**Two days collapsed to 45 minutes. CFO's stale instinct overridden by the actual pattern. Corpus cites its own freshness.**

---

## Scenario 3 — New-hire AE discovery prep

**Context**: Mike, new AE, preparing a discovery call with a mid-market fintech. He knows SOC 2 will come up. He doesn't know how this segment handles it.

### Without a Company Index

Mike posts in `#sales-help`: "How do we handle SOC 2 questions from mid-market fintechs?"

Three reps reply within 4 hours with three different answers. Two are 8 months stale. One is correct but lacks the follow-up question. Mike pieces together a generic answer, uses it on the call, the CISO sees through it.

Forrester: 65% of reps can't find the right content; they spend 440 hours/year searching.

### With a Company Index

Mike asks Claude:

```bash
ci search "SOC 2 fintech" --limit 10
ci list --type objection --segment mid-market
ci show shared/competitive-intel/competitors/vextrix  # if applicable
```

Surfaced:

- Objection page "SOC 2 — fintech mid-market": tested response (4 sentences); what NOT to say (overpromising Type 2 audit timing); reframe question to ask back ("what's your audit cadence?").
- Postmortems: 3 most recent fintech deals where SOC 2 surfaced. 2 won, 1 lost. Lost one: pushed too hard on cert timing without acknowledging the buyer's audit window. Won ones: led with the SOC 2 evidence vault, not the certificate.
- Competitor page (for the top competitor in fintech): they lead with their SOC 2 cert — counter-positioning included.
- Pricing pattern: fintech mid-market deals close 8% below segment average — security review cost is real.

Mike reads in 4 minutes. Goes into call with tested response, follow-up question, awareness of the failure mode. Handles the objection on the call. CISO respects the answer.

**4 hours of Slack archaeology collapsed to 4 minutes. New-hire ramp problem starts to dissolve.**

(Average SaaS sales ramp is now 5.7 months, up 32% from 4.3 months in 2020 — despite the entire AI tooling boom. The unfindable-knowledge tax is the single largest contributor.)

---

## What changes when the substrate is real

Three things, every time:

1. **Output stops being generic.** Agents reference specific postmortems, named patterns, the right product mix per segment.
2. **Hallucinations become detectable.** Typed schemas and dated sources let the agent refuse, hedge, or escalate instead of confidently making things up. The index knows what it doesn't know.
3. **Cycle times collapse on the queries that matter.** Discount approvals in 45 minutes. Discovery prep in 4 minutes. Forecast confidence in seconds.

---

## Three more scenarios, briefer

### CSM preparing for a QBR with an at-risk account

CSM agent queries: which postmortems and champion profiles are most relevant; which expansion patterns the segment follows; which objection patterns surface in renewal conversations. Output: a QBR prep doc with cited risk indicators and 3 expansion plays — not a generic template.

### Forecasting agent assessing pipeline confidence

Forecast agent traverses: which deals match closed-won patterns from postmortems; which deals show conflict signals (e.g., champion profile says "VP Engineering" but active contact is a director); which segment pricing patterns diverge from current guidance. Output: confidence-weighted forecast with deal-level reasoning.

### RFP response drafting

RFP agent queries: ICP + battlecard for the buyer's segment; most differentiated pricing pattern; postmortems where similar RFPs were won/lost. Output: RFP draft leading with proven differentiation per question — not a generic capabilities dump.

---

## Try it yourself

Every scenario above is reproducible once the corpus is filled. Phase 3 ships the synthetic-company example — point any LLM at that corpus and reproduce these scenarios.

For your own source data, the [`../PILOT.md`](../PILOT.md) is the 4-6 week shortcut.

## Related

- [`../consumption/SKILL.md`](../consumption/SKILL.md) — Claude Code skill definition
- [`../consumption/usage-patterns.md`](../consumption/usage-patterns.md) — full command sequences
- [`04-FOUNDATION-BEFORE-AGENTS.md`](04-FOUNDATION-BEFORE-AGENTS.md) — why this layer is prerequisite
- [`01-WHY.md`](01-WHY.md) — why every prior attempt failed
