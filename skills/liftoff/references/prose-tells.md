# The prose-slop sweep

The writing counterpart to impeccable's visual bans. Runs at stage 4 as a standing
sub-check on any human-facing copy the run produced: headlines, body, UX copy, release
notes, handoff docs. Automatic, not on request, for the same reason the visual sweep is:
the reflex that produces slop does not announce itself.

Grader discipline applies. `copy-editor` produces; this sweep grades. Same separation as
everywhere else in stage 4, and a failing check leads with a negative imperative.

## Sources, named

Distilled from `blader/humanizer` (MIT, 2.6K stars, itself built on Wikipedia's "Signs of
AI writing," maintained by WikiProject AI Cleanup). Full attribution kept because the rule
against vague sources appears below, and it would be embarrassing to break it in the
header. Install the full skill (`github.com/blader/humanizer`) for rewriting; this file is
deliberately smaller, a grading rubric rather than an editor.

Wikipedia's caveat carries over verbatim in spirit: these are signs, not the problem
itself. Human ability to detect AI text is close to random chance. The sweep flags
accumulations, never single hits.

## The bans, gradeable

Each check is a FAIL when the pattern appears more than incidentally. One hit is style;
a cluster is a tell.

**Content**

- Stop inflating importance. "Stands as a testament," "pivotal moment," "marking a
  shift," "evolving landscape," "underscores its significance." If an ordinary fact is
  dressed as a milestone, undress it.
- Stop selling. "Vibrant," "nestled," "breathtaking," "renowned," "boasts," "stunning,"
  "commitment to excellence." Copy that describes a product the way a brochure would is
  a FAIL on sight in this stack, because the register the whole voice depends on is
  restraint.
- Stop citing ghosts. "Experts argue," "industry reports," "observers note." Name the
  source or delete the claim. Never invent one to pass this check.
- Stop faking ranges. "From the Big Bang to dark matter" is a list wearing a range's
  clothes. Real ranges have real endpoints.

**Language**

- Stop reaching for the stock words: delve, crucial, pivotal, landscape (abstract),
  tapestry, testament, showcase, underscore, foster, intricate, vibrant, enhance,
  leverage. One is a word; three in a paragraph is a watermark.
- Stop avoiding "is." "Serves as," "stands as," "features," "boasts" where is/has would
  do. Simple verbs are load-bearing in a voice built on plain statements.
- Stop the seesaw. "Not just X, it's Y," "not only... but also," and the clipped
  negative ending ("no guessing," "no fluff"). State the thing.
- Stop forcing threes. Two examples that exist beat three where one was invented to
  complete the rhythm. (The genuinely useful triple survives; the reflexive one does
  not, and a grader can tell by asking whether the third item earns its seat.)

**Structure and style**

- Stop bolding for emphasis-shaped emphasis, and stop the bold-label-colon list where
  every bullet is a mini-heading. If the list survives conversion to a sentence, it was
  a sentence.
- Stop opening with throat-clearing. "Let's dive in," "here's the thing," "honestly?",
  and the heading whose first sentence restates the heading.
- Stop answering objections nobody raised and rejecting options nobody proposed. "This
  isn't about X," "one might be tempted to Y." If the text never raised X, neither did
  the reader.
- Stop the dramatic fragment pile. One short sentence lands. Four in a row is a drum
  machine.
- Stop the formulaic profundity. "X is the language of Y," "the currency of," "at its
  core what really matters." Replace the saying with the claim.
- Em and en dashes: already banned by house rule everywhere in this stack. The sweep
  checks mechanically: search the artifact for the characters and fail on presence,
  same as the visual sweep checks for gradient text.

**Chatbot residue**

- Stop shipping the wrapper. "I hope this helps," "Certainly!", "Would you like me
  to...", knowledge-cutoff disclaimers, "while details are scarce, it appears..."
  followed by a guess presented as fact. Any of these in a shipped artifact is an
  automatic FAIL, not a cluster judgment.

## False positives, which the grader must honor

The sweep exists to catch generated-sounding prose, not to sand every voice down to the
same plank. Do not flag: formal words in a formal register, one em dash in a writer's
sample that uses them (the house rule outranks this only for house artifacts), deliberate
repeated openings building rhythm, one short sentence for emphasis, real disclaimers with
legal or safety weight, quoted or discussed phrases inside examples, and dry prose that is
merely dry. Polish is not evidence. Several patterns together are.

Keep the human details that survive: specific odd details, mixed feelings left
unresolved, asides and self-corrections, uneven sentence lengths. A pass that strips
those has failed in the other direction, and that failure also gets reported.

## Return shape

```
PROSE: PASS | FAIL
- <each failure: negative imperative, the exact phrase, where it lives>
```

Merged into the single stage-4 verdict block with the other graders. Never a separate
report; six reports is homework.
