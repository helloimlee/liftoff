# Style extraction: the procedure behind the read-the-live-system gate

Since 0.13.0 the produce stage carries a hard gate: read the live system before inventing
a single token. The gate had no procedure, which made it a rule that worked exactly as
well as whoever was following it that day. This file is the back half.

Provenance: the steal from the Hallmark design skill filed in the Resource Library
(8/23), whose one move worth taking was URL-to-style extraction. Everything else it does
is ground `impeccable` and `resonance` already hold, which is the same verdict stack.md
recorded for design-dna, and the same one applies: we take the extraction, not the rival.

## When

Wave A, recon, read-only, cheap model. Runs whenever the work ships into anything with an
existing visual system: a live site, an app, a stylesheet in the repo, a deployed page.
The output lands in the charter's `## Anchors` before produce starts, so the builder
inherits real values instead of remembering approximate ones.

## The procedure

Given a URL, a stylesheet, or a repo path:

1. **Pull from source, not from memory.** Fetch the live stylesheet or read the file.
   The failure this prevents is invisible: a warm accent invented next to one that
   already ships looks right and is wrong, and nobody catches it until integration.
2. **Extract the primitives, with their real values.**
   - Color: every named custom property and recurring literal, grouped by role
     (field, surface, ink, accent, line). Note the accent's coverage discipline if one
     is stated.
   - Type: families, the scale's actual steps, line heights, tracking, and which face
     owns which register (display, body, machine).
   - Space: the spacing scale as numbers, and the rhythm actually used between
     sections versus inside components.
   - Shape: radius vocabulary, border weights, shadow recipes verbatim.
   - Motion: durations, easings, and any stated ceiling.
3. **Record the derivations, not just the values.** If the darks carry a green cast or
   the light surfaces are derived from the darks, that relationship is the token system's
   actual content, and a builder who has only the hex values will break it politely.
4. **Write it into the charter's anchors** as a fenced block with the source URL and the
   fetch date. Values without provenance age into guesses.
5. **Name what you could not read.** Computed styles behind auth, canvas-drawn UI,
   inlined values that contradict the custom properties. An extraction that reports
   only what it got is manufacturing the same false confidence the evaluate stage
   guards against.

## What this is not

Not a new skill, not a registry row of its own, and not a second style-extraction system:
it is recon serving the existing gate, which is why it lives here rather than in the
registry as a component. The stack.md test for new components still holds: this covers
no judgment nothing else covers; it covers a procedure a judgment was already assuming.

Screenshot-to-style, the other half of the Hallmark move, stays out for now: extraction
from a rendered image is inference, and inferred values fail rule 1 of anchor prompt
blocks. If it ever comes in, it comes in labeled as inference, never mixed with read
values.
