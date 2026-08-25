---
name: liftoff
description: 'One command that runs a design job end to end and can fail it. Bring your own generator: it routes exploration to /design in Claude Code, to Figma when the MCP is connected, or to a tournament when the argument matters more than the options, then grades what comes back against a target you set first. Trigger on "design this properly", "full pass", "the whole treatment", "make this great", "liftoff", or any substantial design request. Two stops only: the target, and the pick. Use this instead of calling resonance, impeccable, design-critique, accessibility-review, ux-copy or design-system alone.'
version: 0.18.1
user-invocable: true
argument-hint: "[target]"
---

The full MaxQ design pass, run as a charter loop.

## What this is

**Generators improve. Standards do not obsolete.** `/design` shipped on 17 August 2026 and took
this loop's explore stage in a day. That is the right outcome and it points at where the durable
value actually sits: a better generator makes the target, the idea gate, the verdict and the
accumulated lessons *more* useful, not less, because the faster options arrive the more the
bottleneck moves to knowing which one is right.

So liftoff does not compete with a generator. **It decides what good means before anything is
made, and whether it landed after.** Bring your own generator.

That is also why it cannot live inside one surface. `/design` is Claude Code only. Figma work
runs through the Figma MCP wherever it is connected. The loop routes exploration to whatever is
present and degrades cleanly when nothing is.

**One command, two stops.** The target and the pick. Everything else runs without asking. Full
sequence in `references/run.md`.

## Who this is for

**Liftoff has no taste.** Everything it knows about good came from a person: the three feelings,
the idea sentence, the reference images, the real tokens, the lessons that earned their place by
costing something. Strip the designer out and what remains is a confident measuring instrument
pointed at nothing.

That is the design, not a limitation to apologise for. A FAIL is not the loop having an opinion.
It is the loop holding you to yours, consistently, at 4pm on a Friday when you would rather it
did not.

Which is why the two stops belong to a person and never move. Max q is the moment the instruments
report peak structural stress. They do not decide whether to throttle down. That is the pilot,
and it always was.

**The failure mode worth naming out loud:** this can become a way to feel rigorous without being
rigorous. Someone runs the loop, gets a PASS, and treats the PASS as the judgment rather than as
confirmation that their own judgment was applied consistently. A target written by someone who
does not know what they want produces confidently wrong work faster than no process at all. The
loop cannot rescue a bad target. It will execute faithfully toward the wrong feeling and grade
itself green the whole way.

**Worth knowing this is not a private theory.** A design education practice training designers on
exactly this shift states it more cleanly than the paragraphs above: *speed without taste leads to
noise, and real impact comes from knowing what good looks like.* Same conclusion, arrived at
independently, from people whose whole business is watching what happens to designers when
execution gets cheap. Their read is that AI did not speed the old process up, it collapsed the
steps into each other, which moves the scarce skill from producing to directing.

So: this raises the floor for a designer with a point of view, and raises nothing at all for
someone without one. Generators made options cheap. That moved the scarce skill from making
things to **knowing what to approve, reject and change**, which is the one part of this that has
never been automatable and is not close to becoming so.

Read `references/stack.md` first. It is the registry of which skills and agents are in the pass and when each runs. Skip anything marked `off` or not installed, and name what you skipped. A missing skill degrades the pass; it never breaks it.

## The loop

### 1. Charter

**Fan the recon out first.** Everything classify needs is a read, and reads are independent:
the project's own `AGENTS.md` or `CLAUDE.md`, the live stylesheet, the existing component
library, an accessibility baseline, any research corpus, the taste anchors, any video
reference via `watch`, and `memory/lessons.md`, which is what the last ten runs learned and the
cheapest high-value read in the set. Run them concurrently on a cheap model in one round trip. Nothing is
written, so nothing needs approving. Detail in `references/agents.md`.

