# Changelog

All dates 2026. Liftoff is a charter loop for design work, not an orchestrator. It sets an
emotional target, explores when the direction is unknown, builds, grades with fresh eyes,
and loops until it passes.

---

## 0.13.0, 18 August

**Reframed around the thing that does not obsolete.**

- Losing the explore stage to `/design` in a single day was clarifying rather than painful.
  **Generators improve; standards do not obsolete.** A better generator makes the target, the
  idea gate, the verdict and the accumulated lessons *more* useful, because the faster options
  arrive the more the bottleneck moves to knowing which one is right.
- So liftoff no longer pretends to be a generator. It decides what good means before anything is
  made, and whether it landed after. **Bring your own generator.**
- **Exploration routes by surface.** `/design` in Claude Code. Direct writes to the canvas when
  the Figma MCP is connected. `design-deathmatch` when the argument matters more than the
  options. A single exploration when none of those exist. This is also why the loop cannot live
  inside Claude Code: real work happens in Figma too, and the next generator will land somewhere
  else again.
- **New step: score the set.** Every option graded against the target *before* the user looks,
  ranked, one line each on what it does to the peak moment. Six artboards is a menu. Six with a
  target and a score is a decision with the reasoning attached. Deliberately shallow, since
  craft and accessibility are cheap to fix and would drown the signal.
- **Two stops, and only two.** The target and the pick. They are the places where being wrong is
  expensive and correcting is cheap. Stopping more often trains people to skim, and a skimmed
  checkpoint manufactures agreement. These two do not move with the autonomy slider, because
  they are not about whether the loop is reliable. They are about whether it is aimed correctly.
- If the user picks the option ranked third, that is information about the target, not about
  their taste. The target gets revisited; the choice does not get overruled.
- Full sequence in `references/run.md`.

## 0.12.0, 18 August

**Gave the explore stage away.**

- Anthropic shipped `/design` in Claude Code on 17 August. It reads the codebase, derives tokens
  from the existing visual style, returns editable artboards, and lets you accept or reject ideas
  individually.
- **It is a better explorer than this loop ever had, so it is now the explorer.** `/design` takes
  the row. `design-deathmatch` drops to conditional, for the case where the argument matters more
  than the options. `maxq:designer` becomes the fallback. Retiring a stage that lost is cheaper
  than maintaining a worse copy of it.
- **Honest concession:** `/design` also partly overlaps the produce-stage token gate added in
  0.7.0. Deriving tokens from the codebase covers most of what that gate was for on codebase work.
  It stays, because it also covers deployed stylesheets, brand docs and non-code surfaces, but its
  scope is genuinely narrower now.
- **What did not move:** the emotional target, the idea pass, the slop sweep, the memory layer,
  and the verdict. `/design` returns options and a person picks a favourite, which is judgment by
  preference. "Best of the six I was just shown" is a relative judgment with no outside standard.
  A design can win the comparison, match your tokens, and still miss the feeling.
- The clearest statement of the split came from a stranger commenting under the announcement:
  knowing the tool will help, but knowing what to approve, reject and change will matter more.
  That is the remaining case for this loop, and if the judging half goes unused then `/design`
  alone is enough and this is ceremony.

## 0.11.0, 18 August

**Says back what it heard, and stops grading its own homework.**

- Added `references/echo.md` as a mandatory stage 0a. Before touching anything, the loop says
  back what it absorbed and puts every inference it made below a hard line labelled as its own.
  Act on nothing until that comes back answered.
- The framing came from `thinking-out-loud` and it is the sharpest idea borrowed so far:
  **a clarifying question verifies what the model doubts, an echo verifies what the model
  believes.** Asking requires felt uncertainty, and confident misreadings feel like knowledge,
  so the expensive ones never become questions. Every costly failure in this skill's short
  history came from a confident gap-fill, not a missing answer.
- **Fixed a bug the comparison exposed.** Cost routing had the strong model both orchestrating
  the build and holding the PASS decision. That is self-grading one level up from the artifact,
  which this loop bans at the artifact level for exactly the same reason. Now three tiers:
  orchestrator owns the hot path and never grades, workers are the cheapest tier that passes
  verification, and the **advisor holds the verdict on an instance that did not plan the build.**
