#!/usr/bin/env bash
# Install or update liftoff.
#
# Copies skills/liftoff into a skills directory, and the three agents it ships
# (runner, evaluator, persona) into the matching agents directory.
#
#   ./install.sh              copy into ~/.claude/skills/ and ~/.claude/agents/
#   ./install.sh --project    copy into ./.claude/ instead        (this project only)
#   ./install.sh --link       symlink instead of copy, so 'git pull' updates it
#   ./install.sh --check      am I behind? compares against GitHub, changes nothing
#   ./install.sh --dry-run    print what would happen, change nothing
set -euo pipefail

REPO_RAW="https://raw.githubusercontent.com/helloimlee/liftoff/main/skills/liftoff/SKILL.md"
DEST="${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}"
AGENTS_DEST="${CLAUDE_AGENTS_DIR:-$HOME/.claude/agents}"
MODE=copy; DRY=0; CHECK=0

for a in "$@"; do
  case "$a" in
    --project) DEST="$(pwd)/.claude/skills"; AGENTS_DEST="$(pwd)/.claude/agents" ;;
    --link)    MODE=link ;;
    --check)   CHECK=1 ;;
    --dry-run) DRY=1 ;;
    -h|--help) sed -n '2,11p' "$0"; exit 0 ;;
    *) echo "unknown flag: $a"; exit 1 ;;
  esac
done

SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/skills/liftoff"
[ -f "$SRC/SKILL.md" ] || { echo "Can't find skills/liftoff/SKILL.md next to this script."; exit 1; }
AGENTS_SRC="$SRC/agents"
ver(){ awk '/^---/{c++;next} c==1 && /^version:/{sub(/^version:[[:space:]]*/,"");gsub(/["'\'']/,"");print;exit}' "$1"; }
fname(){ awk '/^---/{c++;next} c==1 && /^name:/{sub(/^name:[[:space:]]*/,"");gsub(/["'\'']/,"");print;exit}' "$1"; }
NAME="$(fname "$SRC/SKILL.md")"
NAME="${NAME:-liftoff}"
VER="$(ver "$SRC/SKILL.md")"

if [ $CHECK -eq 1 ]; then
  INSTALLED="none"
  [ -f "$DEST/$NAME/SKILL.md" ] && INSTALLED="$(ver "$DEST/$NAME/SKILL.md")"
  LATEST="$(curl -fsSL --max-time 15 "$REPO_RAW" 2>/dev/null | awk '/^---/{c++;next} c==1 && /^version:/{sub(/^version:[[:space:]]*/,"");gsub(/["'\'']/,"");print;exit}')" || LATEST=""
  HERE=0; THERE=0
  for f in "$AGENTS_SRC"/*.md; do
    [ -e "$f" ] || continue
    HERE=$((HERE+1)); [ -e "$AGENTS_DEST/$(basename "$f")" ] && THERE=$((THERE+1))
  done
  echo "installed at $DEST/$NAME : ${INSTALLED}"
  echo "this checkout               : ${VER}"
  echo "github main                 : ${LATEST:-could not reach github}"
  echo "agents installed            : ${THERE} of ${HERE} at $AGENTS_DEST"
  echo
  if [ -L "$DEST/$NAME" ]; then
    echo "You are in LINK mode. 'git pull' in this repo updates you instantly."
  elif [ -n "$LATEST" ] && [ "$INSTALLED" != "$LATEST" ]; then
    echo "You are behind. Update with:  git pull && ./install.sh"
  elif [ -n "$LATEST" ]; then
    echo "Up to date."
  fi
  [ "$THERE" -lt "$HERE" ] && echo "Agents are missing or partial. Re-run ./install.sh to place them."
  exit 0
fi

echo "liftoff ${VER}  ->  $DEST/$NAME  (${MODE})"

# The agents ship in the skill folder but do not install with it, because agents and
# skills live in different directories. Name and filename are checked here rather than
# discovered later: an agent whose frontmatter name disagrees with its filename is the
# kind of thing you find out by wondering why /agents is one short.
AGENT_N=0
for f in "$AGENTS_SRC"/*.md; do
  [ -e "$f" ] || continue
  base="$(basename "$f")"; want="${base%.md}"; got="$(fname "$f")"
  if [ "$got" != "$want" ]; then
    echo "  ! $base declares name: ${got:-<none>}. Name and filename disagree; make them match before trusting /agents to list it."
  fi
  echo "  agent ${want}  ->  $AGENTS_DEST/$base"
  AGENT_N=$((AGENT_N+1))
done
[ $AGENT_N -eq 0 ] && echo "  ! no agent files at $AGENTS_SRC. The loop still runs; stages 2, 3 and 4 fall back to inline."

[ $DRY -eq 1 ] && { echo "(dry run, nothing written)"; exit 0; }

STAMP="$(date +%Y%m%d%H%M%S)"
# Backups go outside the live directories. Anything left under skills/ or agents/
# is loaded as a second live copy with a stale description, not a backup.
BAK_DIR="$(dirname "$DEST")/backups"
mkdir -p "$DEST"
if [ -e "$DEST/$NAME" ] || [ -L "$DEST/$NAME" ]; then
  if [ -L "$DEST/$NAME" ]; then
    rm "$DEST/$NAME"; echo "replaced existing symlink"
  else
    BAK="$BAK_DIR/$NAME.backup.$STAMP"
    mkdir -p "$BAK_DIR"
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

if [ $AGENT_N -gt 0 ]; then
  mkdir -p "$AGENTS_DEST"
  for f in "$AGENTS_SRC"/*.md; do
    [ -e "$f" ] || continue
    base="$(basename "$f")"; target="$AGENTS_DEST/$base"
    if [ -L "$target" ]; then
      rm "$target"
    elif [ -e "$target" ]; then
      mkdir -p "$BAK_DIR"
      mv "$target" "$BAK_DIR/$base.backup.$STAMP"; echo "previous $base moved to $BAK_DIR/$base.backup.$STAMP"
    fi
    if [ "$MODE" = link ]; then ln -s "$f" "$target"; else cp "$f" "$target"; fi
  done
  if [ "$MODE" = link ]; then echo "$AGENT_N agents symlinked into $AGENTS_DEST"
  else echo "$AGENT_N agents copied into $AGENTS_DEST"; fi
fi

echo
echo "Start a fresh session, then try:"
echo "  /liftoff design the pricing page. it should feel like confirming a decision you already made."
echo
echo "Then check three things, because each one fails quietly rather than loudly:"
echo "  1. /agents lists liftoff-runner, liftoff-evaluator and liftoff-persona"
echo "  2. a subagent can spawn subagents here. the tournament path needs it and it is environment-dependent"
echo "  3. the evaluator can render a screenshot. without one its verdict is UNVERIFIED, by design"
echo
echo "Next: ./skills/liftoff/scripts/doctor.sh"