**Echo the brief before you touch anything.** Say back what you absorbed, and put every
inference you made below a hard line labelled as yours. A clarifying question verifies what you
doubt; the echo verifies what you believe, and confident misreadings never feel uncertain enough
to become questions. Act on nothing until it comes back answered. Under fifteen lines, skipped
for small literal asks. Full shape in `references/echo.md`.

**Read the room before you write anything.** Classify the ask on two axes, out loud, in one line.
Then ask one more thing that the two axes miss: **what is actually stuck?** Not what track this is,
but what the person has already tried and where it stalled. A full loop run against a narrow,
specific blockage is ceremony, and the assessment is what catches that before the ceremony starts. If the classification is wrong the user corrects it here, for free.

**Track.** Product or brand.

- **Product track.** The output is an interface someone uses. Run the full loop below.
- **Brand track.** The output is a static asset: a lockup, a slide, a one-pager, a social post. If the three visual identity files (`Brand-Style-Guide.md`, `Reference-Library.md`, `Layout-System.md`) already answer the question, apply them, run the token verification, and stop. That is the fast lane and it does not need liftoff. Only when the asset needs real exploration does it come back here, in document mode: keep the target and the resonance audit, skip `impeccable` and the evaluator.

**Inputs on the table.** Whatever is attached decides which sub-skills ride along.

- A Figma file or an existing component library: pull `design-system` for context before producing, so the build inherits real components instead of quietly growing a parallel set.
- A research corpus (transcripts, tickets, survey results, call notes): run `research-synthesis` before the charter and feed its themes into the emotional target. A target derived beats a target guessed. If the research does not exist yet and the decision needs it, `user-research` plans it.
- An existing live site or app: run `accessibility-review` as a baseline before touching anything, so you can tell what you inherited from what you broke.
- Real UI copy in scope: `ux-copy` runs inside produce.
- Motion anywhere in the ask: `motion-design` runs with the target, deciding what the movement should feel like before any engine gets involved.
- A curated Pinterest board on the subject: sync it into `Reference-Library.md` now, not later. See `references/inspiration.md`.
- A video, whether motion reference, screen recording, competitor flow or a talk: `watch` at `--detail transcript` first, which is free and skips the download. Escalate to `--detail balanced` only when motion itself is the subject, because a still cannot anchor how something moves.
- An `AGENTS.md` or `CLAUDE.md` in the repo: read it before anything else. The project's own conventions outrank anything this loop would infer.

### 1a. The charter, and where the run lives

`charter.md` is the only thing that crosses between stages, so it carries every field a later
stage will assert on it. **These headings are matched literally.** Renaming one is how a stage
starts inferring instead of reading.

```
## Track                product | brand-document
## Surface              what is being designed, specific enough to build from: which screen,
                        which states, which breakpoints. "The onboarding" is not a surface.
## Constraints          stack, components that must be reused, what must not change
## Definition of done   what the deep grade holds the normal verdict against
## Emotional target     three feelings, one peak moment
## Direction            settled | unknown. Settled skips explore.
## Stakes               routine | high. High is what buys a tournament, and it is rare.
## Attachments          what is on the table, including any accessibility baseline
## Anchors              absolute paths to the taste anchors and the real tokens
```

If PRODUCT.md already has a current `## Emotional target` block, copy it in. If not, run
`resonance map` and write the result into both PRODUCT.md and the charter.

**Write the fields out even when the template is missing.** Earlier versions pointed at
`loops/charter-template.md` and assumed it would be there. A stage that cannot find its template
does not stop. It improvises a charter with three of the nine fields, and every later stage
fills the gaps with guesses that read exactly like reads.

Two of those fields exist only because this stopped being one context. `## Surface` and
`## Definition of done` used to live in the conversation, where whoever set the target and
whoever built were the same reader. They are written down now because a grader who cannot see
the request has to be told what was asked for, and a builder who cannot see the grade has to be
told what it will be held to.

**One directory per run**, so every path handed to a later stage resolves from anywhere:

