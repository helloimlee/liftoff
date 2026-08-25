# Anchor prompt blocks

An extension to the reference library's anchor schema, stolen from BYQ's Copy Prompt
move (byq.supply, filed in the Resource Library 8/22, woven into Rooster as the
hand-it-off export in v0.18.0). The liftoff half of the steal: **expose assets as
structured code prompts into the produce stage.**

## The gap this fills

`Reference-Library.md` anchors are screenshots, and screenshots are doing the heaviest
lifting in the whole taste system: real images of genuinely good work give produce
something specific to reach for. But a screenshot tells produce what good looks like and
nothing about how it was built. The gap between "make it feel like this image" and "here
is the grid, the spacing rhythm, the reveal timing, the asset URLs" is exactly the gap
where a build drifts generic.

BYQ's insight is that a design asset is worth more as executable structure than as a
picture of itself. Their library exports every section as real code with real values.
Ours can carry the same, per anchor, when the values are known.

## The schema

An anchor in `Reference-Library.md` MAY carry a fenced `prompt` block after its image
and provenance lines:

```markdown
### <anchor name>
![screenshot](anchors/<file>.png)
Source: <where this is from, verbatim per inspiration.md rules>
Why it earns its place: <one line>

```prompt
LAYOUT   <grid or flow, with real values: columns, gutters, max-width>
TYPE     <faces in play and the scale steps this anchor actually uses>
SPACE    <the spacing rhythm, as numbers>
MOTION   <what moves, triggered by what, duration and easing>
ASSETS   <URLs or paths, only ones that exist>
NOTES    <the one or two structural decisions that make it work>
```
```

Plain-language fields, real values, no prose about vibes. The block is a build spec in
miniature, not a description.

## The rules, and they are load-bearing

- **A prompt block is written from inspection, never from imagination.** You add one by
  reading the real thing: the live site's computed styles, the repo, the Figma file. An
  anchor whose construction you cannot verify stays a screenshot. An invented prompt
  block is worse than none, because produce will treat it as ground truth, which is the
  same rule the library already applies to low-confidence anchors.
- **Vanilla only.** Blocks describe structure in liftoff's idiom: semantic HTML,
  hand-authored CSS values. BYQ exports JSX/Tailwind; the pattern travels, the framework
  does not. The taste rules are not BYQ's to override.
- **Produce reads blocks when present, and says so.** In stage 3, an anchor with a
  prompt block contributes structure, not only mood. The build log names which blocks
  were consumed.
- **Getlayers folds in here.** The prompt-library-for-animated-sites reel points at the
  same mechanism from the paid side. One mechanism, one schema, no second row. If a
  Getlayers-style prompt is worth keeping, it enters as a prompt block on an anchor that
  earned its place, subject to the same inspection rule.

## What this does not change

Anchors still arrive through `Reference-Library.md` and nowhere else. Pinterest still
feeds the file at stage 1. An anchor showing up mid-build is still a new opinion showing
up mid-build. The prompt block changes what an anchor can carry, not how anchors enter.
