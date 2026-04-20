---
type: meta
title: Company Index skill
description: Claude Code / Cowork skill definition — registers ci as canonical retrieval path for this corpus.
owner: rasmus@latentflows.com
last_reviewed: 2026-04-19
---

# Company Index — Skill

> Claude Code / Cowork skill definition. Registers `ci` as the canonical retrieval path when operating against a Company Index repo. Drops in as an agent skill in frameworks that support the `AGENTS.md` / SKILL metadata pattern (Claude Code, Cowork, etc.).

---

## When to use

Trigger this skill when the user's question needs information from the Company Index corpus in this repo — ICP, personas, pricing, positioning, competitive intel, data definitions, or any function-specific content that's been filled in.

Trigger phrases include:

- "find the battlecard for X"
- "what's our pricing for enterprise usage?"
- "who are the buying committee personas for mid-market?"
- "show me the ICP tier for prime-fit accounts"
- "what's NRR benchmark for mid-market SaaS?"
- "is this discount within guardrails?"
- "what sources back the claim in X?"
- "who reviews pricing changes?"

Also trigger when the user is drafting content (outbound email, deal-review writeup, pitch deck update) that needs corpus-consistent facts.

## Retrieval protocol

**Always read `index.md` first.** It's the catalog — one-line summary per page. Locates candidates quickly without reading every file.

```
Read index.md → identify candidate pages → drill into the ones that match
```

Then prefer `ci` commands over native Read / Grep for corpus queries. `ci` is faster, deterministic, and provenance-aware.

### Query recipes

**Broad category scan:**
```bash
ci list --type icp                        # all ICP pages
ci list --motion sales-assisted            # pages tagged sales-assisted
ci list --segment enterprise               # pages tagged enterprise
ci list --consumer sales                   # pages sales reads from
```

**Targeted retrieval:**
```bash
ci show shared/pricing/price-book                     # print the page
ci show shared/pricing/price-book --section-filter "motion=plg"  # just PLG section
ci sources shared/icp/tier-1                          # sources backing claims
ci graph shared/pricing/price-book                    # inbound + outbound links
```

**Search across the corpus:**
```bash
ci search "discount guardrail mid-market"
ci search "NRR benchmark" --limit 5
```

**Freshness check before trusting a claim:**
```bash
ci verify shared/pricing/price-book    # fails if stale / broken
ci stale                               # corpus-wide staleness report
```

**Audit surface:**
```bash
ci log --since 30d --type pr-merged
ci pending                              # open PRs
ci diff 42                              # PR #42 diff + reviewer routing
```

## Fallback when `ci` isn't available

If `ci` isn't installed, fall back to native tools:

- Start with `Read index.md` (or `Glob *.md` + `Read` for structured exploration).
- Use `Grep` for content queries, filtered by directory: `grep -r "discount" shared/pricing/`.
- Read page frontmatter first to understand motion/segment scope before using body claims.

## Citing provenance

When summarizing corpus content in a response to the user, surface the source citations. Every factual claim on a page comes with a `[source: ...]` inline citation. Include them verbatim or as a condensed footnote.

**Bad:** "Discount guardrails cap at 18% for mid-market."

**Good:** "Discount guardrails cap at 18% for mid-market — raised to 22% for strategic-exception deals meeting all four conditions (3-year term, multi-product, reference commit, target-segment net-new logo) [source: `shared/pricing/discount-guardrails.md`]."

## When to warn vs. use

Don't trust a page that `ci verify` flags with:

- `verification_stale: true`
- `source_drift: true`
- `has_contradiction: [...]`

Surface the warning to the user if the page is load-bearing in your answer. Example: "Per `shared/pricing/price-book.md` (note: verification stale since 2026-03-15), current pricing is..."

## What this skill doesn't do

- **Write to the corpus.** This skill is read-only. Changes go via PR per [`ingestion/pr-workflow.md`](../ingestion/pr-workflow.md).
- **Cross organization boundaries.** This skill operates on a single fork of the corpus, not a federated view.
- **Substitute for `CLAUDE.md`.** `CLAUDE.md` is the routing map loaded at session start. This skill layers on top.

## Invocation examples

### Example 1 — AE prepping for a call

User: "Quick prep for a call with a mid-market fintech, VP RevOps buyer. What do we say and what do we avoid?"

Agent flow:

1. Read `index.md`. Locate: `shared/icp/` (tier fit), `shared/personas/personas/head-of-revops.md`, `shared/positioning/elevator-pitches.md`, `shared/competitive-intel/` for competitors in fintech.
2. `ci show shared/personas/personas/head-of-revops.md` → pains, objections.
3. `ci search "fintech" --limit 10` → any segment-specific content.
4. Synthesize: opener tied to a persona-specific pain; trap-set in case a common competitor shows up; avoid the anti-patterns documented in the elevator-pitches.
5. Surface `[source: ...]` citations for every concrete claim.

### Example 2 — Deal desk checking a discount

User: "Buyer is asking 25% off list for a mid-market multi-product deal with a 3-year term. What's the call?"

Agent flow:

1. Read `index.md`. Locate: `shared/pricing/discount-guardrails.md`.
2. `ci show shared/pricing/discount-guardrails` → approval thresholds.
3. `ci verify shared/pricing/discount-guardrails` → check freshness. If stale, surface the warning.
4. Cross-check: `ci search "mid-market strategic exception" --limit 5` for any additional context.
5. Respond: "25% requires CFO sign-off. 22% possible via strategic exception band if all four conditions are met [source]."

### Example 3 — HITL agent in a workflow

Programmatic use from an orchestrator:

```bash
# Get current ICP tier-1 firmographics for lead scoring
ci show shared/icp/tier-1 | yq eval '.firmographics // ""' - 2>/dev/null

# Get current pricing floor for a segment
ci list --type pricing-policy --segment mid-market | awk '{print $1}' | head -1 | xargs -I{} ci show {}

# Check nothing's flagged for drift before using
ci stale | grep -q "source_drift" && echo "WARNING: drift in corpus" >&2
```

## Related

- [`cli/README.md`](cli/README.md) — full CLI reference
- [`usage-patterns.md`](usage-patterns.md) — narrative examples (AE / Head of RevOps / HITL agent)
- [`../CLAUDE.md`](../CLAUDE.md) — routing map loaded at session start