```
.liftoff/<slug>/charter.md, anchors.md
.liftoff/<slug>/rounds/NN/artifact/       what gets graded
.liftoff/<slug>/rounds/NN/build-log.md    how it got built. Never inside artifact/.
.liftoff/<slug>/rounds/NN/explore/01..05  one slot per direction; 05 is the synthesis, which competes rather than concludes
```

Four concurrent explorers given no slots all write `index.html` to the same place and quietly
overwrite each other. The build log sitting one level up is structural rather than tidy, for
the reason in evaluate.

Confirm the three feelings and the peak moment with the user before producing anything. This is the cheapest moment to disagree and the most expensive one to skip.

### 1b. The idea pass

Two minutes, before anything gets drawn. Say what this is in one sentence that names a
mechanism rather than a mood, then run it through four tests: can someone who cannot see it
repeat it back and still be describing something specific; is it one generative move rather
than three good ones; does it keep deciding things after you stop drawing; can it be named in
two or three words that are not adjectives.

Full gate in `references/idea-pass.md`. Failing is cheap and normal. Ideas come from mechanisms
in the world, an assay, a pressure curve, a certificate, not from a moodboard.

Resonance decides how it should feel. Impeccable decides whether the execution holds. This
answers the only question neither can: is it about anything.

Skip for genuinely mechanical work. A padding fix does not need a thesis.

### 2. Explore, only if the direction is unknown

Skip this stage when the direction is settled and this is execution.

**`liftoff-runner` executes this stage and produce.** It takes the charter path, a round number
and an output directory, and it hands back the option set. The routing question comes before the
explorer question: if the value is the argument rather than the options, it is a tournament
whatever surface you are standing on. Everything else routes by surface.

**`/design` is the explorer** when you are in Claude Code. It reads the codebase, derives tokens
from the existing visual style, and returns editable artboards you can accept or reject
individually. That is a better exploration than this loop ever produced on its own, and the
honest move is to use it rather than compete with it.

- **The Figma MCP** writes real boards to a real canvas wherever it is connected. Clone existing
  artwork, inherit real components, never open a blank frame.
- **`design-deathmatch`** only when the stakes justify a tournament and the value is the
  argument rather than the options: two people stuck on direction, or a peak moment where the
  losing directions need to be on record with reasons.
- **`liftoff-persona`**, four in parallel with one output slot each, when a tournament is
  warranted and `design-deathmatch` is not installed. That is the only thing the fan-out is for.
- **`maxq:designer`** as the fallback when none of those is available.

**What this stage still owes, whichever explorer runs.** Pass the three feelings and the peak
moment into the brief, because an explorer with no stated target returns options and a person
picking a favourite. Then judge the winner against the target before accepting it.

That last sentence is the whole reason this stage did not disappear. "Best of the options I was
just shown" is a relative judgment with no outside standard. A design can win the comparison,
match your tokens, be the strongest of six, and still miss the feeling. Accepting an artboard is
a preference. Grading it against a written target is a verdict.

### 2b. Score the set

Grade every option against the target *before* the user looks at them. Ranked, each with one line
on what it does to the peak moment and what it costs. **The loop scores, never the runner.** It
commissioned those options, so a ranking from it is the builder grading the build one step
removed.

This is what changes an option set into a decision. Six artboards is a menu. Six artboards with a
target and a score each is a decision with its reasoning attached.

Keep it fast and shallow: does it serve the peak moment, does it produce an anti-feeling, does it
carry the idea or only the style. Craft, accessibility and slop are not assessed here; they are
cheap to fix and would drown the signal.

**Then stop.** The user picks. Scores inform and never decide. If they pick the one ranked third,
that is information about the target, not about their taste, and the target gets revisited rather
than the choice overruled.

### 3. Produce

The runner owns this stage too, and hands to **`impeccable`** with the target stated explicitly in the brief, not just left in PRODUCT.md for it to find. Impeccable reads PRODUCT.md during setup, so the target arrives either way, but a named target in the prompt outperforms a filed one.

