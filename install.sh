#!/usr/bin/env bash
# Install liftoff into a Claude skills directory.
#   ./install.sh            -> ~/.claude/skills/  (all projects)
#   ./install.sh --project  -> ./.claude/skills/  (this project only)
#   ./install.sh --dry-run  -> print, change nothing
set -euo pipefail

DEST="${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}"
DRY=0
for a in "$@"; do
  case "$a" in
    --project) DEST="$(pwd)/.claude/skills" ;;
    --dry-run) DRY=1 ;;
    -h|--help) sed -n '2,6p' "$0"; exit 0 ;;
    *) echo "unknown flag: $a"; exit 1 ;;
  esac
done

SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/skills/liftoff"
[ -f "$SRC/SKILL.md" ] || { echo "Can't find skills/liftoff/SKILL.md next to this script."; exit 1; }

NAME="$(awk '/^---/{c++;next} c==1 && /^name:/{sub(/^name:[[:space:]]*/,"");gsub(/["'\'']/,"");print;exit}' "$SRC/SKILL.md")"
NAME="${NAME:-liftoff}"
VER="$(awk '/^---/{c++;next} c==1 && /^version:/{sub(/^version:[[:space:]]*/,"");print;exit}' "$SRC/SKILL.md")"

echo "liftoff ${VER:-?}  ->  $DEST/$NAME"
if [ $DRY -eq 1 ]; then echo "(dry run, nothing written)"; exit 0; fi

mkdir -p "$DEST"
if [ -d "$DEST/$NAME" ]; then
  BAK="$DEST/$NAME.backup.$(date +%Y%m%d%H%M%S)"
  mv "$DEST/$NAME" "$BAK"
  echo "existing install moved to $BAK"
fi
cp -R "$SRC" "$DEST/$NAME"
chmod +x "$DEST/$NAME/scripts/"*.sh 2>/dev/null || true
echo
echo "Installed. Start a fresh session, then try:"
echo "  /liftoff design the pricing page. it should feel like confirming a decision you already made."
echo
echo "Next: ./skills/liftoff/scripts/doctor.sh   (see what else is installed)"
