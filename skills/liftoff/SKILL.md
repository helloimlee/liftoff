---
name: liftoff
description: The MaxQ full design pass. Use when someone wants a feature, flow, page, or product designed end to end and wants the emotional target, the exploration, the build, and the verification handled as one run rather than assembled by hand. Trigger on "design this properly," "full pass," "the whole treatment," "make this great," "liftoff," or any substantial design request that deserves more than a single skill. Classifies the ask first (product or brand, what is attached, what reference exists), then runs a charter loop: set the target, explore if the direction is unknown, build, then evaluate with fresh eyes and iterate to PASS. Use this instead of calling resonance, impeccable, design-critique, accessibility-review, ux-copy, or design-system alone when the work is substantial.
version: 0.8.0
user-invocable: true
argument-hint: "[target]"
---

The full MaxQ design pass, run as a charter loop.

## What this is

Liftoff is not a new orchestrator. It is a **specialized charter** for design work, running the loop already established in the maxq pack: write the charter, produce, evaluate, iterate to PASS. What liftoff adds is the emotional target as a first-class gate, so "done" means something more specific than "it renders," and a classify pass up front, so the right sub-skills come along without anyone assembling them by hand.

Read `references/stack.md` first. It is the registry of which skills and agents are in the pass and when each runs. Skip anything marked `off` or not installed, and name what you skipped. A missing skill degrades the pass; it never breaks it.

## The loop

### 1. Charter

**Fan the recon out first.** Everything classify needs is a read, and reads are independent:
the live stylesheet, the existing component library, an accessibility baseline, any research
corpus, the taste anchors. Run them concurrently on a cheap model in one round trip. Nothing is
written, so nothing needs approving. Detail in `references/agents.md`.

**Read the room before you write anything.** Classify the ask on two axes, out loud, in one line. If the classification is wrong the user corrects it here, for free.

**Track.** Product or brand.

- **Product track.** The output is an interface someone uses. Run the full loop below.
- **Brand track.** The output is a static asset: a lockup, a slide, a one-pager, a social post. If the three visual identity files (`Brand-Style-Guide.md`, `Reference-Library.md`, `Layout-System.md`) already answer the question, apply them, run the token verification, and stop. That is the fast lane and it does not need liftoff. Only when the asset needs real exploration does it come back here, in document mode: keep the target and the resonance audit, skip `impeccable` and `maxq:evaluator`.

**Inputs on the table.** Whatever is attached decides which sub-skills ride along.

- A Figma file or an existing component library: pull `design-system` for context before producing, so the build inherits real components instead of quietly growing a parallel set.
- A research corpus (transcripts, tickets, survey results, call notes): run `research-synthesis` before the charter and feed its themes into the emotional target. A target derived beats a target guessed. If the research does not exist yet and the decision needs it, `user-research` plans it.
- An existing live site or app: run `accessibility-review` as a baseline before touching anything, so you can tell what you inherited from what you broke.
- Real UI copy in scope: `ux-copy` runs inside produce.
- Motion anywhere in the ask: `motion-design` runs with the target, deciding what the movement should feel like before any engine gets involved.
- A curated Pinterest board on the subject: sync it into `Reference-Library.md` now, not later. See `references/inspiration.md`.

Then write `charter.md` from `loops/charter-template.md`. Fill the normal fields, then add the emotional target as a required section. If PRODUCT.md already has a current `## Emotional target` block, copy it in. If not, run `resonance map` and write the result into both PRODUCT.md and the charter.

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

Skip this stage when the direction is settled and this is execution. Otherwise pick one:

- **`maxq:designer`** for a single exploration of a screen, landing page, or direction. The default.
- **`design-deathmatch`** when the stakes justify a tournament: the direction could go several ways, the current design is competent but stuck, the surface is a peak moment or a pitch, or two people have been arguing about direction past the point of usefulness.

Either way, pass the three feelings and the peak moment into the brief. A deathmatch without a stated target is four personas competing on taste and a jury grading vibes. With the target loaded, the jury has a real question: which of these makes the user feel the three things?

Judge the winner against the target before accepting it. A design can win on craft and still miss the feeling.

### 3. Produce

Hand to **`impeccable`** with the target stated explicitly in the brief, not just left in PRODUCT.md for it to find. Impeccable reads PRODUCT.md during setup, so the target arrives either way, but a named target in the prompt outperforms a filed one.

**Read the live system before inventing a single token.** If the work ships anywhere with an
existing stylesheet, pull the real values from source before choosing a colour, a face, or a
size. Not from memory, not from a brand doc that may have drifted. This is a hard gate because
the failure is invisible: inventing a warm accent for a system that already ships one produces
work that looks right and is wrong, and nobody catches it until integration.

