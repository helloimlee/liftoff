# The run

One command. Two stops. Everything else happens without asking.

```
/liftoff design the pricing page
```

---

## The reframe

`/design` shipped on 17 August and took the explore stage in a day. That is worth sitting with
rather than defending against, because it says something about where the durable value sits.

**Generators improve. Standards do not obsolete.** A better generator arrived and made one stage
of this loop redundant overnight. It did not make the target redundant, or the idea gate, or the
verdict, or what the last ten runs learned. Those got more useful, because the faster options
arrive the more the bottleneck moves to knowing which one is right.

So liftoff is not a design tool that competes with `/design`. It is the part that does not change
when the tools do: **it decides what good means before anything is made, and whether it landed
after.** Bring your own generator.

This also means liftoff cannot live inside any one surface. `/design` is Claude Code only. Figma
work happens through the Figma MCP wherever that is connected. The next generator will land
somewhere else again. The loop has to route to whatever is present and degrade cleanly when
nothing is.

---

## The order

### 0 · Echo, then recon
No stop. Both are fast and neither writes anything.

Say the brief back with every inference quarantined below a line as the loop's own. Then fan the
reads out in parallel on a cheap model: `AGENTS.md` or `CLAUDE.md`, the live stylesheet, the
existing component library, `memory/lessons.md`, any video via `watch`, an accessibility baseline
if something is already live.

### 1 · Charter and idea
Three feelings and a peak moment. Then one sentence naming a mechanism rather than a mood, run
through the four tests.

> ### STOP 1 · The target
> Everything downstream is graded against this, so a wrong target produces confidently wrong
> work all the way to the end. Confirming costs a sentence. This is the cheapest correction
> available anywhere in the run.

### 2 · Explore, routed by surface
Skipped entirely when the direction is settled.

| Where you are | What explores | Output |
|---|---|---|
| Claude Code | **`/design`** | editable artboards, tokens derived from the codebase |
| Figma MCP connected | **the loop writes boards directly** | real frames on a real canvas |
| Neither | `design-deathmatch`, or a single exploration | mockups or code |
| Stakes are an argument, not options | `design-deathmatch` regardless | competing directions with reasons on record |

Whichever runs gets the three feelings and the peak moment in its brief. An explorer with no
stated target returns options and a person picking a favourite.

### 3 · Score the set
Every option graded against the target before you look at them. Ranked, each with one line on
what it does to the peak moment and what it costs.

This is the step that changes what an option set *is*. Six artboards is a menu. Six artboards
with a stated target and a score each is a decision with the reasoning attached.

Scoring is fast and shallow on purpose: does it serve the peak moment, does it produce an
anti-feeling, does it carry the idea or just the style. Craft, accessibility and slop are not
assessed here, because they are cheap to fix and would drown the signal.

> ### STOP 2 · The pick
> You choose. The scores inform; they never decide. If you pick the one the loop ranked third,
> that is data about the target, not about your taste, and the target gets revisited rather than
> your choice overruled.

### 4 · Produce
Build the pick out. Real tokens, taste anchors, microcopy and prose as separate jobs, render
engines only if the surface needs them.

### 5 · Deep grade
All graders at once on the finished thing, merged into one verdict block: craft, emotional audit,
accessibility, slop sweep, motion craft, motion gaps. Failures first, each with a one-line reason
and the exact file or node.

### 6 · Iterate to PASS, then record
Fix the peak moment first. On PASS, file the decision and the options that lost into
`memory/decisions/`, and propose any lesson that has now cost you three times.

---

## Why two stops and not three

The target and the pick are the only two places where being wrong is expensive and correction is
cheap. Everything else is either too fast to be worth interrupting for, or cheap enough to fix
after the fact.

Stopping more often trains people to skim the checkpoints, and a skimmed checkpoint is worse than
none because it manufactures agreement. Stopping less means discovering at the deep grade that
the target was wrong three stages ago.

Autonomy per wave stays on the slider in `agents.md`: recon at 3, produce at 1 until trusted,
grade at 2. The two stops here are hard and do not move with trust, because they are not about
whether the loop is reliable. They are about whether it is aimed correctly, and only a person
knows that.

---

## When the run collapses

Most asks do not need all of this and the loop should say so rather than perform the full
sequence.

- **Direction settled**: skip explore and both scoring steps. Charter, idea, produce, grade.
- **Mechanical fix**: a contrast ratio, a breakpoint, a typo. Skip everything. Fix it.
- **Brand asset the identity files already answer**: apply, verify tokens, ship. No loop.
- **A grade, not a build**: run the deep grade alone against an existing target.

A loop that runs its full ceremony on a padding change teaches people to stop invoking it.