**Read the live system before inventing a single token.** If the work ships anywhere with an
existing stylesheet, pull the real values from source before choosing a colour, a face, or a
size. Not from memory, not from a brand doc that may have drifted. This is a hard gate because
the failure is invisible: inventing a warm accent for a system that already ships one produces
work that looks right and is wrong, and nobody catches it until integration. The procedure
behind the gate is `references/style-extract.md`: it runs in recon, and its output lands in the
charter's anchors with source and date, so produce inherits read values rather than remembered
ones.

**Load the taste anchors before generating anything.** `Brand-Style-Guide.md` for the rules, `Layout-System.md` for the grid, `Reference-Library.md` for the anchors. The reference library is the one that decides whether the result feels made or feels generated. Real screenshots of work that is actually good give the build something specific to reach for. A prose description of taste produces a prose-description-shaped design, which is exactly the flat, competent, nobody-hates-it result we are trying to avoid.

Anchors arrive through `Reference-Library.md` and nowhere else. Pinterest boards feed that file at stage 1; they are never read directly here. An anchor showing up mid-build is a new opinion showing up mid-build.

**An anchor may carry a prompt block**, real structure read from the real thing: grid values,
spacing rhythm, motion timing, asset paths. When one is present, produce consumes it as a build
spec in miniature and the build log says so. A screenshot tells produce what good looks like; a
prompt block tells it how the thing was built, which is the difference between reaching for a
mood and reaching for a mechanism. Schema and the inspection-only rule in
`references/anchor-prompts.md`.

Same rule inside Figma: clone existing artwork, inherit real components, never start from an empty frame.

**Copy runs on two levels.** `ux-copy` handles microcopy: buttons, empty states, errors, confirmations, the words that are part of the interface. `copy-editor` handles prose: headlines, body, anything read rather than operated. Microcopy first, prose after.

**Render engines, only when the surface actually needs one.** CSS and the DOM cover most work. When they do not:

- **`threejs-*`** for true WebGL scenes. Ten skills: pull `threejs-fundamentals` and then only what the scene needs, `-loaders` for GLTF, `-shaders` for custom effects, `-postprocessing` for bloom and grading.
- **`gsap-*`** for timeline and scroll-linked motion on DOM and SVG. Eight skills: `gsap-scrolltrigger` for a pinned section, `gsap-timeline` for choreography, `gsap-react` inside React.

Motion gets graded like anything else: `review-animations` holds the craft bar at evaluate and `find-animation-opportunities` catches what should have moved and did not. Pull the specific sub-skill, not the whole set, and carry the intent `motion-design` and `apple-design` set at stage 1 into whichever engine executes it. These are conditional sub-skills, not stages. A landing page that needs none of them invokes none of them. Project taste rules from the maxq pack apply throughout and are not liftoff's to override.

### 4. Evaluate

Hand to **`liftoff-evaluator`** with the charter path and the artifact directory, and nothing else. Fresh eyes, renders it, never self-grades. It holds every verdict this stage requires and merges them into one block; the emotional one comes from `resonance audit`:

```
Emotional verdict: PASS | FAIL
- Peak moment produces the target feeling
- No whiplash between adjacent moments
- No anti-feelings produced
- No mechanic on the ethics refuse list
```

**Blindness has to hold on the filesystem, not only in the prompt.** The grader gets the
charter and the artifact directory. It does not get the build log, the note about what the
builder already knew was weak, the losing directions, or the previous round's verdict, and it
does not go and fetch them either: no listing the parent directory, no globbing for notes, no
`git log` or `git diff`. That is the whole reason the build log lives one level up. A grader
told to be impartial and handed a folder containing the builder's reasoning will read the
reasoning, and knowing why a choice was made is exactly the knowledge that makes a grader agree
with it.

