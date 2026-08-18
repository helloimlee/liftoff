# The stack

Liftoff does not hardcode which skills exist. It reads this file and chains whatever is registered. Adding to the pass is a one-line edit here, not a rewrite of the orchestrator.

Read this at the start of every run. Skip any stage marked `off` or pointing at something not installed, and name what you skipped rather than failing silently. A missing component degrades the pass; it never breaks it.

## Registry

| # | Stage | Component | Kind | Status | Runs when |
|---|---|---|---|---|---|
| 0 | Context | maxq pack | CLAUDE.md | ambient | Loads every session. Never invoked. |
| 0b | Classify | inline, no skill | inline | on | First move of every run. Track, then inputs. |
| 0d | Recon | `AGENTS.md` / `CLAUDE.md` read | inline | on | Wave A. Project conventions, whichever file exists. |
| 0e | Recon | `watch` | skill | conditional | Wave A. A video is attached or referenced. |
| 0f | Recon | `memory/lessons.md` | inline | on | Wave A. What past runs learned. Cheapest high-value read there is. |
| 5b | Record | `memory/decisions/` | inline | on | Stage 5. File the call and the direction that lost. |
| 1 | Target | `resonance map` | skill | on | Unless PRODUCT.md has a current emotional target |
| 1a | Idea | idea pass (`references/idea-pass.md`) | inline | on | Every non-mechanical ask. Verbal gate before anything is drawn. |
| 1b | Input | `research-synthesis` | skill | conditional | A research corpus is attached |
| 1c | Input | `user-research` | skill | conditional | The decision needs research that does not exist yet |
| 1d | Target | `motion-design` | skill | conditional | The surface has motion. Sets timing/easing intent before any engine runs. |
| 1f | Target | `apple-design` | skill | conditional | Gesture-driven or physical motion: drag, swipe, sheets, momentum, interruptible transitions. |
| 1e | Input | Pinterest via Zapier | connector | conditional | A curated board exists and the library has no anchors from it. See `inspiration.md`. |
| 2 | Explore | `maxq:designer` | agent | conditional | Direction unknown. The default explorer. |
| 2b | Explore | `design-deathmatch` | skill | conditional | Direction unknown AND stakes justify a tournament |
| 2c | Context | `design-system` | skill | conditional | A Figma file or existing component library is in play |
| 3 | Build | `impeccable` | skill | on | Output is an interface |
| 3b | Voice | `ux-copy` | skill | conditional | The surface has real microcopy: buttons, empty states, errors |
| 3c | Voice | `copy-editor` | skill | on | Any stage producing prose |
| 3d | Render | `threejs-*` (10 skills) | skill | conditional | True WebGL 3D is in the ask |
| 3e | Render | `gsap-*` (8 skills) | skill | conditional | Timeline or scroll-triggered motion on DOM/SVG |
| 4 | Evaluate | `maxq:evaluator` | agent | on | Always. Fresh eyes, renders it, never self-grades. |
| 4b | Evaluate | `resonance audit` | skill | on | Always, alongside the evaluator |
| 4c | Evaluate | `accessibility-review` | skill | on | Always on product track. WCAG 2.1 AA. |
| 4d | Evaluate | `design-critique` | skill | conditional | Close verdict, high-stakes surface, or a pass that still feels off |
| 4e | Evaluate | `review-animations` | skill | conditional | The surface has motion. Craft gate: approval is earned. |
| 4f | Evaluate | `find-animation-opportunities` | skill | conditional | Motion-gap pass. Finds what should animate and rejects what should not. |
| 5 | Handoff | `design-handoff` | skill | conditional | The ask is explicitly "ready for engineering" |
| 0c | Audit | `improve-animations` | skill | conditional | Entry point for an existing codebase: prioritized motion audit, read-only. |

## Stage 0: the maxq pack

Matt's CLAUDE.md bundle. Not a skill, never invoked, loads itself. Two scopes:

