#!/usr/bin/env bash
# What liftoff can and cannot do in THIS environment.
set -uo pipefail

DIRS=("${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}" "$(pwd)/.claude/skills")
echo "Looking in:"; for d in "${DIRS[@]}"; do echo "  $d"; done; echo

have(){ for d in "${DIRS[@]}"; do [ -f "$d/$1/SKILL.md" ] && return 0; done; return 1; }
row(){ if have "$1"; then printf '  \033[32m✓\033[0m %-26s %s\n' "$1" "$2"; else printf '  \033[33m·\033[0m %-26s \033[2mmissing: %s\033[0m\n' "$1" "$3"; fi; }

echo "CORE"
row liftoff             "the loop itself"                    "install this repo first"
row resonance           "emotional target"                   "no target, the gate gets weaker"
row impeccable          "build and polish"                   "planning only, nothing gets built"
row copy-editor         "prose"                              "copy ships unedited"
echo
echo "EXPLORE"
row design-deathmatch   "tournament format"                  "single exploration only"
echo
echo "EVALUATE"
row design-critique     "second opinion"                     "one grader only"
row accessibility-review "WCAG standing check"               "a11y not checked"
echo
echo "PRODUCE"
row design-system       "component context"                  "may invent parallel components"
row ux-copy             "microcopy"                          "buttons and empty states unwritten"
row design-handoff      "engineering spec"                   "no handoff stage"
echo
echo "RESEARCH"
row user-research       "research planning"                  "targets get guessed"
row research-synthesis  "theme synthesis"                    "targets get guessed"
echo
echo "MOTION + RENDER"
row motion-design       "motion intent"                      "no timing or easing direction"
row apple-design        "gesture, momentum, interruptible"   "touch motion unguided"
row review-animations   "motion craft gate"                  "motion ungraded"
row find-animation-opportunities "motion-gap analysis"       "missed motion goes unnoticed"
row improve-animations  "codebase motion audit"              "no audit entry point"
echo
echo "INPUT"
row watch               "reads video: motion refs, demos"    "video references cannot be read at all"
echo
echo "MEMORY"
if [ -f "$(pwd)/memory/lessons.md" ]; then printf '  \033[32m✓\033[0m %-26s %s\n' "memory/lessons.md" "past runs carry forward"
else printf '  \033[33m·\033[0m %-26s \033[2mnot started: every run begins from zero\033[0m\n' "memory/lessons.md"; fi
row gsap-core           "timeline motion"                    "run scripts/install-render-engines.sh"
row threejs-fundamentals "WebGL 3D"                          "run scripts/install-render-engines.sh"
echo
n=0; for s in liftoff resonance impeccable copy-editor design-deathmatch design-critique \
  accessibility-review design-system ux-copy design-handoff user-research research-synthesis \
  motion-design apple-design review-animations find-animation-opportunities improve-animations \
  gsap-core threejs-fundamentals watch; do have "$s" && n=$((n+1)); done
echo "$n of 20 present."
echo
echo "Nothing here is required. Liftoff degrades, it does not break."
echo "Missing pieces get skipped and named in the run summary."
