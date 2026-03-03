#!/usr/bin/env bash
# No-Look Pass — Install Script (macOS / Linux)
# Usage: bash install.sh

set -e

CLAUDE_DIR="${CLAUDE_DIR:-$HOME/.claude}"
SKILL_DEST="$CLAUDE_DIR/skills/no-look-pass"
CMD_DEST="$CLAUDE_DIR/commands"

echo ""
echo "No-Look Pass — Installer"
echo "========================"
echo ""

# Check for Claude Code
if [ ! -d "$CLAUDE_DIR" ]; then
  echo "ERROR: Claude Code config directory not found at $CLAUDE_DIR"
  echo "       Make sure Claude Code is installed: https://claude.ai/code"
  exit 1
fi

# Create directories
mkdir -p "$SKILL_DEST/references"
mkdir -p "$CMD_DEST"

# Copy skill files
cp SKILL.md "$SKILL_DEST/"
cp references/*.md "$SKILL_DEST/references/"
cp commands/alleyoop.md "$CMD_DEST/"
cp commands/slamdunk.md "$CMD_DEST/"

echo "Installed:"
echo "  $SKILL_DEST/SKILL.md"
echo "  $SKILL_DEST/references/*.md"
echo "  $CMD_DEST/alleyoop.md"
echo "  $CMD_DEST/slamdunk.md"
echo ""
echo "Done! Open Claude Code in any project folder and run:"
echo "  /alleyoop"
echo ""