If reasoning arrives anyway, refuse the round and say what arrived. Do not grade around it and
mention the contamination afterwards. A contaminated verdict that reports PASS is worse than no
verdict, because it gets believed.

**`accessibility-review` runs as a standing sub-check on anything product track.** WCAG 2.1 AA: contrast, keyboard path, target size, screen reader behavior. Not a stage, not optional, not a thing we discover at handoff.

**Render the artifact and look at it.** A structural check is not an evaluation. Fills, counts, and hierarchy can all be correct while the output is visibly broken, because the common failures are silent defaults rather than thrown errors (see the production rules in `stack.md`). If the screenshot pipeline is unavailable, say the visual check did not run rather than passing on structure alone.

**Grade in parallel, report once.** Every grader reads the same finished artifact and none
depends on another, so craft, emotional audit, accessibility, slop sweep, motion craft and
motion-gap all run concurrently. Merge them into one verdict block before showing anyone
anything. Six reports is not a result, it is homework. Failures first, each with a one-line
reason and the exact file or node.

**Run the slop check without being asked.** Sweep the output against impeccable's absolute
bans every time: side-stripe borders, gradient text, glassmorphism by default, identical card
grids, numbered section markers used as scaffolding rather than sequence, hero-metric templates.
This is automatic at evaluate, not a thing the user has to request, because the pattern that
produces slop is reflex and reflex does not announce itself.

**Prose gets the same sweep.** Any human-facing copy the run produced is graded against
`references/prose-tells.md`, the writing counterpart to the visual bans: inflated claims, sales
register, ghost sources, stock AI words, chatbot residue. Distilled from blader/humanizer and
Wikipedia's signs-of-AI-writing page, with their own caveat kept: these are signs in clusters,
never convictions from a single hit, and the false-positive list binds the grader too. A build
can pass every visual ban and still read like a press release; that is now a FAIL with a named
row instead of a shrug.

**If the artifact cannot be rendered, the human is the evaluator.** Export it, hand it over,
and say plainly that the visual check did not run. Do not pass on structure alone and do not
quietly drop the requirement. A clean audit on a broken render is worse than no audit, because
it manufactures confidence.

That verdict is **UNVERIFIED**, which is a third state and not a soft FAIL. Do not spend a build
round on it. Fix the render path and grade the same artifact again. Sending a builder off to
change things nobody has managed to look at is how a render bug turns into a redesign.

**`design-critique` is the optional second opinion.** Pull it when the verdict is close, when the surface carries real weight, or when the evaluator passed something that still feels off. Two graders disagreeing is useful information.

**Lead every failing check with a negative imperative.** "Stop burying the CTA below the fold"
beats "the call-to-action placement could be improved." Same information, but one is a thing to
go do and the other is a paragraph to interpret. It also matches how the emotional verdict already
works: blunt, PASS or FAIL, no hedge. Explain after the imperative, never instead of it.

All required verdicts must pass. A build that renders correctly and misses the feeling is a FAIL, and saying so is the entire point of running this instead of impeccable alone.

### 5. Iterate

**File the decision.** Whatever direction won, and whatever got killed, goes into
`memory/decisions/` with the reasoning while it is still in the room. The losing option is the
part people skip and the part worth most later; a record that holds only winners cannot stop
anyone re-litigating in six weeks. Full schema in `references/memory.md`.

**Propose promotions, never make them.** When a verdict repeats something already in the log,
say so and offer to promote it to `memory/lessons.md`. The bar is three occurrences, or one
expensive one. Liftoff counts; a human decides whether it is true. Memory that writes itself is
how a confident mistake becomes a permanent one.

**Revise, do not rebuild.** A failing round carries the prior artifact forward together with the
failure list **verbatim**. Paraphrasing a failure is how a fix drifts into a redesign, and a
fresh build against the same charter will faithfully reproduce whatever the charter did not say
the first time.

