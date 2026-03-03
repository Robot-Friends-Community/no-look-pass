# Resume Process (/slamdunk)

Full process for restoring context from a handoff file.

## Step 1: Locate Handoff

Check in order:
1. `HANDOFF-ALLEYOOP.md` in current directory
2. `HANDOFF-ALLEYOOP.md` in git root
3. GSD: `.planning/phases/*/.continue-here.md` (most recent)

```bash
test -f HANDOFF-ALLEYOOP.md && echo "found"
GIT_ROOT=$(git rev-parse --show-toplevel 2>/dev/null)
test -f "$GIT_ROOT/HANDOFF-ALLEYOOP.md" && echo "found:$GIT_ROOT"
ls -t .planning/phases/*/.continue-here.md 2>/dev/null | head -1
```

**If not found:**
- Ask user if they want to start fresh or look elsewhere
- Offer to check recent git history for clues

## Step 2: Read and Parse

Extract from handoff file:
- `project` and `timestamp`
- `scaffolding` type
- Objective
- Progress (percent, completed/remaining items)
- Key decisions
- Blockers
- Next action
- Context notes

## Step 3: Check Current State

```bash
git status --porcelain 2>/dev/null
git log -1 --oneline 2>/dev/null
```

Note any changes since the handoff was created.

## Step 4: Present Restoration Summary

```
Session Restored

Project: [name]
Handoff from: [timestamp]

Objective: [objective]

Progress: [X]% complete | [completed]/[total] items

Remaining:
- [ ] [Item 1]
- [ ] [Item 2]

Key Decisions Preserved:
- [Decision 1]

Blockers: [None | list]

[If changes since handoff:]
Changes since handoff:
- [commits, file changes]
```

## Step 5: Suggest Next Action

| Condition | Suggestion |
|-----------|------------|
| Blocker exists | "Address blocker first: [blocker]" |
| GSD active | "Continue with `/gsd:progress`" |
| task_plan.md exists | "Continue next item in task_plan.md" |
| Next action in handoff | Use it directly |
| Otherwise | "Review remaining items and continue" |

```
Suggested next action:
[specific action]

Ready to continue? [Y/n]
```

## Step 6: Cleanup Option

After confirming continuation:
```
Delete handoff file? (it's served its purpose)
  [D] Delete  [K] Keep  [A] Archive to .handoff-archive/
```

Default: Delete (recommended — handoff files are single-use).

## GSD Integration

**If GSD is detected (.planning/ exists):**

If `.continue-here.md` is more recent than `HANDOFF-ALLEYOOP.md`:
- Show GSD state summary
- Suggest `/gsd:resume-work` or `/gsd:progress`

If `HANDOFF-ALLEYOOP.md` is more recent:
- Use it as primary
- Include GSD phase info in summary
