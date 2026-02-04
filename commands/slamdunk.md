---
name: slamdunk
description: Resume work from previous session handoff (catch the alley-oop and slam it home)
allowed-tools:
  - Read
  - Bash
  - Glob
  - Grep
  - AskUserQuestion
  - Skill
---

<command-name>slamdunk</command-name>

<objective>
Restore complete project context from `HANDOFF-ALLEYOOP.md` and suggest the next action to continue work.
</objective>

<execution_context>
@C:\Users\User\.claude\skills\no-look-pass-sessions\SKILL.md
</execution_context>

<process>

<step name="locate-handoff">
**Find handoff file in priority order:**

1. `HANDOFF-ALLEYOOP.md` in current directory
2. `HANDOFF-ALLEYOOP.md` in git root
3. GSD: `.planning/phases/*/.continue-here.md` (most recent)

```bash
# Check current dir
test -f HANDOFF-ALLEYOOP.md && echo "found:HANDOFF-ALLEYOOP.md"

# Check git root
GIT_ROOT=$(git rev-parse --show-toplevel 2>/dev/null)
test -f "$GIT_ROOT/HANDOFF-ALLEYOOP.md" && echo "found:$GIT_ROOT/HANDOFF-ALLEYOOP.md"

# Check for GSD continue files
ls -t .planning/phases/*/.continue-here.md 2>/dev/null | head -1
```

**If not found:**
- Ask user if they want to start fresh or look elsewhere
- Offer to check recent projects in `C:\Dev\_PROJECTS\`
</step>

<step name="read-handoff">
**Parse handoff file:**

Extract:
- `project` - Project name
- `timestamp` - When handoff was created
- `scaffolding` - Active scaffolding type
- Objective
- Progress (percent, completed/remaining items)
- Key decisions
- Blockers
- Next action
- Context notes
</step>

<step name="check-current-state">
**Verify state hasn't changed:**

```bash
git status --porcelain 2>/dev/null
git log -1 --oneline 2>/dev/null
```

If significant changes since handoff, note them.
</step>

<step name="present-summary">
**Display restoration summary:**

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
- [Decision 2]

Blockers: [None | list with status]

[If changes since handoff:]
Changes since handoff:
- [new commits, file changes, etc.]
```
</step>

<step name="suggest-next-action">
**Determine suggested action based on context:**

| Condition | Suggestion |
|-----------|------------|
| Blocker exists | "Address blocker: [blocker]" |
| GSD scaffolding | "Continue with `/gsd:progress`" |
| task_plan.md exists | "Continue with next item in task_plan.md" |
| Next action specified | Use the "Next Action" from handoff |
| Otherwise | "Review remaining items and continue" |

**Display:**

```
Suggested next action:
[specific action]

Ready to continue? [Y/n]
```

If user confirms, proceed with the suggested action.
If user declines, ask what they'd like to do instead.
</step>

<step name="cleanup-option">
**After confirming continuation:**

Ask if user wants to delete or archive the handoff:
- Delete `HANDOFF-ALLEYOOP.md` (work is resuming)
- Keep it (for reference)
- Archive to `.handoff-archive/` with timestamp

Default: Delete after successful resume (it's served its purpose).
</step>

</process>

<gsd-integration>
**If GSD is detected (.planning/ exists):**

Prefer GSD's native resume if `.continue-here.md` is more recent:
- Show GSD state summary
- Suggest `/gsd:resume-work` or `/gsd:progress`
- Note that GSD has its own detailed phase tracking

**If HANDOFF-ALLEYOOP.md is more recent:**
- Use HANDOFF-ALLEYOOP.md as primary
- Include GSD phase info in summary
</gsd-integration>

<success_criteria>
- [ ] Handoff file located and parsed
- [ ] Complete context restored
- [ ] User understands current state
- [ ] Specific next action suggested
- [ ] User ready to continue
</success_criteria>
