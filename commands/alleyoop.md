---
name: alleyoop
description: Create context handoff before clearing context. Toss the ball to your next session.
allowed-tools:
  - Read
  - Write
  - Bash
  - Glob
  - Grep
  - AskUserQuestion
---

<command-name>alleyoop</command-name>

<objective>
Create `HANDOFF-ALLEYOOP.md` in project root to preserve complete work state before clearing context.

Enables seamless resumption with `/slamdunk` in a fresh session.

Subcommands:
- `/alleyoop` — standard handoff + Instant Replay (if configured)
- `/alleyoop debrief` — handoff + full film session interview
- `/alleyoop init-replay` — launch Instant Replay setup wizard
</objective>

<execution_context>
@SKILL.md
@references/HANDOFF.md
@references/INSTANT-REPLAY.md
</execution_context>

<process>

<step name="check-subcommand">
Check if a subcommand was passed:
- `debrief` → force Film Session mode for Instant Replay
- `init-replay` → jump directly to Instant Replay setup wizard (skip normal handoff)
- (none) → standard flow
</step>

<step name="locate-project">
Find project root:
```bash
git rev-parse --show-toplevel 2>/dev/null || pwd
```
</step>

<step name="detect-context">
Check for scaffolding and Instant Replay config per HANDOFF.md Step 1.
</step>

<step name="gather-state">
Gather git state, scaffolding state, and session context per HANDOFF.md Steps 2-4.
</step>

<step name="write-handoff">
Write HANDOFF-ALLEYOOP.md per HANDOFF.md Step 5 template.
</step>

<step name="handle-instant-replay">
Handle Instant Replay per HANDOFF.md Step 6 and full INSTANT-REPLAY.md spec.
</step>

<step name="confirm">
Display confirmation per HANDOFF.md Step 7.
</step>

</process>

<success_criteria>
- [ ] HANDOFF-ALLEYOOP.md created in project root
- [ ] All sections filled with specific content
- [ ] Next action is immediately actionable
- [ ] Instant Replay updated or skipped intentionally
- [ ] User knows how to resume with /slamdunk
</success_criteria>