- Kept the principle that models are knobs and tiers are the durable part.
- Skipped the rest of that repo. It is a 92MB tutorial showcase, and its other six skills are
  engineering-workflow tools or app code rather than design judgment.

## 0.10.0, 18 August

**It remembers now.**

- Added `references/memory.md`. The longest-standing gap in this skill was that every run
  rediscovered what the last one learned, and hard-won rules survived only because somebody
  hand-edited `stack.md`. Closed with a folder: markdown in git, no vector database, no service.
  Architecture borrowed from the Agentic Design Wiki.
- **`memory/lessons.md`** joins Wave A recon, so a run starts already knowing what the last ten
  runs learned. Cheapest high-value read in the set.
- **`memory/decisions/`** is written at stage 5, and it records the option that lost alongside
  the one that won. A record holding only winners cannot stop anyone re-litigating in six weeks.
- **The promotion bar is the whole mechanism:** a note earns permanence when it has cost you
  something three times, or once expensively. Everything under that stays forgettable, and most
  observations should be forgotten. Without that filter a lessons file is a junk drawer inside a
  month.
- **Liftoff counts, a human decides.** It can spot a repeat and draft the lesson; it never
  promotes one alone. Memory that writes itself is how a confident mistake becomes a permanent
  one, and this loop already has enough ways to be wrong quickly.
- **Rejected from the same repo: the vendored design and content systems.** It ships copies of
  Material Design's tokens and the Microsoft Style Guide for agents to read, and that is exactly
  the anti-pattern the produce-stage hard gate exists to prevent. A vendored third-party system
  is a second source of truth that drifts, and on the day it disagrees with the project's real
  CSS the local copy wins by being closer to hand. Its own README makes the case for taking the
  shape and leaving the contents: the schema is the product.

## 0.9.0, 17 August

**Liftoff can watch video, and reads your project's own rules first.**

- Added `watch` (`bradautomates/claude-video`) to Wave A recon, conditional. The loop could read
  stylesheets, DOM, images and research text and could not read video at all. That became a real
  hole once 0.6.0 added the motion skills: liftoff could grade motion but had no way to take a
  motion reference in, and a still screenshot cannot anchor how something moves.
- Defaults to `--detail transcript`, which pulls native captions, skips the video download and
  costs nothing. Frames are where the tokens go, so `--detail balanced` runs only when motion is
  itself the subject.
- **Skipped `watch-video`** (`Newuxtreme/watch-video-skill`), and the reason is instructive: its
  own description reads SLASH-COMMAND-ONLY, never auto-trigger. Recon has to invoke video reading
  itself, so a skill gated behind a manual command cannot be orchestrated no matter how good its
  output is.
- **Adopted `AGENTS.md`** as a read target. Wave A reads whichever of `AGENTS.md` or `CLAUDE.md`
  exists, and the project's own conventions outrank anything the loop would infer. Reading only
  `CLAUDE.md` made this Claude-parochial, which is a poor trait for a skill that installs into
  Codex, Cursor and every other host supporting the format.
- This repo now ships its own `AGENTS.md` so a contributor's agent knows the conventions without
  being told.
- On record in `stack.md`: "learn any skillset from video" is not a capability this registry will
  claim. Watching something and becoming good at it are different problems. The bounded, real
  version is motion reference extraction, and that is worth building next.

## 0.8.0, 17 August

**Agents deploy in waves, on an autonomy slider.**

- Added `references/agents.md`. The governing rule is **fan out reads, serialize writes**.
  Reads are independent and safe to run concurrently; two agents writing one artifact fail
  later and inexplicably rather than immediately.
- **Wave A, recon:** everything classify needs is a read. Live stylesheet, component library,
  accessibility baseline, research corpus, taste anchors. Five agents, one round trip, cheap
  model, no approval because nothing is written.
