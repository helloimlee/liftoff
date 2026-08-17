#!/usr/bin/env bash
# Install the liftoff render engines into ~/.claude/skills/
#
# Why this script exists: none of the three repos ship a top-level SKILL.md.
# Each is a COLLECTION at <repo>/skills/<name>/SKILL.md. Cloning a repo straight
# into ~/.claude/skills/<name>/ produces ~/.claude/skills/<name>/skills/<name>/SKILL.md,
# which the agent never discovers. The skills have to be lifted out of skills/.
#
# Also: the three.js README's own clone command points at a different repo
# (pinkforest/threejs-playground). That is their bug. Do not follow it.
#
# Usage: ./install-render-engines.sh [--dry-run]

set -euo pipefail

DEST="${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}"
DRY=0
[ "${1:-}" = "--dry-run" ] && DRY=1

REPOS=(
  "https://github.com/CloudAI-X/threejs-skills"
  "https://github.com/greensock/gsap-skills"
  "https://github.com/lottiefiles/motion-design-skill"
)

TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

echo "Destination: $DEST"
[ $DRY -eq 1 ] && echo "DRY RUN, nothing will be written"
mkdir -p "$DEST"

INSTALLED=()

for repo in "${REPOS[@]}"; do
  name="$(basename "$repo")"
  echo
  echo "==> $name"
  git clone -q --depth 1 "$repo" "$TMP/$name" || { echo "    CLONE FAILED, skipping"; continue; }

  # Skills live under skills/ in all three repos. Fall back to a wider search.
  mapfile -t found < <(find "$TMP/$name" -name SKILL.md -not -path "*/node_modules/*" | sort)
  if [ ${#found[@]} -eq 0 ]; then
    echo "    No SKILL.md found. Repo layout changed, inspect manually."
    continue
  fi

  for skill in "${found[@]}"; do
    dir="$(dirname "$skill")"
    # frontmatter name wins over directory name, always
    fm="$(awk '/^---/{c++; next} c==1 && /^name:/{sub(/^name:[[:space:]]*/,""); gsub(/["'\'']/,""); print; exit}' "$skill")"
    folder="$(basename "$dir")"
    target="${fm:-$folder}"

    if [ -z "$fm" ]; then
      echo "    WARN  $folder has no frontmatter name, using folder name"
    elif [ "$fm" != "$folder" ]; then
      echo "    NOTE  folder '$folder' != frontmatter '$fm', installing as '$fm'"
    fi

    if [ $DRY -eq 1 ]; then
      echo "    would install: $target"
    else
      rm -rf "${DEST:?}/$target"
      cp -R "$dir" "$DEST/$target"
      echo "    installed: $target"
    fi
    INSTALLED+=("$target")
  done
done

echo
echo "=============================================="
echo "Installed ${#INSTALLED[@]} skills:"
printf '  %s\n' "${INSTALLED[@]}" | sort
echo
echo "Paste these names into references/stack.md so the registry rows match."
echo "A name mismatch means liftoff skips the row silently, which is the"
echo "failure mode this whole script exists to prevent."
echo
echo "Then start a fresh session. Skills are read at session start."
