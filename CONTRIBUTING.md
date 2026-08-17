# Contributing

Liftoff is small on purpose. The most useful contributions are usually a deletion, a sharper
rule, or a gotcha someone lost an afternoon to.

## The bar for adding anything

**A new component earns a row in the registry by covering a pipeline or a judgment nothing
already in there covers.** If you cannot say in one sentence what it does that no existing row
does, it does not get a row.

This is the whole design philosophy of the stack. Overlap is the thing it is built to prevent,
not accumulate. Two skills claiming the same ground means neither gets invoked reliably, and
the loop gets slower without getting better.

When something is rejected, **write it down in `references/stack.md` with the reason.** There is
a "What we deliberately did not add" section for exactly this. It has already stopped the same
tools being re-proposed twice.

## Adding a step to the loop

Registry lives in `skills/liftoff/references/stack.md`. Adding a step is a one-line edit to that
table, not a rewrite of `SKILL.md`.

1. Confirm the exact `name` from the frontmatter of its `SKILL.md`, not the folder name.
   Frontmatter wins, and a mismatch means liftoff skips the row silently.
2. Add the row. Status is `on`, `conditional`, or `off`.
3. Place it by function. Anything that constrains the work runs before the work; anything that
   evaluates it runs after.
4. Say what it covers that nothing else covers. If you cannot, close the PR yourself.
5. Add it to `scripts/doctor.sh` with an honest one-line description of what is lost without it.

## Production gotchas are first-class

If you lose an hour to a silent failure, that belongs in the "Production rules, learned the hard
way" section of `stack.md`. The bar is: it failed with no error, and it cost real time.

Existing entries came from exactly that. Figma's `createAutoLayout()` shipping an opaque white
fill. Auto-layout resizing FILL children so absolutely-positioned content overhangs. Canvas
`fillStyle` silently ignoring `color-mix()`. None of these throw, all of them ruin output.

## Writing style

The docs are meant to be read out loud without wincing.

- No em dashes. Anywhere. This is not negotiable and it is easy to grep for.
- Contractions are fine, corporate fog is not.
- Prose over bullets unless it is a genuine list.
- Say the failure plainly. "This happened, which is why it is now a gate" beats "consider
  ensuring alignment."
- No "leverage," "utilize," "seamless," "robust," or "delve."

## Testing a change

There is no test suite. There is a checklist.

1. `./install.sh --dry-run` still resolves.
2. `./skills/liftoff/scripts/doctor.sh` still runs and counts correctly.
3. `grep -rnP '\x{2014}' .` returns nothing. No em dashes anywhere.
4. Run the loop on something real and small. If your change made the loop slower without making
   a verdict sharper, it is not an improvement.

## Versioning

Semver-ish, in `SKILL.md` frontmatter, logged in `CHANGELOG.md` with a date.

- Patch: a fix, a corrected fact, a clearer sentence.
- Minor: a new step, a new gate, a new reference file.
- Major: the loop itself changes shape.

Changelog entries say what changed and **why**, and the why is usually a failure. Those entries
are the most re-read part of this repo. Write them like you are saving someone the afternoon you
just lost.

## Things that will get pushed back

- A skill that overlaps something already registered.
- A new permanent stage where a conditional sub-step would do.
- Positioning language instead of a mechanism. "Premium interface design" is not a capability.
- Anything that makes PASS cheaper to say. The gate is the product.