- **Global** (`~/.claude/CLAUDE.md`) is the person: operating posture, taste defaults, cost routing, honesty rules.
- **Project** (`<repo>/CLAUDE.md`) is the repo: hard rules, stack, dev commands, architecture gotchas.

**Both load on every turn, so both are a recurring token cost.** Keep each near 25 lines. This is why the emotional target lives in PRODUCT.md or the project file and never the global one: nobody should pay for Kelvos's peak moment while debugging an unrelated migration.

What the pack already establishes, which liftoff inherits rather than reinvents:

- **Posture.** Act as a project brain. Execute, don't advise. Recommend, don't survey.
- **The loop.** Multi-step deliverables run charter → produce → evaluate → iterate to PASS, with the charter written from `loops/charter-template.md`. Liftoff is a specialized charter for design work, not a parallel system.
- **Taste.** Semantic HTML and hand-authored vanilla CSS for product code. No Tailwind, no build step. Throwaway `maxq:designer` mockups are the exception and may use Tailwind via CDN.
- **Cost routing.** Orchestrate on the strong model, fan workers to Sonnet, send cheap read-only exploration to Haiku, keep reviews and gated decisions on the strong model.
- **Honesty.** Report faithfully. Never claim done without verifying.

Matt's open proposal, from #readysend on 2026-07-21 and still unbuilt: extend the pack with a **project-CLAUDE.md template** for new work, holding MaxQ philosophy, basic design rules, and technical rabbit-hole preventers. Liftoff is the runtime for that template. Build them together or they drift.

## Stage 0b: classify before you charter

The front door. Two questions, answered out loud in one line, before any work starts.

**Question 1: product or brand.** Product track means the output is an interface someone operates, and the full loop runs. Brand track means the output is a static asset, and it usually should not be here at all: if `Brand-Style-Guide.md`, `Reference-Library.md`, and `Layout-System.md` answer the question, apply them, run the token verification, and stop. That is the fast lane. Only assets that need real exploration come back to liftoff, in document mode, which keeps the target and the resonance audit and drops `impeccable` and `maxq:evaluator`.

**Question 2: what is on the table.** The attachments decide the conditional rows in the registry.

| What is attached | What it pulls in | When |
|---|---|---|
| Figma file, component library | `design-system` | Before produce, as context |
| Transcripts, tickets, survey data | `research-synthesis` | Before the charter, feeding the target |
| A decision with no research behind it | `user-research` | Before the charter |
| An existing live site or app | `accessibility-review` | Before touching anything, as a baseline |
| Real UI microcopy in scope | `ux-copy` | Inside produce |
| Motion anywhere in the ask | `motion-design` | With the target, before any engine |
| 3D or scroll-linked motion | `threejs-*` / `gsap-*` | Inside produce |
| A curated Pinterest board on the topic | Pinterest via Zapier, `_zap_raw_request` | Before the charter. See `inspiration.md`. |
| A video: motion ref, screen recording, competitor flow, talk | `watch --detail transcript` | Wave A. Escalate to `balanced` only when motion is the subject. |
| An `AGENTS.md` or `CLAUDE.md` in the repo | read it first | Wave A. Project conventions outrank inferred ones. |

Getting this wrong is cheap to fix at minute one and expensive to fix at hour three. Say the classification, let it get corrected, then charter.

## Stage 1d: motion-design is a target, not an engine

Worth correcting on the record, because the original proposal had this wrong. `motion-design` (LottieFiles) was pitched as a Lottie export pipeline, a third render engine beside three.js and GSAP. It is not. Its actual frontmatter describes timing, easing, choreography, and Disney animation principles adapted for UI, explicitly implementation-agnostic and working across CSS, Framer Motion, GSAP, Lottie, or Spring.

That makes it resonance for motion: it decides what the movement should feel like, before any engine renders it. So it sits at stage 1 with the target, not at stage 3 with the pipelines. Run it when the surface has motion and the question is what kind, then hand its intent to `gsap-*` or `threejs-animation` to execute.

The overlap question it has to survive: resonance already sets emotional targets. Resonance works at product and flow level, three feelings and a peak moment. `motion-design` works at the level of a single transition's easing curve. Different grain, same discipline. If it starts producing generic "make it feel premium" output instead of specific timing calls, it has failed its slot and comes out.

