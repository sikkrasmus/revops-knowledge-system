# Section Labels

In-file syntax for scoping headings to specific motion/segment combinations. Enables a single canonical page to carry multiple views without parallel directory trees.

`ci verify` enforces the grammar mechanically. `ci show --section-filter "motion=plg"` extracts only labeled sections matching a filter.

---

## Syntax

```
<heading-text>  {<key>: <value>[, <key>: <value>]*}
```

Rules:

- **Two spaces** between heading text and opening `{`.
- Inside braces: comma-separated `key: value` pairs.
- **Single space** after `:` and after `,`.
- **No spaces** immediately inside braces (`{motion: plg}` not `{ motion: plg }`).
- Allowed keys: `motion`, `segment`.
- Values: single value per key from the corresponding enum (see [`enums.yaml`](enums.yaml)). List values inside braces are **not allowed** in v1.
- Empty braces `{}` are invalid.

## Valid examples

```markdown
## Self-serve / PLG pricing  {motion: plg}

Pricing for self-serve customers entering the funnel...

## Sales-assisted pricing  {motion: sales-assisted, segment: mid-market}

For deals under $50K ACV where an AE is involved...

## Enterprise pricing  {motion: enterprise, segment: enterprise}

Custom MSAs, usage-based tiers, legal review required...

### Mid-market discount guardrails  {segment: mid-market}

Standard max discount in mid-market...
```

## Invalid examples (fail `ci verify`)

```markdown
## Pricing { motion: plg }                  ← extra space inside braces
## Pricing  {motion:plg}                    ← missing space after colon
## Pricing  {motion: plg,segment: mm}       ← missing space after comma
## Pricing  {motion: [plg, slg]}            ← list value not allowed in v1
## Pricing {motion: plg}                    ← single space before brace, need two
## Pricing  {}                              ← empty braces
## Pricing  {motion: growth}                ← unknown enum value
## Pricing  {type: icp}                     ← unknown key (only motion/segment allowed)
```

## Parser rule (regex for `ci`)

```
^(#{1,6}\s+.+?)\s\s\{((?:[a-z_]+:\s[a-z\-]+)(?:,\s[a-z_]+:\s[a-z\-]+)*)\}$
```

Groups:

1. Heading content (`#`-prefix + title text)
2. Label payload (key-value pairs inside braces)

## When to use section labels vs. frontmatter tags

- **Frontmatter `motion:` / `segment:`** — page-level broad filter. "This whole page applies to these motions."
- **In-file section labels** — precise per-heading scope. "This specific sub-section applies to this motion."

A page with `motion: [plg, sales-assisted]` in frontmatter typically contains both unlabeled sections (apply to all tagged motions) and labeled sections (scope narrower). Example:

```markdown
---
type: pricing-policy
motion:
  - plg
  - sales-assisted
segment:
  - smb
  - mid-market
---

# Price Book

## Common principles

Both PLG and sales-assisted motions share these billing cadence rules...

## Self-serve / PLG pricing  {motion: plg}

Details for PLG customers only...

## Sales-assisted pricing  {motion: sales-assisted}

Details for sales-assisted motion only...
```

## Extraction via `ci`

```bash
# Show only PLG-scoped sections of a page
ci show shared/pricing/price-book --section-filter "motion=plg"

# Show only enterprise-segment sections across all pages
ci list --type pricing-policy | xargs -I{} ci show {} --section-filter "segment=enterprise"
```

## Why this grammar

- **Machine-parseable** — the regex above is precise, no ambiguity.
- **Human-readable** — labels sit at the end of the heading line, not a separate block.
- **Grep-friendly** — `grep '{motion: plg}'` works across the corpus.
- **No new markdown tokens** — a standard heading with a trailing comment-like suffix, so Obsidian / VSCode / GitHub all render the heading correctly and the label is visible inline.

## Extending to other keys

Adding a key (e.g., `region`, `phase`) requires:

1. A PR to `enums.yaml` defining the enum values.
2. A PR to this file adding the key to the allowed list.
3. A PR to the `ci verify` regex in [`../consumption/cli/lib/verify.sh`](../consumption/cli/lib/verify.sh) to include the new key.

v1 ships with only `motion` and `segment`. Don't add keys ad-hoc.