- **Wave B, make:** one writer per artifact, hard. Workers get a bounded spec rather than a
  goal, and the unit is capped at what a person can verify in about a minute. Explore is the
  exception, since a tournament produces separate artifacts.
- **Wave C, grade:** the biggest win and the one most often missed. Every grader reads the same
  finished artifact and none depends on another, so all six run concurrently and merge into a
  single verdict block. Six separate reports is not a result, it is homework.
- **Autonomy slider per stage**, after Karpathy: 0 propose, 1 surface every result, 2 surface
  the merged wave, 3 run and interrupt only on failure. Defaults are recon 3, produce 1,
  grade 2, iterate 1. A stage earns a level after three clean runs and loses one the moment it
  produces something that had to be undone.
- The reasoning behind all of it: **generation was never the bottleneck, verification is.** An
  orchestrator that produces faster than a person can check has not sped anything up, it has
  moved the queue. So parallelism belongs where verification is free, which is reads, and
  everywhere else the correct number of agents is the number of results someone will look at.
- Added a wave table to `stack.md` mapping every registry row to its wave, concurrency cap,
  model tier, and default autonomy level.

## 0.7.0, 17 August

**The idea pass, and three gates that should never have needed asking for.**

- Added `references/idea-pass.md`, a verbal gate between charter and explore. Say what the work
  is in one sentence naming a mechanism rather than a mood, then run four tests: the telephone
  test, the one-idea test, the generator test, the name test. Named for Bierut, who writes
  before he draws and whose work is almost always one generative move rather than an
  accumulation of good ones.
- This closes a real hole. The loop asked how the work should feel and whether the execution
  held. It never asked whether there was an idea, and a design can pass both while still being
  a style. The tell is that you cannot say what it is without showing it.
- **Hard gate added:** read the live stylesheet before inventing any token. Inventing a warm
  accent for a system that already ships one produces work that looks right and is wrong, and
  nobody catches it until integration. This happened, which is why it is now a gate.
- **Slop sweep is automatic at evaluate**, not something the user requests. The reflex that
  produces side stripes and numbered eyebrows does not announce itself.
- **Human as fallback evaluator.** When the artifact cannot be rendered, export it, hand it
  over, and say the visual check did not run. A clean audit on a broken render is worse than no
  audit because it manufactures confidence.
- Added `CHEATSHEET.md`: full capability list, what to say to get each behaviour, when not to
  use it, and known limits.

## 0.6.0, 17 August

**REQ-121 woven in: motion craft gets graded.**

- Re-ran the `emilkowalski/skills` comparison against the live repo. It held 7 skills when
  REQ-121 was filed and holds 10 now, so the original four-add three-skip split was re-derived
  rather than trusted. Four still earn rows; six are skipped with reasons on the record.
- `review-animations` added at evaluate as a motion craft gate. Its own stance, "default to
  flagging, approval is earned," is this loop's ethos applied to motion.
- `find-animation-opportunities` added at evaluate. Read-only motion-gap analysis, and the
  half that rejects what should *not* animate is the half worth having.
- `improve-animations` added as an audit entry point for existing codebases.
- `apple-design` added at stage 1 beside `motion-design`. Gesture, momentum and interruptible
  transitions were the one motion area no row covered.
- **Conflict flagged:** `prototype` duplicates design-deathmatch and is skipped, but
  design-deathmatch is not installed in every environment. Where it is missing, `prototype`
  takes the row instead. Never both.
- Install caveat recorded: `npx skills add emilkowalski/skills` has no per-skill flag and
  pulls all ten.

## 0.5.0, 27 July

**Evaluate now has to look at the thing.**

- Added a requirement that the artifact gets rendered and visually inspected. A structural
  check is not an evaluation. This came directly from shipping two broken boards with a
  clean build log, because the common failures are silent defaults rather than thrown errors.
- Added a "Production rules, learned the hard way" section to `stack.md`, covering three
  silent failures: Figma's `createAutoLayout()` shipping a solid white fill, per-side stroke
  weights having only one stroke colour, and canvas `fillStyle` ignoring `color-mix()` and
  `oklch()` without throwing.
