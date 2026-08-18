# The echo

Before acting on a brief, say back everything you absorbed, with your own additions marked as
yours. Then wait.

Borrowed from `thinking-out-loud` in Shubham Saboo's collection, which frames the problem better
than anything else on the pile.

---

## The distinction worth the whole file

**A clarifying question verifies what the model doubts. An echo verifies what the model
believes.**

Asking questions is good and liftoff already does it. But questions cannot secure a brief on
their own, for a structural reason: asking requires felt uncertainty, and a confident misreading
does not feel uncertain. It feels like knowledge. So the misreadings, which are the expensive
ones, never become questions.

Questions also sample. A brief carries dozens of facts and half-decisions; even good questions
probe three or four and the rest goes into the build unverified.

The echo audits the whole transfer instead, and it works by recognition rather than recall. The
person reads and spots what is wrong, which is far cheaper than producing answers. People often
do not know what they meant until they see the wrong guess written down.

---

## Why this belongs in liftoff specifically

Every expensive failure this loop has produced came from a confident gap-fill, not from a
missing answer:

- A warm accent invented for a system that already shipped one, because "it needs heat" got
  quietly resolved into a specific hex.
- A motion skill filed as a Lottie export pipeline because its marketing copy said Lottie and
  the frontmatter was never read.
- Dotted rings in a screenshot read as debris because "circle in the sky" resolved to the first
  plausible thing.

None of those felt uncertain. All of them cost real work. Classify already says the read out
loud, but only for track and attachments; it never audited what else the model had silently
decided.

---

## The shape

Runs at stage 0b, before the charter, after recon. Short. It is an audit, not a document.

```
ECHO

Mission          what you are actually asking for, in one line
Locked           decisions already made that I will not revisit
Constraints      hard limits: brand, platform, deadline, tech
Reversed         anything you said and then changed. stated as your final position
Open             what I genuinely do not know

MINE, not yours  ← everything below is my inference, not your words
  · assumed the accent should be warm because the brief said "heat"
  · assumed desktop-first because you sent a wide screenshot
  · assumed this ships on the marketing site, not in-product
```

**The quarantine is the mechanism.** Everything the model added goes below a hard line, labelled
as the model's. That is what makes an inference visible as an inference rather than blending
into the restatement and getting nodded through.

`Reversed` earns its own row because people talk themselves out of positions mid-brief and the
abandoned version survives as fact unless it is named and retired.

---

## Rules

**Act on nothing until the echo is answered.** The entire value is that correction happens
before generation. An echo delivered alongside finished work is a receipt, not a check.

**Put uncertainty in `MINE`, not in prose.** "It seems like maybe you want warm tones" hedges
without being checkable. "Assumed warm because the brief said heat" is a line someone can strike
through.

**Keep it under fifteen lines.** An echo that takes as long to read as the brief took to write
gets skimmed, and a skimmed echo is worse than none because it manufactures agreement.

**One echo per brief, not per turn.** Re-echoing after every message is a tic. Re-echo when the
scope moves materially.

**Skip it for small, literal asks.** "Fix this contrast ratio" does not need an audit. The echo
earns its two minutes on briefs carrying real ambiguity, which in practice means anything
spoken, anything long, and anything that arrived with attachments.

---

## What it does not replace

Not the classification, which still gets stated. Not the idea pass, which asks whether there is
an idea at all. Not clarifying questions, which are still right when the model genuinely does
not know.

The echo covers the case none of those reach: the things the model is sure about and wrong
about.
