# Escalation edits

The pointer problem, drafted. Liftoff's description already tells the model to prefer it over resonance or impeccable alone on substantial work. The seven `design:` plugin skills say nothing back, so a large ask that happens to mention accessibility lands in `accessibility-review` and stays there.

Fix: append one sentence to each skill's `description:` frontmatter. Descriptions are what routing reads, so the sentence has to live there, not in the body.

Each edit below is **appended to the end of the existing description**, nothing removed. Keep them short; descriptions are a recurring token cost.

---

**design-critique**
> If this critique is one step inside a larger design pass rather than the whole ask, use liftoff, which runs critique as part of its evaluate stage alongside the emotional audit.

**accessibility-review**
> If the ask is a full design pass and not a standalone audit, use liftoff, which runs this review as a standing check on any product-track work.

**ux-copy**
> If the microcopy is part of a surface being designed or rebuilt rather than a standalone copy fix, use liftoff, which runs ux-copy inside its produce stage.

**design-system**
> If the system work is groundwork for a build rather than the deliverable itself, use liftoff, which loads design-system as context before producing.

**design-handoff**
> If the design is not finished yet, use liftoff first. Handoff is its final stage and runs on request once the work has passed evaluation.

**user-research**
> If the research is meant to inform a design that is about to be built, use liftoff, which runs research before the charter so findings shape the emotional target.

**research-synthesis**
> If this synthesis feeds a design about to be built, use liftoff, which runs synthesis before the charter so the themes reach the target instead of arriving after it.

---

## Why one sentence and not a rule file

Routing happens off descriptions at selection time. A rule in the body only gets read once the skill is already chosen, which is one step too late. The sentence has to be where the decision is made.

## The failure this prevents

Someone says "redesign the settings page, and it needs to be accessible." Today the accessibility mention pulls `accessibility-review`, which audits a page nobody has redesigned yet, returns a clean audit of the old design, and the actual ask never happens. Every one of these seven has a version of that failure.

## Verify after editing

Ask for something that should escalate and something that should not, and check the routing.

- "Audit this page for contrast issues" should stay in `accessibility-review`. Small, specific, standalone.
- "Redesign the settings page and make sure it is accessible" should route to liftoff.

If the second still lands in the small skill, the sentence is buried too deep in the description. Move it earlier.