## Stage 2: which explorer

**`maxq:designer`** is the default. One exploration, fast, good for a screen, a landing page, or a direction check.

**`design-deathmatch`** is the heavy option: four personas build and evolve competing designs, a jury critiques the field, a synthesis pass steals the best verified moves into a fifth iteration, and the PLAYBOOK improves each run. Expensive in time and tokens, so it earns its slot rather than getting it by default.

Run the deathmatch when the direction could genuinely go several ways, when a competent design is stuck in the "fine but boring" diagnosis, when the surface carries real weight like a peak moment or a pitch, or when two people have been arguing about direction past the point of usefulness.

Skip it when the direction is settled, the change is small, or an existing design system already answers the question.

### Why the target comes first

A deathmatch with no stated emotional target is four personas competing on taste and a jury grading vibes. With the target loaded, every persona solves a named problem and the jury gets a real criterion: which of these makes the user feel the three things?

Pass the three feelings and the peak moment into the brief explicitly. Judge the winner against the target before accepting it, because a design can win a tournament on craft and still miss the feeling. Keep the tournament paper trail next to the winner; the losing directions explain the winner better than the winner does.

## Stage 3: taste anchors and render engines

**Anchors load before generation, every time.** `Brand-Style-Guide.md` is the rules, `Layout-System.md` is the grid, `Reference-Library.md` is the taste. The reference library is doing the heaviest lifting of the three. Real screenshots of genuinely good work give the build a specific target; a prose description of taste yields a prose-description-shaped design, which is the generated-looking result we are trying to design our way out of. Inside Figma the same rule holds: clone existing artwork, inherit real components, never open a blank frame.

**Render engines are conditional, never permanent.** Each covers a rendering pipeline nothing else in the stack touches, which is the only reason they earn a row. Invoke only what the ask calls for. Most surfaces call for none of them.

- **`threejs-*`**, 10 skills: `-fundamentals`, `-geometry`, `-materials`, `-textures`, `-lighting`, `-shaders`, `-animation`, `-loaders`, `-interaction`, `-postprocessing`. True WebGL scenes. Nothing else in the stack builds one; the MaxQ 3D header got written freehand for exactly this reason.
- **`gsap-*`**, 8 skills: `-core`, `-timeline`, `-scrolltrigger`, `-plugins`, `-react`, `-frameworks`, `-utils`, `-performance`. Timeline and scroll-linked motion on DOM and SVG. Impeccable critiques motion; it has no engine behind it. Note `gsap-plugins` now covers SplitText and MorphSVG, free for commercial use since Webflow acquired GSAP.

Pull the specific sub-skill, not the set. `gsap-scrolltrigger` for a pinned section, not all eight.

## Production rules, learned the hard way

Silent defaults that ruin output without throwing an error. Each one cost a real build.

**Figma: `figma.createAutoLayout()` ships with a solid white fill.** Every layout-only container you create is opaque white until told otherwise, so a dark board renders as white bands over the artwork with no error and no warning. Any frame that exists purely to arrange children must get `fills = []` explicitly. Audit before declaring done:

```js
figma.currentPage.query('FRAME').toArray()
  .filter(n => n.fills?.[0]?.type === 'SOLID'
            && n.fills[0].color.r === 1 && n.fills[0].color.g === 1 && n.fills[0].color.b === 1)
  .map(n => ({ id: n.id, name: n.name }));
```

**Figma: per-side stroke weights, one stroke color.** `strokeLeftWeight` gives an accent border its thickness but not its color. To get a colored edge on one side, set `strokes` to the accent and zero the other three weights.

**Canvas: `fillStyle` silently fails on `color-mix()` and `oklch()`.** In some environments the assignment is ignored, no throw, and the shape draws in the previous fill. Hardcode `rgba()` strings in all canvas drawing code.

The pattern across all three: the failure is invisible at write time and only shows up in the render. Which is the argument for stage 4 existing at all, and for the evaluator being a different set of eyes than the builder.

