---
name: slamdunk
description: Resume work from previous session handoff. Catch the alley-oop and finish the play.
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
@SKILL.md
@references/RESUME.md
</execution_context>

<process>

<step name="locate-handoff">
Locate handoff file per RESUME.md Step 1.
</step>

<step name="read-handoff">
Parse handoff file per RESUME.md Step 2.
</step>

<step name="check-current-state">
Verify current git state per RESUME.md Step 3.
</step>

<step name="present-summary">
Display restoration summary per RESUME.md Step 4.
</step>

<step name="suggest-next-action">
Determine and suggest next action per RESUME.md Step 5.
</step>

<step name="cleanup-option">
Offer cleanup per RESUME.md Step 6.
</step>

</process>

<success_criteria>
- [ ] Handoff file located and parsed
- [ ] Complete context restored
- [ ] User understands current state
- [ ] Specific next action suggested
- [ ] User ready to continue
</success_criteria>
