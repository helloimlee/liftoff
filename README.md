# Liftoff

A design pass that can tell you no.

Liftoff runs a design job end to end. It decides what the work should make someone feel, checks
there is an idea and not just a style, explores if the direction is open, builds, then hands the
result to fresh eyes that grade it against the original target and fail it if the feeling did
not land.

That last part is the point. Most AI design help is an enthusiastic friend who thinks everything
you make is great. Liftoff has a gate where "this renders correctly and makes nobody feel
anything" counts as a failure, and the run does not finish until that is fixed.

Built at [MaxQ](https://gomaxq.com).

---

## Install

```bash
npx skills add MaxQ-studio/liftoff
```

That drops `liftoff` into `.claude/skills/` for the current project. Start a fresh session
afterward; skills are read at session start.

**Or clone and copy**, which works with any agent:

```bash
git clone https://github.com/MaxQ-studio/liftoff
cd liftoff
./install.sh                 # copies into ~/.claude/skills/
./install.sh --project       # or into ./.claude/skills/ for one project
./install.sh --dry-run       # see what it would do first
```

**Or by hand.** Copy `skills/liftoff/` to `~/.claude/skills/liftoff/`. That is the whole
install; there is no build step and nothing to configure.

---

## First run

```
/liftoff design the pricing page
```

Better:

```
/liftoff design the pricing page. It should make someone feel like they already
decided and are just confirming. Here's the live site: example.com
```

The second sentence is the difference between getting a pricing page and getting a pricing page
you can grade. See [CHEATSHEET.md](skills/liftoff/CHEATSHEET.md) for the full list of what to
say to get each behaviour.

---

## Check what you're working with

Liftoff chains other skills when they exist and degrades gracefully when they do not. It will
never break because something is missing; it will skip the stage and say so.

```bash
./skills/liftoff/scripts/doctor.sh
```

That prints which companions are installed, which are missing, and exactly what you lose
without each. Run it once after installing so you know what your version of the loop can do.

### What it chains

| Skill | Without it |
|---|---|
| `resonance` | No emotional target. The loop still runs; the gate is weaker. |
| `impeccable` | No build or polish stage. Liftoff becomes planning only. |
| `copy-editor` | Prose ships unedited. |
| `design-deathmatch` | No tournament format. Single exploration only. |
| `maxq:designer` / `maxq:evaluator` | Falls back to inline exploration and self-grading, which it will flag as unreliable. |
| `design-critique`, `accessibility-review`, `ux-copy`, `design-system`, `design-handoff`, `user-research`, `research-synthesis` | Those sub-steps skip. Named in the run summary. |
| `threejs-*`, `gsap-*`, `motion-design`, `apple-design` | No 3D, timeline motion, or motion craft gate. |

**None of these are required.** Liftoff on its own is still a charter loop with an emotional
target and an idea gate, which is most of the value. Add companions as you need them.

### Optional extras

```bash
./skills/liftoff/scripts/install-render-engines.sh --dry-run
```

Pulls the 3D, GSAP, and motion skills. Worth knowing: none of those upstream repos ship a
top-level `SKILL.md`, so cloning them directly into a skills folder silently installs nothing.
The script resolves each skill by its frontmatter name and installs flat. That is the entire
reason it exists.

---

## What's in here

```
skills/liftoff/
  SKILL.md              the loop
  CHEATSHEET.md         capabilities, what to say, when not to use it, limits
  references/
    stack.md            the registry, ordering rules, hard-won production gotchas
    idea-pass.md        the verbal gate. one sentence, four tests, before you draw
    inspiration.md      outside reference and how it feeds taste anchors
    escalation-edits.md drafted description edits, not applied
  scripts/
    doctor.sh                   what is installed, what you lose without it
    install-render-engines.sh   3D, GSAP, motion
    pinterest-sync.py           optional inspiration sourcing
```

Start with `CHEATSHEET.md`. `stack.md` is the interesting one if you want to change how the loop
behaves; adding a step is a one-line edit to its registry table, not a rewrite.

---

## The loop, briefly

1. **Classify.** Product or brand, and what is attached. Stated out loud so you can correct it
   in one sentence instead of at hour three.
2. **Charter.** Three feelings and a peak moment, written down and gradeable.
3. **Idea pass.** Say what this is in one sentence naming a mechanism, not a mood. Four tests.
   Two minutes. Kills the most expensive failure in the loop, which is building something
   competent that was never about anything.
4. **Explore**, only if the direction is genuinely open.
5. **Produce.** Reads the live stylesheet for real tokens before inventing any value, and real
   reference images as taste anchors.
6. **Evaluate.** Craft verdict, emotional verdict, accessibility, and an automatic sweep against
   known AI-slop patterns. All must pass.
7. **Iterate** to PASS. **Hand off** only when asked.

---

## Contributing

Yes please. See [CONTRIBUTING.md](CONTRIBUTING.md). The short version: the bar for adding
anything to the registry is that it covers a pipeline or a judgment nothing already in there
covers. Overlap is the thing this stack is built to prevent, not accumulate. Rejections get
written down in `stack.md` with reasons so nobody re-proposes them in six weeks.

---

## License

MIT. See [LICENSE](LICENSE).
