#!/usr/bin/env bash
# Install or update liftoff.
#
#   ./install.sh              copy into ~/.claude/skills/       (all projects)
#   ./install.sh --project    copy into ./.claude/skills/       (this project only)
#   ./install.sh --link       symlink instead of copy, so 'git pull' updates it
#   ./install.sh --check      am I behind? compares against GitHub, changes nothing
#   ./install.sh --dry-run    print what would happen, change nothing
set -euo pipefail

REPO_RAW="https://raw.githubusercontent.com/helloimlee/liftoff/main/skills/liftoff/SKILL.md"
DEST="${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}"
MODE=copy; DRY=0; CHECK=0

for a in "$@"; do
  case "$a" in
    --project) DEST="$(pwd)/.claude/skills" ;;
    --link)    MODE=link ;;
    --check)   CHECK=1 ;;
    --dry-run) DRY=1 ;;
    -h|--help) sed -n '2,10p' "$0"; exit 0 ;;
    *) echo "unknown flag: $a"; exit 1 ;;
  esac
done

SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/skills/liftoff"
[ -f "$SRC/SKILL.md" ] || { echo "Can't find skills/liftoff/SKILL.md next to this script."; exit 1; }
ver(){ awk '/^---/{c++;next} c==1 && /^version:/{sub(/^version:[[:space:]]*/,"");gsub(/["'\'']/,"");print;exit}' "$1"; }
NAME="$(awk '/^---/{c++;next} c==1 && /^name:/{sub(/^name:[[:space:]]*/,"");gsub(/["'\'']/,"");print;exit}' "$SRC/SKILL.md")"
NAME="${NAME:-liftoff}"
VER="$(ver "$SRC/SKILL.md")"

if [ $CHECK -eq 1 ]; then
  INSTALLED="none"
  [ -f "$DEST/$NAME/SKILL.md" ] && INSTALLED="$(ver "$DEST/$NAME/SKILL.md")"
  LATEST="$(curl -fsSL --max-time 15 "$REPO_RAW" 2>/dev/null | awk '/^---/{c++;next} c==1 && /^version:/{sub(/^version:[[:space:]]*/,"");gsub(/["'\'']/,"");print;exit}')" || LATEST=""
  echo "installed at $DEST/$NAME : ${INSTALLED}"
  echo "this checkout               : ${VER}"
  echo "github main                 : ${LATEST:-could not reach github}"
  echo
  if [ -L "$DEST/$NAME" ]; then
    echo "You are in LINK mode. 'git pull' in this repo updates you instantly."
  elif [ -n "$LATEST" ] && [ "$INSTALLED" != "$LATEST" ]; then
    echo "You are behind. Update with:  git pull && ./install.sh"
  elif [ -n "$LATEST" ]; then
    echo "Up to date."
  fi
  exit 0
fi

echo "liftoff ${VER}  ->  $DEST/$NAME  (${MODE})"
[ $DRY -eq 1 ] && { echo "(dry run, nothing written)"; exit 0; }

mkdir -p "$DEST"
if [ -e "$DEST/$NAME" ] || [ -L "$DEST/$NAME" ]; then
  if [ -L "$DEST/$NAME" ]; then
    rm "$DEST/$NAME"; echo "replaced existing symlink"
  else
    BAK="$DEST/$NAME.backup.$(date +%Y%m%d%H%M%S)"
    mv "$DEST/$NAME" "$BAK"; echo "previous install moved to $BAK"
  fi
fi

if [ "$MODE" = link ]; then
  ln -s "$SRC" "$DEST/$NAME"
  echo "symlinked. from now on: git pull  (that is the whole update)"
else
  cp -R "$SRC" "$DEST/$NAME"
  chmod +x "$DEST/$NAME/scripts/"*.sh 2>/dev/null || true
  echo "copied. to update later: git pull && ./install.sh"
fi

echo
echo "Start a fresh session, then try:"
echo "  /liftoff design the pricing page. it should feel like confirming a decision you already made."
echo
echo "Next: ./skills/liftoff/scripts/doctor.sh"
