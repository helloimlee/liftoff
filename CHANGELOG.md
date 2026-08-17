# Changelog

All dates 2026. Liftoff is a charter loop for design work, not an orchestrator. It sets an
emotional target, explores when the direction is unknown, builds, grades with fresh eyes,
and loops until it passes.

---

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
