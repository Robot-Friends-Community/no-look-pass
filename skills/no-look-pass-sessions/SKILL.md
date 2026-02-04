---
name: no-look-pass-sessions
description: Create context handoff files when clearing context and resume seamlessly in new sessions. USE WHEN user says "alleyoop", "handoff", "pause", "context handoff", "save state", "slamdunk", "resume", "pick up where we left off", "continue from last session", or is about to clear context.
---

# No-Look Pass Sessions

Preserve and restore complete work state across Claude Code sessions.

## Overview

Creates `HANDOFF-ALLEYOOP.md` in project root containing:
- Current objective and progress
- Work completed and remaining
- Key decisions made
- Uncommitted changes
- Detected scaffolding state (GSD, task_plan.md, etc.)
- Specific next action to take

## Commands

- `/alleyoop` - Create handoff file before clearing context (toss the ball up)
- `/slamdunk` - Restore context and suggest next action (catch it and finish)

## Handoff Process

### 1. Detect Project Context

**Check for active scaffolding:**

```
GSD:              .planning/STATE.md exists?
Planning files:   task_plan.md exists?
Project log:      PROJECT_LOG.md exists?
```

**Check git state:**
```bash
git status --porcelain  # uncommitted changes
git log -1 --oneline    # last commit
```

### 2. Gather State

Collect from conversation and files:

| Category | Source |
|----------|--------|
| Objective | User's original request or task_plan.md goal |
| Completed | Session work, checked items, commits |
| Remaining | Unchecked items, stated next steps |
| Decisions | Key choices made with rationale |
| Blockers | Issues encountered, workarounds |
| Files | Modified but uncommitted paths |

**Ask user** if any critical context is unclear.

### 3. Write HANDOFF-ALLEYOOP.md

Write to project root using template structure:

```markdown
---
project: [project name]
timestamp: [ISO timestamp]
scaffolding: [gsd | planning-files | project-log | none]
---

# Session Handoff

## Objective
[What we're trying to accomplish]

## Progress
**Status:** [X]% complete | Phase Y of Z

### Completed
- [x] Item 1
- [x] Item 2

### Remaining
- [ ] Item 3
- [ ] Item 4

## Key Decisions
- **[Decision]**: [Rationale]

## Blockers
- [Blocker]: [Status/workaround]

## Uncommitted Changes
```
[git status output or "None"]
```

## Scaffolding State
[GSD phase info, task_plan status, etc.]

## Next Action
**Start with:** [Specific first action for next session]

## Context Notes
[Mental state, approach being taken, anything important]
```

### 4. Confirm

Display:
```
Handoff created: HANDOFF-ALLEYOOP.md

Summary:
- Objective: [brief]
- Progress: [X]% | [completed]/[total] items
- Next: [action]

To resume: /slamdunk
```

## Resume Process

### 1. Locate Handoff

Check in order:
1. `HANDOFF-ALLEYOOP.md` in current directory
2. `HANDOFF-ALLEYOOP.md` in git root
3. GSD: `.planning/phases/*/.continue-here.md`

If not found, offer to scan recent git history or start fresh.

### 2. Load Context

Read handoff file and parse:
- Objective and progress
- Remaining work
- Key decisions (preserve these)
- Blockers (may need addressing)
- Scaffolding state

### 3. Present Summary

```
Session Restored

Objective: [objective]
Progress: [X]% complete | [completed]/[total] items

Remaining:
- [ ] Item 1
- [ ] Item 2

Key Decisions Preserved:
- [Decision 1]
- [Decision 2]

Blockers: [None | list]
```

### 4. Suggest Next Action

Based on handoff content:

| Condition | Suggestion |
|-----------|------------|
| Blocker exists | Address blocker first |
| GSD phase active | Continue with /gsd:progress |
| Task plan exists | Continue next unchecked item |
| Otherwise | Start with "Next Action" from handoff |

Display:
```
Suggested next action: [specific action]

Ready to continue? [Y/n]
```

## Integration Points

### GSD Detection
If `.planning/STATE.md` exists:
- Include current phase and task number
- Reference `.continue-here.md` if present
- Suggest `/gsd:progress` on resume

### Planning Files Detection
If `task_plan.md` exists:
- Include current phase status
- Extract remaining items
- Reference notes.md if present

### Project Log Detection
If `PROJECT_LOG.md` exists:
- Include latest log entry
- Reference current status

## Best Practices

1. **Be specific** - Next action should be immediately actionable
2. **Preserve decisions** - Don't lose rationale for choices
3. **Note blockers** - Future you needs to know what's stuck
4. **Include file paths** - What files were being worked on
5. **Mental context** - The "why" behind the approach

## File Location

Always create `HANDOFF-ALLEYOOP.md` in project root (same level as `.git` if present).

Never create in user home directory or system folders.