## Stage 4: never self-grade

The pack's evaluator rule is not decoration. A session that produced the work will find what it expects to find when it grades the work.

So the emotional audit runs through `maxq:evaluator` with the target attached, or in a fresh session. If neither is possible, run it anyway and flag the verdict as SELF and unreliable. The evaluator's normal verdict, the emotional verdict, and the accessibility check must all pass on product track. A build that renders correctly and misses the feeling is a FAIL.

`design-critique` is the tiebreaker, not a fourth mandatory gate. Two graders disagreeing tells you more than one grader agreeing with itself.

## Wave structure

Which rows can run at the same time, which cannot, and why.

| Wave | Rows | Concurrency | Model | Default autonomy |
|---|---|---|---|---|
| A recon | 0b classify, 0d AGENTS.md, 0e watch, 1b/1c research, 2c design-system, 1e inspiration, 4c baseline | all at once | cheap | 3, interrupt only on failure |
| B make | 3 impeccable, 3b ux-copy, 3c copy-editor, 3d/3e render | one writer per artifact | mid, strong orchestrates | 1, surface every result |
| B' explore | 2 designer, 2b deathmatch | cap 4 | mid | 2 |
| C grade | 4 evaluator, 4b resonance, 4c a11y, 4d critique, 4e review-animations, 4f motion-gap | all at once | strong for verdicts | 2, merged output |

Reads parallelise safely. Writes do not, and two agents touching one artifact fail later and
inexplicably rather than immediately. Explore is the one place many agents produce concurrently,
and it is safe because each produces a separate artifact.

Never route a verdict to a cheaper model. A cheaper grader agrees more, and a grader that agrees
is not a grader.

## Ordering rules

Classification runs **before** everything. Track and attachments decide which of these rows are even live this run.

Brand and voice constraints load **before** the target, because the target must be expressible in the studio's voice to be usable.

The target loads **before** exploration and build. Impeccable reads PRODUCT.md during setup and picks it up automatically, and the deathmatch jury needs it to judge anything but taste. Highest-leverage ordering decision in the stack.

Design system checks run **during** the build. Catching a token violation after the interface is finished means rework; catching it during means a different variable name.

Evaluation runs **after** the build, against the target from stage 1, with fresh eyes. An audit with no stated target is an opinion. An audit by the author is a formality.

Handoff runs **last, and only on request.** It documents a decision, so it needs a decision to document.

## What we deliberately did not add

### Agentic Design Wiki (evaluated 18 August)

**Taken: the memory architecture.** Liftoff's longest-standing gap was that it had no memory
between runs. That repo's whole thesis is a compounding markdown knowledge base in git, and it
answers the gap directly. Three things came across: filed decisions including the option that
lost, a lessons file with a real promotion criterion, and an append-only log. Plus the ownership
contract, which matters more than the folder shape: sources are immutable, the loop owns only
`memory/`, and the schema is human-written. An agent that can rewrite its own inputs will
eventually launder a guess into a fact. See `references/memory.md`.

The sharpest borrowed idea is the promotion bar. A note earns permanence when it has cost you
something three times, or once expensively. Everything below that stays forgettable, and most
observations should be forgotten. Without that filter a lessons file is a junk drawer inside a
month.

**Left: the vendored content, and this is the interesting rejection.** That repo ships copies of
Material Design's tokens and the Microsoft Style Guide as markdown for agents to read. For
liftoff that is precisely the anti-pattern the produce-stage hard gate exists to prevent. A
vendored third-party system is a second source of truth that drifts, and on the day it disagrees
with the project's real CSS the local copy wins by being closer to hand. Read the live
stylesheet. Also skipped its `generate-*` recipes, which are impeccable's ground, and its voice
and pattern pages, which are what `Brand-Style-Guide.md` and `Reference-Library.md` already hold.

Its own README makes the case for taking the shape and not the contents: *the schema is the
product, not the contents.*



### Video input (evaluated 17 August)

