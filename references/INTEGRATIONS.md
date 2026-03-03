# Integrations & Best Practices

## Scaffolding Integrations

### GSD (.planning/)

**Detection:** `.planning/STATE.md` exists

**On /alleyoop:**
- Read current phase and task number from STATE.md
- Check for `.continue-here.md` in active phase folder
- Include in handoff Scaffolding State section

**On /slamdunk:**
- Compare handoff timestamp vs `.continue-here.md` timestamp
- If GSD is more recent, suggest `/gsd:progress` or `/gsd:resume-work`
- If handoff is more recent, use handoff as primary

### Planning with Files (task_plan.md)

**Detection:** `task_plan.md` exists

**On /alleyoop:**
- Read current phase status and checked/unchecked items
- Include remaining items in handoff

**On /slamdunk:**
- Reference task_plan.md for remaining work
- Suggest continuing next unchecked item

### Canon Keeper (TOME.md)

**Detection:** `TOME.md` exists

The Instant Replay and Canon Keeper serve different purposes and coexist:
- `TOME.md` — canon/lore consistency across docs and repos
- `INSTANT-REPLAY.md` — build journey log, decisions, patterns

Add to INSTANT-REPLAY.md header if Canon Keeper is detected:
```markdown
> **Note:** This project also has a Canon Keeper (TOME.md).
> The Tome tracks canon consistency. This replay tracks the build journey.
```

---

## Best Practices

### For /alleyoop

1. **Run at 50-60% context** — enough buffer for Claude to write a quality handoff
2. **Be specific with Next Action** — "implement password reset flow" not "continue"
3. **Preserve decisions** — capture the *why*, not just the *what*
4. **Note blockers** — future you needs to know what's stuck
5. **Include file paths** — what was actively being worked on

### For Instant Replay

1. **Auto mode for daily work** — zero friction, still valuable over time
2. **Film Session for milestones** — phase completions, major pivots, launches
3. **Patterns lens is gold** — these become skills and automation opportunities
4. **Read it before big decisions** — the tape reveals patterns you forgot

### File Location

Always create `HANDOFF-ALLEYOOP.md` in the project root (same level as `.git` if present).

Never create in the user home directory or system folders.

The `.instant-replay.yml` config lives in the project root alongside the handoff.
