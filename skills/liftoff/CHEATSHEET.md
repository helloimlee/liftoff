# Liftoff cheat sheet

v0.18.0. What it does, what to say to get it, and when not to bother.

---

## The one-liner

Liftoff decides what good means before anything is made, and whether it landed after.
**Bring your own generator.** It routes exploring to `/design` in Claude Code, to Figma when that
is connected, or to a tournament when the argument matters more than the options, then scores what
comes back against a target you set first.

One command. Two stops: the target, and the pick. Everything else runs without asking.

---

## Who it is for

It has no taste. Everything it knows about good came from a designer, and both stops in the run
belong to a person. A FAIL is not the tool having an opinion, it is the tool holding you to yours.
Raises the floor for someone with a point of view; raises nothing for someone without one.

**It cannot rescue a bad target.** A thin brief produces a thin run and every gate downstream will
confirm the thin target was met.

Put another way, borrowed from a design education practice teaching this exact shift: **speed
without taste leads to noise, and real impact comes from knowing what good looks like.** Once
execution is nearly free, directing is the job.

## How to invoke it

Say any of these and it should pick itself up:

> design this properly · full pass · the whole treatment · make this great · liftoff

Or name it: `/liftoff [thing]`.

**Say more than the noun.** "Design the settings page" gets you a settings page. "Design the
settings page, it should make people feel like nothing is going to break" gets you a settings
page with a target it can be graded against. The second sentence is the whole difference.

---

## What it can actually do

### Decide what it is looking at
- Classifies **product track** (an interface) versus **brand track** (a static asset) and runs
  a different loop for each
- Sends brand work your style guide already answers out a **fast lane**, no full loop
- Reads what you attached and pulls in the right helpers on its own

### Check itself before it starts
- **Echoes the brief back** with every inference it made quarantined below a line as its own,
  then waits. Catches the confident misreadings that never surface as questions

### Set a target before building
- **Emotional target**: three feelings and a peak moment, written down and gradeable
- **A charter with fixed headings**: track, surface, constraints, definition of done, target,
  direction, stakes, attachments, anchors. Nine fields, matched literally, because everything
  downstream reads them and a missing one gets filled in with a guess that reads like a read
- **Idea pass**: one sentence naming a mechanism, tested four ways, before anything is drawn
- Runs research synthesis first when you hand it transcripts or tickets, so the target is
  derived rather than guessed
- **Reads video**: motion references, screen recordings, competitor flows, talks. Transcript
  only by default because it is free; frames only when motion is the point
- Reads the project's own `AGENTS.md` or `CLAUDE.md` before applying any of its own defaults
- **Remembers between runs.** Reads what past runs learned, files decisions including the
  direction that lost, and proposes new lessons once something has cost you three times

### Explore, only when the direction is open
- Single exploration for a screen or a direction check
- Tournament format when the stakes justify it: competing versions, a jury, a synthesis pass
- Skips the whole stage when the direction is already settled

### Build
- Reads the **live stylesheet** for real tokens before inventing any colour, face, or size
- Reads real reference images as taste anchors, which is what keeps output from looking
  generated
- Inherits existing components instead of growing a parallel set
- Writes UI microcopy and prose as separate jobs
- Reaches for 3D, scroll-timeline motion, or Lottie only when the surface actually needs it

### Grade it, honestly
- Craft verdict and a separate **emotional verdict**, both must pass
- Accessibility as a standing check on anything product track, not a late discovery
- **Slop sweep** against absolute bans, automatic, not on request
- **Failures phrased as "stop doing X"**, not "X could be improved". One is a thing to go do
- **Ordered by damage, not by ease**, and worked in that order on the way back
- **The grader cannot see how it was built**, and does not go looking. Build notes live outside
  the folder it is handed, because a grader who reads the reasoning agrees with the reasoning
- Motion craft gate where approval is earned rather than assumed
- Motion-gap analysis that also rejects things that should not animate
- Optional second opinion when the verdict is close

### Deploy agents efficiently
- **Building and grading are separate agents** with separate contexts. The runner explores and
  produces, the evaluator grades and is never shown how any of it was made
- **Recon runs as one parallel batch**: stylesheet, components, a11y baseline, research,
  anchors. Cheap model, no approval, nothing written
- **One writer per artifact**, always. Concurrent writes to one file fail later and confusingly
- **All six graders run at once** and merge into one verdict block, failures first
- **Autonomy slider per stage**, 0 to 3, that moves with earned trust rather than preference

### Hand off
- Engineering spec on request only: layout, tokens, props, states, breakpoints, edge cases,
  motion

### Audit something that already exists
- Accessibility baseline before touching a live site
- Codebase-scale motion audit as an entry point

---

## Cheat sheet: what to say

