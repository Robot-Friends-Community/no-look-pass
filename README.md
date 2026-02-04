# No-Look Pass Sessions

Context handoff system for Claude Code sessions. Save your work state before clearing context, then seamlessly resume in a fresh session.

## The Play

```
/alleyoop  →  [clear context]  →  /slamdunk
   ↓                                  ↓
Creates HANDOFF-ALLEYOOP.md     Restores context & suggests next action
```

## Installation

### Option 1: Copy to .claude folder

```bash
# Copy skill
cp -r skills/no-look-pass-sessions ~/.claude/skills/

# Copy commands
cp commands/alleyoop.md ~/.claude/commands/
cp commands/slamdunk.md ~/.claude/commands/
```

### Option 2: Symlink (for development)

```bash
# From this repo directory
ln -s "$(pwd)/skills/no-look-pass-sessions" ~/.claude/skills/no-look-pass-sessions
ln -s "$(pwd)/commands/alleyoop.md" ~/.claude/commands/alleyoop.md
ln -s "$(pwd)/commands/slamdunk.md" ~/.claude/commands/slamdunk.md
```

## Usage

### Before Clearing Context

```
/alleyoop
```

This creates `HANDOFF-ALLEYOOP.md` in your project root containing:
- Current objective and progress
- Work completed and remaining
- Key decisions made (with rationale)
- Uncommitted changes
- Scaffolding state (GSD, task_plan.md, etc.)
- Specific next action

### After Clearing Context

```
/slamdunk
```

This reads the handoff file and:
- Displays a restoration summary
- Shows remaining work
- Preserves key decisions
- Suggests the specific next action
- Offers to delete the handoff after successful resume

## What Gets Captured

| Category | Source |
|----------|--------|
| Objective | User's request or task_plan.md goal |
| Completed | Session work, checked items, commits |
| Remaining | Unchecked items, stated next steps |
| Decisions | Key choices made with rationale |
| Blockers | Issues encountered, workarounds |
| Files | Modified but uncommitted paths |

## Scaffolding Integration

Automatically detects and includes state from:

- **GSD** (`.planning/STATE.md`) - Current phase and task
- **Planning with Files** (`task_plan.md`) - Current phase status
- **Project Log** (`PROJECT_LOG.md`) - Latest entry

When GSD is active, `/slamdunk` will suggest `/gsd:progress` as the next action.

## File Structure

```
no-look-pass-sessions/
├── README.md
├── skills/
│   └── no-look-pass-sessions/
│       ├── SKILL.md
│       └── templates/
│           └── HANDOFF.template.md
└── commands/
    ├── alleyoop.md
    └── slamdunk.md
```

## Why "No-Look Pass"?

Like a no-look pass in basketball, you're throwing context to your future self without seeing where it lands. The `/alleyoop` sets up the play, and `/slamdunk` finishes it.

## Requirements

- Claude Code CLI
- Works with any project structure
- Enhanced integration with GSD workflow

## License

MIT
