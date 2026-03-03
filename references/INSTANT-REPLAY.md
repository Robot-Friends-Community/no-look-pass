# Instant Replay

The Instant Replay is an optional game film system that accumulates across sessions — capturing decisions, patterns, and the project journey in a running `INSTANT-REPLAY.md` log.

Every `/alleyoop` appends a new entry. Pull it up any time to understand what happened and why.

## First-Time Setup Wizard

The first time `/alleyoop` is run in a project without `.instant-replay.yml`, offer setup:

```
No Instant Replay configured for this project.
Want to record the game film? [Y/n/never]
```

- **Y** — continue to wizard
- **n** — skip this time, ask again next alleyoop
- **never** — create `.instant-replay.yml` with `enabled: false`, never ask again

You can also run `/alleyoop init-replay` to launch the wizard directly.

### Wizard Step 1: Recording Mode

```
Default recording mode:

  1. Auto       — Zero friction. Extracted silently from the session.
                  You won't even notice. (recommended)
  2. Checkpoint — 2-3 quick questions before recording. ~30 seconds.
  3. Film Session — Structured interview capturing your voice and reasoning.
                    Best for milestone moments. ~2-3 min.

You can always override per-session with /alleyoop debrief

Choose default [1/2/3]:
```

### Wizard Step 2: Lenses (multi-select)

```
What should the replay capture? Pick one or more:

  [T] Technical  — Architecture decisions, tech choices, implementation gotchas
  [J] Journey    — The story arc from idea to execution, pivots, eureka moments
  [P] Patterns   — Reusable workflows, techniques that worked, automation opportunities
  [B] Business   — Timeline, outcomes, metrics, ROI, resource usage
  [L] Learning   — What was learned, skills developed, knowledge gaps discovered

Enter letters (e.g., TJP for Technical + Journey + Patterns):
```

### Wizard Step 3: Confirm & Save

Save to `.instant-replay.yml` in project root:

```yaml
enabled: true
default_mode: auto          # auto | checkpoint | film-session
lenses:
  - technical
  - journey
  - patterns
created: [ISO timestamp]
session_count: 0
```

Display:
```
Instant Replay configured.
Lenses: Technical, Journey, Patterns
Default mode: Auto

Every /alleyoop will now append to INSTANT-REPLAY.md
Override anytime with /alleyoop debrief
```

---

## Recording Modes

### Auto Mode (zero friction)

Claude silently extracts from session context. No questions asked.

**What Auto captures per lens:**

| Lens | Auto-extracted from session |
|------|---------------------------|
| Technical | Files modified, tech decisions made, architecture changes, error resolutions |
| Journey | Objective for the session, what was attempted, pivots, how the session ended |
| Patterns | Repeated workflows, tool chains, approaches that could be reused |
| Business | Session duration (approx), features delivered, blockers that cost time |
| Learning | New concepts encountered, skills exercised, knowledge gaps |

### Checkpoint Mode (~30 seconds)

Same as Auto, plus 2-3 targeted questions based on active lenses.

**Example questions by lens:**

| Lens | Example questions |
|------|------------------|
| Technical | "You switched from X to Y — what drove that?" |
| Journey | "How does this session move the overall project forward?" |
| Patterns | "Would this approach work on other projects?" |
| Business | "Any scope changes or timeline impacts?" |
| Learning | "Anything you'd do differently?" |

### Film Session Mode (~2-3 minutes)

A structured interview capturing your voice and reasoning.

**Flow:**
1. **Session summary** — Claude presents what it observed, asks for corrections
2. **Lens-specific questions** — 1-2 questions per active lens
3. **Reflection** — "Anything important I might have missed?"
4. **Pattern flag** — "Did anything feel like a reusable workflow or skill?"

---

## Debrief Auto-Suggestion

When default mode is Auto or Checkpoint, Claude detects significant events and suggests escalating:

| Signal | Detection |
|--------|-----------|
| Architecture pivot | Tech stack change, major dependency swap, approach reversal |
| Major blocker resolved | Extended debugging session that reached resolution |
| GSD phase complete | `.planning/STATE.md` shows phase transition |
| Feature milestone | Significant functionality shipped or deployed |
| First session on project | No prior entries in `INSTANT-REPLAY.md` |
| Scope change | Objective shifted significantly |

**Suggestion format:**
```
Looks like a significant [event type].
Run a film session instead of auto recording? [Y/n]
```

One suggestion per session max.

---

## Entry Format

Each entry in `INSTANT-REPLAY.md` — only active lenses get sections:

```markdown
---

## Game [N] | YYYY-MM-DDTHH:MMZ | [mode: auto/checkpoint/film-session]

**Objective:** [What this session set out to do]
**Outcome:** [What actually happened]

### Technical
- [Architecture decisions, tech choices, files changed, gotchas]

### Journey
- [Where this fits in the overall build, pivots, momentum]

### Patterns
- [Reusable workflows, techniques, tool chains worth extracting]
- **Distill candidate:** [Yes/No]

### Business
- [Timeline impact, features delivered, scope changes]

### Learning
- [New knowledge, skills exercised, gaps discovered]
```

**Entry length:** Auto: 5-15 lines. Checkpoint: 10-25 lines. Film Session: 20-50 lines.

---

## File Header

Written once at creation:

```markdown
# Instant Replay — [Project Name]

> Game film log. Each session appends an entry below.
> Check the replay to understand what happened and why.

**Created:** [ISO date]
**Lenses:** [Technical, Journey, Patterns]
**Default mode:** [Auto]

---
```

---

## Scaffolding Detection

| Scaffolding | Detection | What to include |
|-------------|-----------|-----------------|
| GSD | `.planning/STATE.md` exists | Current phase, task number, phase transition events |
| Planning files | `task_plan.md` exists | Current phase status, completed items |
| Canon Keeper | `TOME.md` exists | Note both files, different purposes |
