# Handoff Process (/alleyoop)

Full process for creating a session handoff before clearing context.

## Subcommands

- `/alleyoop` — Standard handoff + auto Instant Replay append (if configured)
- `/alleyoop debrief` — Handoff + full debrief interview for the Instant Replay
- `/alleyoop init-replay` — Launch the Instant Replay setup wizard

## Step 1: Detect Project Context

**Find project root:**
```bash
git rev-parse --show-toplevel 2>/dev/null || pwd
```

**Check for active scaffolding:**
```bash
test -f .planning/STATE.md && echo "gsd"
test -f task_plan.md && echo "planning-files"
test -f PROJECT_LOG.md && echo "project-log"
```

**Check Instant Replay config:**
```bash
test -f .instant-replay.yml && echo "replay-configured"
```

## Step 2: Gather Git State

```bash
git status --porcelain 2>/dev/null || echo "Not a git repo"
git log -1 --oneline 2>/dev/null || echo "No commits"
```

## Step 3: Gather Scaffolding State

**If GSD detected:**
- Read `.planning/STATE.md` for current phase/task
- Check for `.planning/phases/*/.continue-here.md`

**If planning-files detected:**
- Read `task_plan.md` for current status
- Note checked/unchecked items

**If project-log detected:**
- Read latest entry from `PROJECT_LOG.md`

## Step 4: Gather Session Context

Collect from current session:

1. **Objective** — What are we trying to accomplish?
2. **Completed** — What got done this session?
3. **Remaining** — What's left to do?
4. **Decisions** — Key choices made and why?
5. **Blockers** — Anything stuck or problematic?
6. **Next action** — Specific first thing to do when resuming?

**If any of these are unclear**, ask the user to clarify.

## Step 5: Write HANDOFF-ALLEYOOP.md

Write to project root:

```markdown
---
project: [folder name]
timestamp: [ISO 8601]
scaffolding: [gsd | planning-files | project-log | none]
---

# Session Handoff

## Objective
[What we're trying to accomplish]

## Progress
**Status:** [X]% complete | [phase info if applicable]

### Completed
- [x] [Item 1]

### Remaining
- [ ] [Item 2]

## Key Decisions
- **[Decision]**: [Rationale]

## Blockers
[None | list with status]

## Uncommitted Changes
```
[git status output]
```

## Scaffolding State
[GSD: Phase X, Task Y | Planning: Phase 2 of 4 | None]

## Next Action
**Start with:** [Specific, actionable first step]

## Context Notes
[Mental state, approach, anything the next session needs to know]
```

## Step 6: Instant Replay Append

**If `.instant-replay.yml` exists and `enabled: true`:**

Read the config, determine recording mode, then:

- **Auto mode:** Silently extract session data per active lenses, append entry to `INSTANT-REPLAY.md`
- **Checkpoint mode:** Ask 2-3 quick questions, then append
- **Debrief mode (or `/alleyoop debrief`):** Run full interview, then append

See [INSTANT-REPLAY.md](INSTANT-REPLAY.md) for full recording logic.

**If `.instant-replay.yml` does not exist:**

First time running in a project, offer setup:
```
No Instant Replay configured for this project.
Want to record the game film? [Y/n/never]
```
- Y → run setup wizard (see INSTANT-REPLAY.md)
- n → skip this time, ask again next alleyoop
- never → write `.instant-replay.yml` with `enabled: false`

## Step 7: Confirm

```
Handoff created: HANDOFF-ALLEYOOP.md

Summary:
- Project: [name]
- Objective: [brief]
- Progress: [X]% | [completed]/[total] items
- Next: [action]
[If replay recorded: Instant Replay updated: INSTANT-REPLAY.md (Session N)]

To resume in new session: /slamdunk
```