**Load the taste anchors before generating anything.** `Brand-Style-Guide.md` for the rules, `Layout-System.md` for the grid, `Reference-Library.md` for the anchors. The reference library is the one that decides whether the result feels made or feels generated. Real screenshots of work that is actually good give the build something specific to reach for. A prose description of taste produces a prose-description-shaped design, which is exactly the flat, competent, nobody-hates-it result we are trying to avoid.

Anchors arrive through `Reference-Library.md` and nowhere else. Pinterest boards feed that file at stage 1; they are never read directly here. An anchor showing up mid-build is a new opinion showing up mid-build.

Same rule inside Figma: clone existing artwork, inherit real components, never start from an empty frame.

**Copy runs on two levels.** `ux-copy` handles microcopy: buttons, empty states, errors, confirmations, the words that are part of the interface. `copy-editor` handles prose: headlines, body, anything read rather than operated. Microcopy first, prose after.

**Render engines, only when the surface actually needs one.** CSS and the DOM cover most work. When they do not:

- **`threejs-*`** for true WebGL scenes. Ten skills: pull `threejs-fundamentals` and then only what the scene needs, `-loaders` for GLTF, `-shaders` for custom effects, `-postprocessing` for bloom and grading.
- **`gsap-*`** for timeline and scroll-linked motion on DOM and SVG. Eight skills: `gsap-scrolltrigger` for a pinned section, `gsap-timeline` for choreography, `gsap-react` inside React.

Motion gets graded like anything else: `review-animations` holds the craft bar at evaluate and `find-animation-opportunities` catches what should have moved and did not. Pull the specific sub-skill, not the whole set, and carry the intent `motion-design` and `apple-design` set at stage 1 into whichever engine executes it. These are conditional sub-skills, not stages. A landing page that needs none of them invokes none of them. Project taste rules from the maxq pack apply throughout and are not liftoff's to override.

### 4. Evaluate

Hand to **`maxq:evaluator`** with the charter attached. Fresh eyes, renders it, never self-grades. The evaluator returns the normal verdict; liftoff additionally requires the emotional verdict from `resonance audit`:

```
Emotional verdict: PASS | FAIL
- Peak moment produces the target feeling
- No whiplash between adjacent moments
- No anti-feelings produced
- No mechanic on the ethics refuse list
```

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

**If the artifact cannot be rendered, the human is the evaluator.** Export it, hand it over,
and say plainly that the visual check did not run. Do not pass on structure alone and do not
quietly drop the requirement. A clean audit on a broken render is worse than no audit, because
it manufactures confidence.

**`design-critique` is the optional second opinion.** Pull it when the verdict is close, when the surface carries real weight, or when the evaluator passed something that still feels off. Two graders disagreeing is useful information.

All required verdicts must pass. A build that renders correctly and misses the feeling is a FAIL, and saying so is the entire point of running this instead of impeccable alone.

### 5. Iterate

Feed failures back to stage 3 and rerun. Fix the peak moment first; a flat peak outranks five flat edges. Stop at PASS on all required verdicts, and report honestly: what was verified, what was skipped, what still fails.

### 6. Hand off, only when asked

**`design-handoff`** runs when the ask is explicitly "this is ready for engineering." It produces the spec: layout, tokens, component props, interaction states, breakpoints, edge cases, motion detail. It never runs by default. A handoff spec written for work still in exploration is a document nobody opens twice.

## Deploying agents

Fan out reads. Serialize writes. That one rule decides the shape of every wave: recon is five
parallel reads, produce is one writer per artifact, evaluate is six parallel graders merged into
a single verdict.

Autonomy is a slider per stage, not a global setting, and it moves with earned trust. Start at
recon 3, produce 1, grade 2, iterate 1. A stage goes up a level after three clean runs and drops
back the moment it produces something you had to undo.

The constraint is never generation speed, it is how fast a person can verify. If a wave returns
more than a screen of output to check, the wave is too big. Split it and run twice. Full detail,
concurrency caps and the run-summary format in `references/agents.md`.

## Cost routing

Orchestrate the loop on the strong model. Fan deathmatch personas and independent exploration out to Sonnet. Send read-only reconnaissance, like reading existing components or tokens, to Haiku. Keep evaluation and the gated PASS decision on the strong model, because those are exactly the judgment calls that get worse when they get cheaper.

## When to skip stages

Skip resonance for genuinely mechanical work: a contrast fix, a breakpoint, a typo in an error message. Running a full emotional map on a padding adjustment wastes the user's time and teaches them to stop invoking this.

Skip liftoff entirely for brand-track work the three visual identity files already answer. Apply, verify tokens, ship. Reaching for the full loop there is ceremony, not craft.

Skip impeccable and the evaluator when the output is a decision or a document rather than an interface. Naming the emotional target for a pitch, a client conversation, or a positioning doc is a legitimate standalone use of resonance.

Skip the evaluator only for throwaway work, and say that you did.

## Honesty

Never claim a stage passed without running it. Show failing checks with their output, name skipped steps, and say plainly when something is verified. The loop only means anything if PASS is expensive to say.
