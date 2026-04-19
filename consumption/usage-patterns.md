---
type: meta
title: Usage patterns
description: Worked narratives for AE, Head of RevOps, and HITL agent use of the CLI in-workflow.
owner: rasmus@unfrankenstein.io
last_reviewed: 2026-04-19
---

# Usage Patterns

Three worked narratives. Each demonstrates how a specific user retrieves from the corpus in-workflow. Commands are literal — copy-paste-runnable against a filled corpus (Phase 3 synthetic-company instance, or your own fork).

The point: retrieval isn't abstract. It's what an AE types into Claude at 9:03 AM before a 9:15 call. If that user flow is friction-laden, the corpus might as well not exist.

---

## Narrative 1 — AE preparing for a deal review

**Context.** Marcus is an AE working a mid-market opportunity with Acme Fintech. ACV looks like $65K, champion is their new VP RevOps, CFO is the economic buyer. Pre-deal-review, 20 minutes. He needs to show pattern fit, handle the predictable objections, and know the pricing levers.

### Step 1 — situate the deal

Marcus asks Claude in his editor:

> "Deal review prep. Mid-market fintech, $65K ACV, champion is new VP RevOps, CFO is EB. What patterns apply and what's the right pricing posture?"

Claude's retrieval:

```bash
# 1. Start with the catalog.
ci list --motion sales-assisted --segment mid-market
# → shortlist of relevant pages

# 2. Persona and committee
ci show shared/personas/personas/head-of-revops
ci show shared/personas/buying-committees/mid-market-sales-assisted

# 3. Pricing context
ci show shared/pricing/price-book --section-filter "segment=mid-market"
ci show shared/pricing/discount-guardrails
```

### Step 2 — spot patterns

```bash
# Win-loss patterns for mid-market
ci show shared/competitive-intel/win-loss-patterns
```

Claude surfaces: "New-hire champion (<90 days) correlates with 1.4x win rate. Strategic-exception discount band unlocked if 3-year term + multi-product + reference commit."

### Step 3 — check for staleness

Before Marcus trusts the pricing, Claude runs:

```bash
ci verify shared/pricing/discount-guardrails
```

Result: `verify: 0 fail, 0 warn`. OK to cite.

### Step 4 — synthesize

Marcus gets a one-page brief with direct citations:

> **Pattern fit:** new-hire champion (win-rate 1.4x) [source: `shared/competitive-intel/win-loss-patterns.md`].
> **Pricing posture:** $65K ACV with 3-year term unlocks 22% strategic-exception band IF champion commits to a reference in 90 days [source: `shared/pricing/discount-guardrails.md`].
> **Objections (ranked for this persona):** "We've tried tools that didn't stick" / "data too messy" / "we can build it" [source: `shared/personas/personas/head-of-revops.md`].

**Total elapsed:** ~90 seconds. Every claim cited. Marcus walks into the deal review able to defend every number.

---

## Narrative 2 — Head of RevOps doing territory planning

**Context.** Nadia is Head of RevOps. Q3 territory planning. She needs to see the shape of the addressable market by tier × motion × segment, reconcile against current closed-won patterns, and spot any discrepancies between ICP definitions and where deals are actually closing.

### Step 1 — inventory the spine

```bash
ci list --type icp
# all ICP tier pages

ci list --type persona
# all persona pages

ci list --type pricing-policy
# pricing artifacts
```

### Step 2 — cross-section analysis

```bash
# All content for mid-market segment
ci list --segment mid-market

# All content for enterprise motion
ci list --motion enterprise
```

### Step 3 — freshness sanity check

```bash
ci stale
```

Surface: pages with `verified_until` past, `source_drift` flags, `has_contradiction` markers. Nadia triages each before building the plan.

### Step 4 — check who's cited

```bash
# What pages depend on tier-1 ICP?
ci graph shared/icp/tier-1

# What pages depend on the price book?
ci graph shared/pricing/price-book
```

Nadia uses `ci graph` to trace the impact radius of any change she's considering. "If I refine tier-1 firmographics, which downstream pages need re-verification?"

### Step 5 — log audit

```bash
# Recent strategic changes
ci log --since 30d --type pr-merged

# Recent drift events
ci log --since 90d --type drift-detected
```

Nadia scans the audit trail for patterns: which pages are changing often? Any suggest a deeper drift?

### Step 6 — write the plan

She drafts territory boundaries referencing the tiers directly. Her plan document cites:

- `shared/icp/tier-1.md` for prime-fit targets
- `shared/icp/tier-2.md` for ABM territory
- `shared/personas/buying-committees/mid-market-sales-assisted.md` for the committee composition
- `shared/pricing/price-book.md` for the ACV bands per tier

Because she's citing the live corpus, when she ships the plan, it stays consistent with whatever the wiki says at the time of execution. No stale handoff.

---

## Narrative 3 — HITL agent in a workflow

**Context.** A deal-desk agent runs automatically on every discount request that exceeds the AE's threshold. The agent pulls policy, checks conditions, drafts an approval recommendation, and routes to the human deal desk reviewer.

### Agent logic (illustrative)

```bash
#!/usr/bin/env bash
# deal-desk-agent.sh
# Invoked via webhook when a discount request exceeds AE threshold.

DEAL_ID="$1"       # CRM deal ID
ASK_PCT="$2"       # discount requested, as percentage
SEGMENT="$3"       # smb | mid-market | enterprise
TERM_YEARS="$4"    # contract term length
MULTI_PRODUCT="$5" # yes | no
REF_COMMIT="$6"    # yes | no
NEW_LOGO="$7"      # yes | no

# 1. Pull current guardrails
POLICY=$(ci show shared/pricing/discount-guardrails)

# 2. Pre-flight freshness
if ! ci verify shared/pricing/discount-guardrails > /dev/null 2>&1; then
  # Policy is stale — surface to reviewer, don't auto-recommend
  echo "ESCALATE: discount-guardrails.md has verify failures"
  exit 2
fi

# 3. Determine band
if (( $(echo "$ASK_PCT <= 18" | bc -l) )); then
  RECOMMENDATION="standard_approve"
elif (( $(echo "$ASK_PCT <= 25" | bc -l) )); then
  # Strategic exception band
  if [[ "$TERM_YEARS" == "3" && "$MULTI_PRODUCT" == "yes" && "$REF_COMMIT" == "yes" && "$NEW_LOGO" == "yes" ]]; then
    RECOMMENDATION="strategic_exception_approve"
  else
    RECOMMENDATION="hold_at_18"
  fi
else
  RECOMMENDATION="escalate_cfo"
fi

# 4. Cross-reference against observed closed-deal pattern
CLOSED_PATTERN=$(ci sources shared/pricing/discount-guardrails)
# ... reviewer agent consumes this

# 5. Output structured recommendation + citations
cat <<JSON
{
  "deal_id": "$DEAL_ID",
  "recommendation": "$RECOMMENDATION",
  "policy_source": "shared/pricing/discount-guardrails.md",
  "policy_verified_at": "$(ci verify shared/pricing/discount-guardrails | head -1 || echo 'unknown')",
  "requires_human_review": true
}
JSON
```

### Why `ci` is the right interface here

- **Deterministic** — no LLM re-derivation of policy; same input → same output.
- **Provenance-aware** — the recommendation cites the policy file the decision came from, with verification status.
- **Fast** — grep + frontmatter parsing beats any RAG pipeline at sub-10ms latency.
- **Audit-friendly** — every invocation is logged via the agent's orchestrator, and the policy source itself is git-tracked.

### What the agent does NOT do

- Doesn't auto-approve anything. Output is always `requires_human_review: true`.
- Doesn't update the corpus. If the agent's decision consistently diverges from guardrails (pattern drift), a HUMAN opens a PR — per [`../ingestion/pr-workflow.md`](../ingestion/pr-workflow.md).
- Doesn't cross the always-PR line. Pricing changes always go to a human.

---

## Cross-narrative lessons

1. **Start with `index.md`.** Every narrative begins with reading the catalog to locate candidates. Skipping this means reading everything.
2. **Cite inline.** Claims without `[source: ...]` rot. Every answer a human reads should carry its provenance.
3. **Check freshness before trusting.** `ci verify` on load-bearing pages takes milliseconds. Saves a day of "why did the plan fail."
4. **Use `ci graph` before making changes.** Knowing the impact radius of a page edit prevents the "I updated one thing and broke ten downstream claims" pattern.
5. **Use `ci log` for pattern detection.** Weekly scan reveals which pages are churning, which stay stable, and where drift concentrates.

## Related

- [`SKILL.md`](SKILL.md) — skill definition for Claude Code / Cowork
- [`cli/README.md`](cli/README.md) — full CLI reference
- [`../CLAUDE.md`](../CLAUDE.md) — routing map
- [`../PRINCIPLES.md`](../PRINCIPLES.md) — principle 4 (consumption is the product)
