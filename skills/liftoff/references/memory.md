# Memory

Liftoff's longest-standing gap: it has no memory between runs. Every pass rediscovers what the
last one learned, and hard-won rules survive only because somebody hand-edited `stack.md`.

This closes it with a folder. Markdown files in git, no vector database, no service, no
subscription. Architecture borrowed from the Agentic Design Wiki, whose author puts the case
better than a longer argument would: **the schema is the product, not the contents.**

---

## What we took, and what we left

Taken: the **memory architecture**. Filed decisions, promoted lessons, an append-only log, and
a clear contract about who owns which layer.

Left: the **vendored content**. That repo ships a copy of Material Design's tokens and the
Microsoft Style Guide as markdown. For liftoff that is an anti-pattern, and specifically the one
its hard gate exists to prevent: read the live stylesheet before inventing a token. A vendored
third-party system is a second source of truth that drifts, and the day it disagrees with the
project's real CSS, the copy wins by being closer to hand. Also skipped its `generate-*` recipes
and voice pages, which are impeccable's and the visual identity files' ground.

---

## The three layers

Ownership matters more than structure. An agent that can rewrite its own inputs will eventually
launder a guess into a fact.

| Layer | Owner | Mutability |
|---|---|---|
| `sources/` | human curates | **immutable.** read, never write |
| `memory/` | the loop owns | create, update, cross-reference |
| `stack.md`, `SKILL.md` | human writes | stable contract |

Liftoff writes to `memory/` and nowhere else.

---

## What gets written

```
memory/
  lessons.md          rules that earned permanence
  decisions/          one file per real decision, including the ones that killed a direction
  log.md              append-only. never edited
```

### `decisions/`

A decision gets filed when a direction is chosen or killed for a stated reason. Not every
preference, and not every tweak. The test is whether someone six weeks from now would otherwise
re-propose the thing you just rejected.

```
---
type: decision
date: YYYY-MM-DD
project: <slug>
status: chosen | killed | superseded
---

**The call.** One sentence.
**Why.** The reason, including the option that lost and what it lost on.
**What it decides going forward.** The things this settles without further asking.
```

The losing option is the part people skip and the part worth the most later. A record that only
holds winners cannot stop anyone re-litigating.

### `lessons.md`

A lesson is a rule that earned permanence. The promotion criterion is the whole mechanism, and
without it this file becomes a junk drawer:

**A note becomes a lesson when it has cost you something three times, or once expensively.**

Anything below that bar stays a note in the run summary and is allowed to be forgotten. Most
observations should be forgotten. The filter is the feature.

Each lesson carries four lines:

```
**Rule.** One sentence, imperative.
**Why.** The incident or the pattern that earned it.
**Triggers.** When this applies, so it fires at the right moment.
**Anti-pattern.** What ignoring it looks like, so it is recognisable in the wild.
```

The anti-pattern line is the one that makes a lesson usable. "Read the live stylesheet" is
advice. "Inventing a warm accent for a system that already ships one" is a thing you can spot.

### `log.md`

Append-only. One line per run: date, what was attempted, the verdict. Never edited, because a
history you can rewrite is not a history.

---

## How it wires into the loop

**Wave A recon reads `lessons.md`.** Cheap, and it means a run starts already knowing what the
last ten runs learned. This is the highest-value read in the whole recon set and it costs
nothing.

**Stage 5 iterate files the decision.** Whatever direction won, and whatever got killed. Written
at the moment the reasoning is still in the room rather than reconstructed later.

**Evaluate proposes promotions.** When a verdict repeats something already in the log, say so
and offer to promote it. The loop counts; the human confirms. Automatic promotion would fill
`lessons.md` with noise inside a month.

---

## The rule that keeps this honest

**Nothing gets promoted by an agent alone.** Liftoff can count occurrences, spot the repeat, and
draft the lesson. A human decides whether it is true. Memory that writes itself is how a
confident mistake becomes a permanent one, and this loop already has enough ways to be wrong
quickly without inventing a way to be wrong forever.