| You want | Say this | What runs |
|---|---|---|
| A real design pass | "design this properly, it should feel like X" | everything |
| Make sure it heard you | paste a long messy brief | echo first, acts on nothing until confirmed |
| Fast brand asset | "make the launch graphic" | fast lane, no loop |
| Direction unknown | "I don't know which way this should go" | explore stage wakes up |
| High-stakes direction | "run a deathmatch on this" | tournament format |
| Just execution | "the direction is settled, build it" | skips explore |
| A grade, not a build | "is this any good?" | evaluate only |
| Ready for engineering | "this is ready for handoff" | spec generated |
| Check an existing site | "audit this before we touch it" | baseline first |
| Learn from a video | "watch this and use it as reference" | `watch`, transcript first |
| Kill the AI smell | "check this for slop" | ban sweep, though it runs anyway |
| Keep it on a short leash | "surface every step" | drops produce to autonomy 1 |
| Let it run | "only stop me on a fail" | raises the wave to autonomy 3 |

---

## When NOT to use it

- **Mechanical fixes.** Contrast, a breakpoint, a typo. Running a full emotional map on a
  padding change wastes your time and teaches you to stop invoking it.
- **Brand work the style guide already answers.** Apply, verify, ship.
- **Decisions and documents.** Naming an emotional target for a pitch or a positioning doc is a
  fine standalone use of resonance without the rest of the loop.
- **Backend, data, or anything with no visual surface.**

---

## How to get the most out of it

**Give it the real system, not a description of it.** A URL to the live site beats a brand PDF.
It will read the stylesheet and use the actual tokens. Skip this and it will invent values that
look right and are wrong.

**Give it reference images, not adjectives.** "Premium and technical" produces a
premium-and-technical-shaped design, which is to say a forgettable one. Three screenshots of
work you actually admire produce something specific.

**Answer the classification.** It states its read in one line at the start. Correcting it there
costs a sentence; correcting it at hour three costs the build.

**Let it fail things.** The gate is the product. If you overrule every FAIL, you have bought a
slower version of a tool that agrees with you.

**Tell it when the direction is settled.** Otherwise it will explore, and exploring a decided
question is expensive theatre.

**Kill one direction out loud.** When it gives you options, rejecting one with a stated reason
is worth more than approving two.

---

## Known limits, plainly

- **It cannot always see its own output.** When the render path is down it will verify structure
  and say the visual check did not run. That verdict is UNVERIFIED, which is neither a pass nor a
  fail, and it does not trigger another build round. Structure passing is not the design being
  good. When it says this, you are the evaluator.
- **It stops after three rounds** whether or not it has a PASS, and hands back what still fails
  plus a read on whether the target or the surface is the real problem. Deciding that is yours.
- **Render engines need installing.** 3D, scroll motion, and Lottie are registered but not
  present by default. Script is in `scripts/`.
- **Escalation runs one direction.** A large ask that mentions accessibility can still land in
  the small audit skill and stay there. Drafted fix in `references/escalation-edits.md`, not
  applied.
- **The tournament format ships here now, and still depends on your environment.** Where
  `design-deathmatch` is missing, liftoff runs the format on its own personas, four at a time.
  That needs a subagent to be allowed to spawn subagents, which varies and is worth testing once
  rather than mid-tournament. Where it cannot, you get one exploration and a run that says so.
- **The grader is a separate agent that has to be installed.** `install.sh` places it. Without it
  the verdict falls to `maxq:evaluator`, which is a different context rather than a purpose-built
  grader. Without either, the run grades itself and labels the verdict SELF, which you should read
  as unreliable, because it is.
- **Inspiration sourcing works and has nothing to draw from** until boards get curated.
- **Memory is opt-in and human-confirmed.** It writes to `memory/` and proposes lessons, but
  never promotes one on its own. Counting is automatic; deciding it is true is not.

---

## The files

```
SKILL.md                          the loop
agents/liftoff-runner.md          explore and produce, stages 2 and 3
agents/liftoff-evaluator.md       stage 4, blind, holds every verdict
agents/liftoff-persona.md         one tournament entry, spawned four at a time
references/stack.md               the registry, ordering rules, production gotchas
references/run.md                 the sequence, and where the two stops sit
references/agents.md              waves, the autonomy slider, cost tiers
references/idea-pass.md           the verbal gate
references/echo.md                say the brief back before acting on it
references/style-extract.md       how to read a live system before inventing a token
references/anchor-prompts.md      what an anchor may carry beyond a screenshot
references/prose-tells.md         the writing half of the slop sweep
references/memory.md              what carries between runs, and the promotion bar
references/inspiration.md         outside reference, and how it feeds the anchors
references/escalation-edits.md    drafted, not applied
scripts/install-render-engines.sh tested
scripts/pinterest-sync.py         fallback path
CHANGELOG.md                      what changed and when
```

The agents install to `~/.claude/agents/`, not into the skill folder, because that is where a
picker looks for them. `./install.sh` does both.

---

## The shortest useful version

Give it a live URL, three reference screenshots, one sentence about how it should feel, and
permission to tell you no. Everything else it can work out.
