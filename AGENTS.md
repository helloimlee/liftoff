# AGENTS.md

Guidance for any coding agent working in this repository. Follows the
[agents.md](https://agents.md) format, so this works in Codex, Cursor, Copilot, Gemini CLI and
anything else that reads it, not only Claude.

## What this repo is

A single Claude/agent skill plus its docs and a landing page. There is no build step, no test
runner, and no dependencies to install. It is markdown, three shell scripts, one Python script,
and one HTML file.

## Layout

```
skills/liftoff/       the skill itself. this is the shipped artifact
  SKILL.md            the loop. version lives in frontmatter
  CHEATSHEET.md       daily-use reference
  references/         stack.md is the registry, the rest are gates and guides
  scripts/            install helpers, all bash except pinterest-sync.py
docs/index.html       landing page, served by GitHub Pages from /docs
install.sh            copy or symlink the skill into a skills directory
```

## Before you change anything

Read `skills/liftoff/references/stack.md`. It holds the registry, the ordering rules, and a
"Production rules, learned the hard way" section of silent failures that have already cost real
time. Most changes are a one-line edit to the registry table rather than a rewrite.

## Conventions that are not negotiable

- **No em dashes.** Anywhere, in any file. Easy to grep, and it is checked.
- Contractions are fine. Corporate fog is not.
- Prose over bullets unless it is a genuine list.
- Say the failure plainly. "This happened, which is why it is now a gate" beats "consider
  ensuring alignment."
- No "leverage," "utilize," "seamless," "robust," or "delve."

## The bar for adding a component

One sentence: **what does this cover that nothing already in the registry covers?** If you
cannot answer it, it does not get a row. Overlap is the thing this stack exists to prevent, not
accumulate. Rejections get written into the "What we deliberately did not add" section of
`stack.md` with reasons, so nobody re-proposes them in six weeks.

## Checks before opening a PR

There is no CI. There is a checklist.

```bash
./install.sh --dry-run                      # still resolves, prints the version
./skills/liftoff/scripts/doctor.sh          # still runs and counts correctly
grep -rnP '\x{2014}' . --exclude-dir=.git   # returns nothing
```

Then run the loop on something real and small. If a change made the loop slower without making
a verdict sharper, it is not an improvement.

## Versioning

Semver in `skills/liftoff/SKILL.md` frontmatter, logged in `CHANGELOG.md` with a date.

- Patch: a fix, a corrected fact, a clearer sentence.
- Minor: a new step, a new gate, a new reference file.
- Major: the loop changes shape.

Changelog entries say what changed and **why**, and the why is usually a failure. Write them
like you are saving someone the afternoon you just lost.

## Things that will get pushed back

- A component that overlaps something already registered.
- A new permanent stage where a conditional sub-step would do.
- Positioning language instead of a mechanism. "Premium interface design" is not a capability.
- Anything that makes PASS cheaper to say. The gate is the product.