- If the screenshot path is unavailable, the run now has to say the visual check did not
  happen rather than passing on structure alone.

## 0.4.2, 27 July

**Pinterest verified live, and the honest result recorded.**

- Recorded the working `_zap_raw_request` call shape, including the trap that `fail_on_errors`
  must be the string `"true"` and is required.
- Added a standing precondition: the connected account has one board and zero pins. The stage
  is a no-op until boards get curated, and it must stay a no-op rather than degrade into
  fabricating anchors.

## 0.4.1, 27 July

**Pinterest rewired from the direct API to Zapier.**

- Zapier exposes `create_pin` and a raw API passthrough, and zero search actions, which
  independently confirms the official v5 API has no public search endpoint.
- The passthrough removes the developer-app registration, the business-account requirement,
  the 24-hour Trial token expiry, and the video-recorded review needed for Standard access.
- `scripts/pinterest-sync.py` demoted to a documented fallback.

## 0.4.0, 27 July

**Inspiration sourcing, and a correction to the render-engine plan.**

- Added `references/inspiration.md`. Outside reference feeds `Reference-Library.md` and never
  gets read directly during produce, so a second competing taste system cannot grow beside the
  one already built.
- Verified all three render-engine repos by cloning them. Found that none ship a top-level
  `SKILL.md`; each is a collection of 19 skills total under `<repo>/skills/`. The clone command
  previously documented would have failed silently.
- Added `scripts/install-render-engines.sh`, which resolves every skill by its frontmatter name
  and installs flat. Dry-run tested.
- **Correction:** `motion-design` was proposed as a Lottie export pipeline. It is not. Its
  frontmatter describes timing, easing, choreography and Disney principles, explicitly
  implementation-agnostic. Moved from stage 3 with the render engines to stage 1 with the
  target, where it belongs. Given a kill condition.
- Noted the three.js README's own install command points at an unrelated repo.

## 0.3.0, 27 July

**The front door, and the wiring that was missing.**

- Added a classify pass before charter. Two questions answered out loud: product track or
  brand track, then what is attached. Attachments now decide which sub-skills ride along.
- Brand-track work that the three visual-identity files already answer gets sent out a fast
  lane instead of dragged through the full loop.
- Wired `Reference-Library.md` into produce as a required read before anything is generated.
  This is the difference between a build that looks made and one that looks generated.
- Registered the `design:` plugin skills as conditional sub-steps rather than new stages:
  `research-synthesis` and `user-research` before the charter, `design-system` as produce
  context, `ux-copy` inside produce, `accessibility-review` as a standing check on all
  product-track work, `design-critique` as an optional second opinion.
- Added `design-handoff` as an optional stage 6 that runs only on explicit request.
- Added three render engines to the registry as conditional produce-stage sub-skills.
- **Rejected on the record:** Design DNA, which duplicates the existing Brand-Style-Guide and
  Reference-Library system, and Genjutsu, which is positioning language rather than a distinct
  mechanism and holds the same ground as impeccable and resonance.
- Drafted `references/escalation-edits.md`: one sentence per `design:` skill so the pointer
  runs both directions. Not yet applied.

## Before this session, 24 July

Built as a command that chains design-deathmatch, evaluator, designer, and impeccable. The
core loop and the emotional target as a required gate were already in place. What was missing
was the front door, the cross-references to the rest of the design stack, and any instruction
to read real taste anchors before generating.

---

---

## A note on dates

Entries below 0.6.0 are dated from the working container's clock, which read 27 July. The
session that produced them may have run later; Slack and the calendar put REQ-121 and this
entry on 17 August. Treat the pre-0.6.0 dates as approximate and the ordering as reliable.

## Known gaps

- Render engines are not installed. The script is ready and tested.
- Escalation edits are drafted and not applied. They must go in `description:` frontmatter,
  because routing reads descriptions at selection time and the body only after the skill has
  already been chosen.
- `design-deathmatch` is referenced in the registry but is not installed in every environment.
  When missing, the format can be run by hand, and the run should say so.
- The inspiration stage is wired and has nothing to draw from.
