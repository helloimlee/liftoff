# Deploying agents

How liftoff fans work out without producing more than a person can check.

Built on Karpathy's framing: the model is not the bottleneck, **verification is**. An orchestrator
that generates faster than a human can verify has not sped anything up, it has just moved the
queue. So the goal here is never maximum parallelism. It is the most work that can be produced
per unit of human checking.

---

## The one rule that decides everything else

**Fan out reads. Serialize writes.**

Reads are independent and safe. Six agents can look at the same artifact at once and nothing
collides. Writes are not: two agents editing the same file, canvas, or repo will clobber each
other, and the failure shows up later as something inexplicable rather than as an error.

Almost every parallelism win in this loop is on the read side. Almost every disaster is on the
write side. Structure the waves around that and the rest follows.

---

## The three waves

### Wave A · Recon. Parallel, cheap, autonomous.

Everything in classify is a read and none of it depends on any of the rest. Fan the whole set
at once on the cheapest model that can do it.

| Agent | Reads | Returns |
|---|---|---|
| system | the live stylesheet | real tokens, fonts, spacing scale |
| components | existing library or Figma file | what already exists, so nothing gets reinvented |
| baseline | the live site | accessibility state before anything is touched |
| research | transcripts, tickets, notes | themes that feed the target |
| anchors | reference library, boards | taste anchors |

Five agents, one round trip, no approval needed because nothing is written. This wave usually
costs seconds and prevents the most expensive class of mistake there is: inventing a token that
already exists.

### Wave B · Make. Mostly sequential, orchestrated by the strong model.

Produce is where writes happen, so this is where parallelism gets dangerous.

- **One writer per artifact.** Always. If two surfaces are genuinely independent files, they can
  run concurrently; if they share a file, they queue.
- **Workers get a spec, not a goal.** The orchestrator decides; the worker executes a bounded
  unit. Sonnet is fine for the unit, the strong model holds the plan.
- **Cap the unit at what a human can verify in about a minute.** A section, a component, a
  screen. Not a page. This is the leash, and it is the whole point.

Explore is the exception. A tournament is many agents producing genuinely separate artifacts,
which is safe and is exactly what it is for.

### Wave C · Grade. Parallel, and the biggest win in the loop.

Evaluate is embarrassingly parallel and is almost always run sequentially by accident. Every
grader reads the same finished artifact and none of them depend on each other.

Fan all of these at once:

```
craft verdict          emotional audit        accessibility (AA)
slop sweep             motion craft           motion-gap
```

Then **merge into one verdict block before showing anyone anything.** Six reports is not a
result, it is homework. One block, failures first, each with a one-line reason and the exact
file or node it concerns.

The merge is not a formatting nicety. It is the step that makes the human fast, and per the
framing above, the human is the constraint.

---

## The autonomy slider

Not every stage deserves the same leash, and the leash should loosen as a stage earns it.

| Level | Behaviour | Good default for |
|---|---|---|
| 0 | Propose the plan, run nothing | anything irreversible |
| 1 | Run, surface every individual result | produce, on a new codebase |
| 2 | Run the whole wave, surface the merged output | grade, and produce once trusted |
| 3 | Run, and only interrupt on FAIL | recon, always |

Starting position: **recon 3, produce 1, grade 2, iterate 1.**

Move a stage up one level when it has passed three consecutive runs without a correction. Move
it back down the moment it produces something you had to undo. The slider is a record of earned
trust, not a preference, and writing the current level into the run summary is what keeps it
honest.

The failure mode this prevents: setting everything to 3 on day one because it feels faster,
then discovering at hour four that the third step was wrong and everything after it is built on
top of that.

---

## Cost routing

- **Strong model** orchestrates, and holds evaluate and any gated PASS decision. Those are
  precisely the judgment calls that get worse when they get cheaper.
- **Mid model** for bounded production units and tournament personas.
- **Cheap model** for read-only recon. Wave A is almost entirely this.

Never route the verdict down. A cheaper grader agrees more, and a grader that agrees is not a
grader.

---

## Concurrency limits

- **Recon:** all of it. It is five reads.
- **Explore:** cap at 4 concurrent. Beyond that the jury is comparing things nobody looked at
  properly, and a tournament with an inattentive jury is worse than one exploration done well.
- **Produce:** 1 per artifact, hard.
- **Grade:** all of them. They are reads.

If a wave would return more than one screen of output for a person to check, the wave is too
big. Split it and run twice. Two verifiable rounds beat one unverifiable one.

---

## What to report

Every run ends with the same block, because a person should be able to trust the shape of it
without reading carefully:

```
WAVE A  recon      5 agents · parallel · 3s      autonomy 3
WAVE B  produce    1 writer · sequential         autonomy 1
WAVE C  grade      6 graders · parallel          autonomy 2

VERDICT  FAIL
  ✗ peak moment produces target feeling   the moment carries no consequence
  ✓ craft · a11y · slop · motion · gaps

SKIPPED  design-deathmatch (not installed), review-animations (not installed)
```

Failures first. Passes collapsed to one line. Skipped components named rather than silently
dropped, because a stage that quietly did not run reads exactly like a stage that passed.

---

## The thing not to do

Do not fan out generation to look fast. If six agents produce six things and a person can only
check two of them, four have shipped unverified and the loop has stopped meaning anything.

Parallelism belongs where verification is free, which is reads. Everywhere else, the correct
number of agents is the number of results someone will actually look at.