**Added: `watch`** (`bradautomates/claude-video`, skill name `watch`, v0.2.0, at
`skills/watch/SKILL.md`). Liftoff could read stylesheets, DOM, images and research text, and
could not read video at all. That gap became acute the moment the registry gained
`motion-design`, `apple-design`, `review-animations` and `find-animation-opportunities`: the
loop can now grade motion but had no way to take a motion reference in. A still screenshot
cannot anchor how something moves.

Runs in Wave A at `--detail transcript`, which is free, pulls native captions and skips the
video download entirely. Escalate to `--detail balanced` (scene-aware frames, cap 100) only
when motion itself is the subject, because frames are where the token cost lives. A Whisper key
is needed only for videos with no captions; Groq is cheaper, OpenAI is the fallback. Requires
`yt-dlp` and `ffmpeg`.

**Skipped: `watch-video`** (`Newuxtreme/watch-video-skill`). Its notes-file output is genuinely
nice, but its own description reads **"SLASH-COMMAND-ONLY. Invoke ONLY when the user explicitly
types the literal `/watch-video` slash command. Never auto-trigger,"** and it calls itself a
heavyweight pipeline. Liftoff needs video reading it can invoke itself during recon; a skill
gated behind a manual command cannot be orchestrated. Its `SKILL.md` also sits at the repo root
rather than under `skills/`, which breaks the standard install path. And the notes file
duplicates what `Reference-Library.md` already does.

**On "learn any skillset from video," honestly.** Watching a video and becoming good at the
thing are different problems. `watch` gives you a transcript and frames, which is ingestion, not
acquisition. The narrower version is real and worth doing: **motion reference extraction**, where
a video yields timing, easing and choreography observations in a form `motion-design` can set
intent from and `gsap-*` can execute against. That is bounded enough to actually work. A general
"absorb any expertise from video" claim is not, and putting it in the registry would be
positioning language, which is the exact thing that got Genjutsu rejected.

### AGENTS.md (evaluated 17 August)

Adopted as a **read target, not a dependency.** `AGENTS.md` is the cross-agent convention file
and it is where a project declares its own rules. Liftoff reading only `CLAUDE.md` made it
Claude-parochial, which is a bad trait for a skill that now installs into Codex, Cursor and
anything else supporting the format. Wave A reads whichever exists, and project conventions
outrank anything liftoff would otherwise infer.

This repo also now ships its own `AGENTS.md` so a contributor's agent knows the conventions
without being told.



### From `emilkowalski/skills` (REQ-121, re-run 17 August)

The repo held 7 skills when REQ-121 was filed and holds 10 now, so the original four-add
three-skip split was re-derived against the current contents. Four still earn rows.

**Added:** `review-animations` (motion craft gate, and "default to flagging, approval is
earned" is this loop's own ethos applied to motion), `find-animation-opportunities` (read-only
motion-gap analysis, and the half that rejects what should *not* animate is the valuable half),
`improve-animations` (codebase-scale motion audit, a legitimate entry point rather than a
stage), `apple-design` (gesture, momentum and interruptible transitions, the one area no
existing row covers and directly relevant to touch work).

**Skipped, with reasons:**

- `emil-design-eng` is a philosophy of UI polish. That is impeccable's exact ground, and it
  fails the same test Genjutsu failed: a point of view rather than a mechanism impeccable lacks.
- `prototype` builds several genuinely different versions behind a picker. That is
  design-deathmatch's job, already registered. **Caveat worth knowing:** design-deathmatch is
  not installed in every environment. Where it is missing, `prototype` is the lighter
  substitute and should take the row instead. Do not run both.
- `animate` sits between two rows we already have. `motion-design` sets the intent and the
  `gsap-*` skills execute it. Its decision-order framing is good; it is not a third thing.
- `animation-vocabulary` is genuinely unduplicated but it is a lookup, not a loop step.
  Install it if you like the glossary; it does not get a registry row.
- `ask-sonner` is a toast-library guide. Out of scope.
- `pick-ui-library` is library selection, not design judgment, and ships
  `disable-model-invocation: true` so it never auto-triggers anyway.