**Work the failures in the order given**, which is by damage and not by ease. A round that
clears three cheap items and reports progress has handed back the same flat peak with tidier
edges. Fix the peak moment first; a flat peak outranks five flat edges.

**Three rounds, then stop and bring it to a person.** Not a budget nicety. A grader that did not
see the last round cannot be told what the last grader wanted, which is deliberate, and which
also means a fourth round is usually the loop arguing with itself rather than the work getting
better. At three, report what passed, what still fails, and whether the target or the surface is
the actual problem. That last one is a judgment call, and judgment is the input this runs on
rather than something it produces.

Stop at PASS on all required verdicts, and report honestly: what was verified, what was skipped, what still fails.

### 6. Hand off, only when asked

**`design-handoff`** runs when the ask is explicitly "this is ready for engineering." It produces the spec: layout, tokens, component props, interaction states, breakpoints, edge cases, motion detail. It never runs by default. A handoff spec written for work still in exploration is a document nobody opens twice.

## Deploying agents

Fan out reads. Serialize writes. That one rule decides the shape of every wave: recon is five
parallel reads, produce is one writer per artifact, evaluate is six parallel graders merged into
a single verdict.

**Three named agents carry the waves**, and they ship in this skill at `agents/`, installed to
`~/.claude/agents/`. `liftoff-runner` executes explore and produce. `liftoff-persona` is one
competitor in a tournament and is useful for nothing else. `liftoff-evaluator` holds stage 4 and
receives the charter and the artifact and nothing else. The skill keeps what cannot be delegated:
the classification, the charter, the score, both stops, and the call on whether to spend another
round.

Autonomy is a slider per stage, not a global setting, and it moves with earned trust. Start at
recon 3, produce 1, grade 2, iterate 1. A stage goes up a level after three clean runs and drops
back the moment it produces something you had to undo.

The constraint is never generation speed, it is how fast a person can verify. If a wave returns
more than a screen of output to check, the wave is too big. Split it and run twice. Full detail,
concurrency caps and the run-summary format in `references/agents.md`.

**When the agents are not installed.** No `liftoff-evaluator` sends the verdict to
`maxq:evaluator` instead: a different context is not a purpose-built grader, but it is still not
the context that built the thing. With neither available the checks run inline, labelled SELF and
unreliable, and the run summary names which grader held the verdict. No `liftoff-runner`
means stages 2 and 3 run inline from `references/stack.md`, which keeps the full procedure rather
than a summary for exactly this case. No `liftoff-persona` and no `design-deathmatch` means one
exploration and a run that says a tournament did not happen. A missing agent degrades the pass; it
never breaks it, and it never quietly changes what a PASS means.

## Cost routing

Three tiers. The orchestrator plans and delegates on a strong model, workers run on the cheapest tier that passes verification, and the **advisor holds the verdict on a separate instance that did not plan the build.** An orchestrator grading its own plan is self-grading one level up. Orchestrate the loop on the strong model. Fan deathmatch personas and independent exploration out to Sonnet. Send read-only reconnaissance, like reading existing components or tokens, to Haiku. Keep evaluation and the gated PASS decision on the strong model, because those are exactly the judgment calls that get worse when they get cheaper.

## When to skip stages

Skip resonance for genuinely mechanical work: a contrast fix, a breakpoint, a typo in an error message. Running a full emotional map on a padding adjustment wastes the user's time and teaches them to stop invoking this.

Skip liftoff entirely for brand-track work the three visual identity files already answer. Apply, verify tokens, ship. Reaching for the full loop there is ceremony, not craft.

Skip impeccable and the evaluator when the output is a decision or a document rather than an interface. Naming the emotional target for a pitch, a client conversation, or a positioning doc is a legitimate standalone use of resonance.

Skip the evaluator only for throwaway work, and say that you did.

## Honesty

Never claim a stage passed without running it. Show failing checks with their output, name skipped steps, and say plainly when something is verified. The loop only means anything if PASS is expensive to say.