Install: `npx skills add emilkowalski/skills` pulls all ten into `.claude/skills/`. There is no
per-skill flag on that command, so either accept all ten and rely on the registry to decide what
runs, or copy the four wanted folders out by hand. Three of them
(`review-animations`, `prototype`, `pick-ui-library`) ship `disable-model-invocation: true` and
only run when named.



Two candidates were evaluated and rejected, recorded here so nobody re-proposes them in six weeks.

**Design DNA** (`zanwei/design-dna`) extracts color systems, typography, and layout insight from references. That is what `Brand-Style-Guide.md` plus `Reference-Library.md` already do, and what impeccable is already instructed to read. Installing it stands up a second, competing style-extraction system next to the one we built on purpose.

**Genjutsu** (`AThevon/genjutsu`) describes premium interface design, creative direction, and final polish. That is positioning language, not a distinct mechanism, and it is the same ground impeccable and resonance already hold, with a looser checklist than impeccable's own.

The rule these two failed: a new component earns a row by covering a pipeline or a judgment nothing else covers. Overlap is the thing this stack is supposed to prevent, not accumulate.

## Registering something new

1. Confirm the exact `name` from the `name:` field of its SKILL.md, or the agent's namespaced handle. Directory name and frontmatter name can differ; frontmatter wins.
2. Add its row. Set status `on`, `conditional`, or `off`.
3. Place it by function: anything that constrains the work runs before the work, anything that evaluates it runs after.
4. Say what it covers that nothing already in the registry covers. If you cannot, it does not get a row.

## Install path

MaxQ ships skills as `.skill` files, which are zips of the skill folder. Unzip into `~/.claude/skills/` so the result is `~/.claude/skills/<name>/`, then start a fresh session. Proven with design-deathmatch.

The render engines are different and the difference bites. **None of the three repos ships a top-level SKILL.md.** Each is a collection at `<repo>/skills/<name>/SKILL.md`, 19 skills across the three. Cloning a repo into `~/.claude/skills/threejs/` yields `~/.claude/skills/threejs/skills/threejs-fundamentals/SKILL.md`, which is never discovered, and the failure is silent. Two further traps: the three.js README's own clone command points at an unrelated repo (`pinkforest/threejs-playground`), and folder names can differ from frontmatter names, where frontmatter always wins.

So use the script:

```bash
./scripts/install-render-engines.sh --dry-run   # see what lands where
./scripts/install-render-engines.sh
```

It clones each repo, reads every SKILL.md's frontmatter `name:`, installs each skill flat into `~/.claude/skills/<frontmatter-name>/`, and prints the final list to reconcile against the registry above. Override the destination with `CLAUDE_SKILLS_DIR`.

The vendor-supported alternative, if you would rather not run a script: `npx skills add https://github.com/greensock/gsap-skills` and `npx skills add LottieFiles/motion-design-skill` both work and auto-detect the agent. GSAP also publishes a Claude Code plugin marketplace entry: `/plugin marketplace add greensock/gsap-skills`. Three.js offers neither, so it needs the script or a manual copy of its `skills/` folder.

Verified names as of 2026-07-27, 19 total:

```
threejs-fundamentals  threejs-geometry     threejs-materials   threejs-textures
threejs-lighting      threejs-shaders      threejs-animation   threejs-loaders
threejs-interaction   threejs-postprocessing
gsap-core             gsap-timeline        gsap-scrolltrigger  gsap-plugins
gsap-react            gsap-frameworks      gsap-utils          gsap-performance
motion-design
```

## Open wiring

The pointer runs one direction. Liftoff's description tells the model to prefer it over resonance or impeccable alone, but the seven `design:` plugin skills say nothing back, so a large ask that mentions accessibility lands in `accessibility-review` and stays there.

Drafted, not yet applied: `references/escalation-edits.md` holds a one-sentence addition for each of the seven descriptions. They have to go in the `description:` frontmatter rather than the body, because routing reads descriptions at selection time and the body only after the skill is already chosen.
