```
╔═[ NO-LOOK PASS  //  COMMUNITY EDITION ]════════════════════════════════════╗
║                                                                            ║
║        ███╗   ██╗ ██████╗       ██╗      ██████╗  ██████╗ ██╗  ██╗         ║
║        ████╗  ██║██╔═══██╗      ██║     ██╔═══██╗██╔═══██╗██║ ██╔╝         ║
║        ██╔██╗ ██║██║   ██║█████╗██║     ██║   ██║██║   ██║█████╔╝          ║
║        ██║╚██╗██║██║   ██║╚════╝██║     ██║   ██║██║   ██║██╔═██╗          ║
║        ██║ ╚████║╚██████╔╝      ███████╗╚██████╔╝╚██████╔╝██║  ██╗         ║
║        ╚═╝  ╚═══╝ ╚═════╝       ╚══════╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═╝         ║
║                                                                            ║
║                      ██████╗  █████╗ ███████╗███████╗                      ║
║                      ██╔══██╗██╔══██╗██╔════╝██╔════╝                      ║
║                      ██████╔╝███████║███████╗███████╗                      ║
║                      ██╔═══╝ ██╔══██║╚════██║╚════██║                      ║
║                      ██║     ██║  ██║███████║███████║                      ║
║                      ╚═╝     ╚═╝  ╚═╝╚══════╝╚══════╝                      ║
║                                                                            ║
╚═[ NO-LOOK PASS  //  COMMUNITY EDITION ]════════════════════════════════════╝
```

<div align="center">

**Context handoff for Claude Code. Never lose your work again.**

[![Claude Code](https://img.shields.io/badge/Claude-Code-blueviolet?style=for-the-badge)](https://claude.ai/code)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](LICENSE)
[![Community](https://img.shields.io/badge/Robot%20Friends-Community-orange?style=for-the-badge)](https://github.com/Robot-Friends-Community)

</div>

---

## What Is This?

A no-look pass in basketball: you throw the ball to a spot on the court without looking at your teammate. You trust they'll be there to catch it.

That's exactly what `/alleyoop` does. When your Claude Code context is getting full, you throw your entire work state — objective, progress, decisions, blockers, next action — into `HANDOFF-ALLEYOOP.md`. Clear context. Fresh session. Run `/slamdunk` and catch it right where you left off.

**v2 adds Instant Replay:** an optional game film log that accumulates across every session. Not just where you were — the full story of how you got there, what you decided and why, what patterns emerged. The kind of context that normally evaporates between sessions.

---

## Who Is This For?

| Audience | Use Case |
|----------|----------|
| Solo developers | Keep momentum across context resets without losing mental state |
| Builders on long projects | Maintain a running log of architectural decisions and pivots |
| Teams using Claude Code | Share context across collaborators with a structured handoff |
| Anyone using GSD or Planning Files | Seamless scaffolding integration — knows your workflow |
| Pattern hunters | Instant Replay's Patterns lens surfaces reusable workflows over time |

---

## 5-Minute Quickstart

### Requirements

- [Claude Code](https://claude.ai/code) installed and running
- That's it. No other dependencies.

### Install

**One-command install:**

```bash
# macOS / Linux
git clone https://github.com/Robot-Friends-Community/no-look-pass.git
cd no-look-pass && bash install.sh
```

```powershell
# Windows (PowerShell)
git clone https://github.com/Robot-Friends-Community/no-look-pass.git
cd no-look-pass; .\install.ps1
```

The script copies everything into your Claude Code config and confirms what was installed.

**Manual install:**

```bash
# macOS / Linux
mkdir -p ~/.claude/skills/no-look-pass/references ~/.claude/commands
cp SKILL.md ~/.claude/skills/no-look-pass/
cp references/*.md ~/.claude/skills/no-look-pass/references/
cp commands/alleyoop.md commands/slamdunk.md ~/.claude/commands/
```

```powershell
# Windows
$b = "$env:USERPROFILE\.claude"
New-Item -ItemType Directory -Force "$b\skills\no-look-pass\references","$b\commands" | Out-Null
Copy-Item SKILL.md "$b\skills\no-look-pass\"; Copy-Item references\*.md "$b\skills\no-look-pass\references\"
Copy-Item commands\alleyoop.md,commands\slamdunk.md "$b\commands\"
```

### First Use

> **Important:** Always run these commands from inside your project folder — the handoff file saves there.

1. `cd` into any project you're working on
2. Work until Claude Code context fills to around 50-60%
3. Run `/alleyoop`
4. Claude saves your full work state and asks: *"Want to enable Instant Replay? [Y/n/never]"* — answer once, never asked again for that project
5. Run `/clear` to reset context
6. Run `/slamdunk` — full context restored, next action ready

---

## What's Inside

| File | Description |
|------|-------------|
| `SKILL.md` | Skill definition — the brain of the operation |
| `commands/alleyoop.md` | `/alleyoop` command: create handoff + manage Instant Replay |
| `commands/slamdunk.md` | `/slamdunk` command: restore context and suggest next action |
| `references/HANDOFF.md` | Full alleyoop process spec (7 steps) |
| `references/INSTANT-REPLAY.md` | Instant Replay system: wizard, modes, lenses, entry format |
| `references/RESUME.md` | Full slamdunk process spec (6 steps) |
| `references/INTEGRATIONS.md` | GSD, planning files, Canon Keeper integration details |
| `templates/.instant-replay.yml` | Config template for Instant Replay setup |

---

## Real-World Use Cases

### Use Case 1: The Daily Handoff

You're 60% through adding a feature. Context is filling up.

```
You: /alleyoop

Claude: Handoff created: HANDOFF-ALLEYOOP.md

  Project: my-saas-app
  Objective: Add Stripe subscription billing
  Progress: 60% | 6/10 items complete
  Next: Wire up webhook handler for subscription.updated event

  No Instant Replay configured. Want to record the game film? [Y/n/never]

You: n

Claude: Skipped. Run /slamdunk to resume.
```

Next morning, fresh session:
```
You: /slamdunk

Claude: Session Restored

  Project: my-saas-app
  Handoff from: 2026-03-03T21:15Z

  Objective: Add Stripe subscription billing
  Progress: 60% complete | 6/10 items done

  Remaining:
  - [ ] Wire up webhook handler for subscription.updated
  - [ ] Add grace period logic for failed payments
  - [ ] Test with Stripe CLI test events
  - [ ] Update user portal to show billing status

  Suggested next action: Wire up webhook handler for subscription.updated event

  Ready to continue? [Y/n]
```

### Use Case 2: The Long-Haul Project with Instant Replay

Week 3 of a six-week build. You've set up Instant Replay with Technical + Journey + Patterns lenses on Auto mode.

Every `/alleyoop` silently appends an entry. By week 6, `INSTANT-REPLAY.md` has 15 entries — a complete build diary. Before your final architecture review, you run:

```
You: read INSTANT-REPLAY.md and summarize the key decisions and patterns

Claude: Here's what the tape shows...
  [Surfaces 3 architecture pivots, 2 reusable patterns, 1 decision you forgot you made]
```

### Use Case 3: The Debrief Session

You just resolved a gnarly 3-hour debugging session. Time to record it properly.

```
You: /alleyoop debrief

Claude: Let me run a film session before we save the handoff.

  I observed: You spent ~3 hours debugging a race condition in the
  session store. The root cause was the Redis TTL not accounting for
  timezone offset on the server.

  A few questions:
  1. Why did this take so long to surface? Any signs earlier you dismissed?
  2. How would you detect this pattern earlier next time?
  3. Is there a shared utility worth extracting here?

  [Records full debrief to INSTANT-REPLAY.md as a Film Session entry]
  [Creates HANDOFF-ALLEYOOP.md with next action]
```

### Use Case 4: GSD Integration

You're running a GSD project in `.planning/`. No-Look Pass reads your scaffolding state automatically.

```
You: /alleyoop

Claude: Handoff created: HANDOFF-ALLEYOOP.md

  GSD state: Milestone 2 | Phase 4.2 (Auth System) | Task 3 of 7
  Progress: 43% of phase complete
  Next: Continue with Phase 4.2 Task 4 — email verification flow

  Scaffolding State: GSD | M2 / Phase 4.2 / Task 3 complete

[Later...]

You: /slamdunk

Claude: Session Restored (GSD project)
  GSD is more recent than handoff — suggesting /gsd:progress
  or continue directly with Task 4 of Phase 4.2
```

### The Full Flow (ASCII)

```
                    ╔═════════════════════════════════════════════╗
                    ║            THE NO-LOOK PASS                 ║
                    ╚═════════════════════════════════════════════╝

 CONTEXT FULL                     CLEAR                      FRESH START
┌─────────────┐                ┌───────────┐                ┌─────────────┐
│   ██████    │                │           │                │   ░░░░░░    │
│   ██████    │  /alleyoop     │  /clear   │  /slamdunk     │   ░░░░░░    │
│   ██████    │ ─────────────> │           │ ─────────────> │   ░░░░░░    │
│   ██████    │  Toss it up!   │    [~]    │  Catch & slam! │   READY!    │
│   ██████    │                │           │                │             │
└─────────────┘                └───────────┘                └─────────────┘
       │                                                           │
       │  Creates                                       Restores   │
       │  HANDOFF-ALLEYOOP.md                          context     │
       │         │                                         │       │
       │         v                                         │       │
       │  ┌──────────────────────────────────┐             │       │
       │  │  HANDOFF-ALLEYOOP.md             │─────────────┘       │
       │  │  ├── Objective                   │                     │
       │  │  ├── Progress (done / left)      │                     │
       │  │  ├── Key decisions               │                     │
       │  │  ├── Blockers                    │                     │
       │  │  └── Next action                 │                     │
       │  └──────────────────────────────────┘                     │
       │                                                           │
       └───────────────────────────────────────────────────────────┘
                             Your work is SAFE


  Optional: INSTANT-REPLAY.md accumulates across all sessions

  Session 1         Session 2         Session 3         Session N
  [Game 1 entry] -> [Game 2 entry] -> [Game 3 entry] -> [Game N entry]
  └─────────────────────────────────────────────────────────────────┘
                      The complete project story
```

---

## How It Works

### The Alleyoop -> Clear -> Slamdunk Flow

```
CONTEXT METER
┌───────────────────────┐
│ ░░░░░░░░░░░░░░░░░░░░░ │  0-30%   Keep working!
│ ▓▓▓▓▓▓▓▓▓▓░░░░░░░░░░░ │  30-50%  Still good
│ ▓▓▓▓▓▓▓▓▓▓▓▓▓░░░░░░░░ │  50-60%  ** RUN /alleyoop NOW **
│ ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░░░░ │  70-80%  Danger zone
│ █████████████████████ │  90%+    Too late... context may be lost
└───────────────────────┘
```

**Step 1: /alleyoop**

Claude runs through 7 steps:
1. Finds the project root (git or pwd)
2. Detects scaffolding (GSD, task_plan.md, project log)
3. Reads git state — uncommitted changes, last commit
4. Reads scaffolding state — phase, progress, pending items
5. Gathers session context — objective, completed, remaining, decisions, blockers
6. Writes `HANDOFF-ALLEYOOP.md` to project root
7. Handles Instant Replay (append, prompt setup, or skip)

**Step 2: /clear**

Normal Claude Code context clear. The handoff file persists on disk.

**Step 3: /slamdunk**

Claude runs through 6 steps:
1. Locates `HANDOFF-ALLEYOOP.md` (current dir → git root → GSD fallback)
2. Parses all sections
3. Checks current git state vs. handoff timestamp
4. Presents full restoration summary
5. Suggests the specific next action
6. Offers cleanup: Delete / Keep / Archive

### Instant Replay Explained

The Instant Replay is a game film log — an `INSTANT-REPLAY.md` that grows with every session.

```
Without Instant Replay:               With Instant Replay:

Session 1 ─> handoff ─> GONE         Session 1 ─> handoff + Game 1 entry
Session 2 ─> handoff ─> GONE         Session 2 ─> handoff + Game 2 entry
Session 3 ─> handoff ─> GONE         Session 3 ─> handoff + Game 3 entry
                                                              │
                                       "What happened on     │
                                        this project?"       v
                                                        INSTANT-REPLAY.md
                                                        (complete story)
```

Three recording modes:

| Mode | Time cost | Best for |
|------|-----------|----------|
| Auto | 0 seconds | Daily sessions — extracted silently |
| Checkpoint | ~30 sec | Regular sessions — 2-3 quick questions |
| Film Session | ~2-3 min | Milestones, pivots, major breakthroughs |

Five capture lenses (mix and match):

| Lens | Captures |
|------|----------|
| Technical | Architecture decisions, tech choices, gotchas |
| Journey | Story arc, pivots, how this session fits the whole |
| Patterns | Reusable workflows, automation opportunities |
| Business | Timeline, features delivered, scope changes |
| Learning | Skills built, knowledge gaps, lessons learned |

---

## Installation

### Copy Method (Recommended)

**macOS / Linux:**
```bash
# Create directories
mkdir -p ~/.claude/skills/no-look-pass/references
mkdir -p ~/.claude/commands

# Copy files
cp SKILL.md ~/.claude/skills/no-look-pass/
cp references/*.md ~/.claude/skills/no-look-pass/references/
cp commands/alleyoop.md ~/.claude/commands/
cp commands/slamdunk.md ~/.claude/commands/
```

**Windows (PowerShell):**
```powershell
$base = "$env:USERPROFILE\.claude"
$skill = "$base\skills\no-look-pass"

# Create directories
New-Item -ItemType Directory -Force "$skill\references" | Out-Null
New-Item -ItemType Directory -Force "$base\commands" | Out-Null

# Copy files
Copy-Item SKILL.md $skill\
Copy-Item references\*.md "$skill\references\"
Copy-Item commands\alleyoop.md "$base\commands\"
Copy-Item commands\slamdunk.md "$base\commands\"
```

### Symlink Method (For Development)

**macOS / Linux:**
```bash
# From this repo directory
REPO=$(pwd)
mkdir -p ~/.claude/skills ~/.claude/commands

ln -sf "$REPO/SKILL.md" ~/.claude/skills/no-look-pass.md
ln -sf "$REPO/commands/alleyoop.md" ~/.claude/commands/alleyoop.md
ln -sf "$REPO/commands/slamdunk.md" ~/.claude/commands/slamdunk.md
```

**Windows (PowerShell — run as Administrator):**
```powershell
$repo = (Get-Location).Path
$base = "$env:USERPROFILE\.claude"

New-Item -ItemType SymbolicLink -Path "$base\commands\alleyoop.md" -Target "$repo\commands\alleyoop.md"
New-Item -ItemType SymbolicLink -Path "$base\commands\slamdunk.md" -Target "$repo\commands\slamdunk.md"
```

### Verify Installation

In Claude Code, run:
```
/alleyoop
```

You should see Claude start the handoff process.

---

## Deep Reference

### Command Reference

| Command | What it does |
|---------|-------------|
| `/alleyoop` | Standard handoff. Saves state, appends to Instant Replay if configured. |
| `/alleyoop debrief` | Handoff + structured film session interview before recording. |
| `/alleyoop init-replay` | Launch Instant Replay setup wizard without creating a handoff. |
| `/slamdunk` | Restore context from most recent handoff. Suggest next action. |

### Handoff File Format

`HANDOFF-ALLEYOOP.md` is written to the project root with this structure:

```markdown
---
project: [folder name]
timestamp: [ISO 8601]
scaffolding: [gsd | planning-files | project-log | none]
---

# Session Handoff

## Objective
## Progress
### Completed
### Remaining
## Key Decisions
## Blockers
## Uncommitted Changes
## Scaffolding State
## Next Action
## Context Notes
```

### Important: Stay in Your Project Folder

```
╔════════════════════════════════════════════════════════════════════╗
║  CRITICAL: You must be cd'd into your project folder!              ║
╠════════════════════════════════════════════════════════════════════╣
║                                                                    ║
║    The handoff file is created IN YOUR CURRENT DIRECTORY.          ║
║                                                                    ║
║    CORRECT:  cd ~/projects/my-app                                  ║
║              /alleyoop                                             ║
║                                                                    ║
║    WRONG:    cd ~                                                  ║
║              /alleyoop   <- Handoff goes to wrong place!           ║
║                                                                    ║
╚════════════════════════════════════════════════════════════════════╝
```

---

## Instant Replay

The Instant Replay is the headline new feature in v2. It turns every `/alleyoop` into a data point in a growing project log.

### Setup

Run `/alleyoop` in any project — you'll be prompted to configure Instant Replay. Or run `/alleyoop init-replay` to set it up directly.

The wizard takes 60 seconds:
1. Choose a default recording mode (Auto / Checkpoint / Film Session)
2. Pick your lenses (T / J / P / B / L — any combination)
3. Config saved to `.instant-replay.yml` in your project root

### How Entries Are Written

Every session appends a new `## Game [N]` entry:

```
# Instant Replay — my-saas-app

> Game film log. Each session appends an entry below.

**Created:** 2026-01-15
**Lenses:** Technical, Journey, Patterns
**Default mode:** Auto

---

## Game 1 | 2026-01-15T14:30Z | auto

**Objective:** Set up project scaffold and auth foundation
**Outcome:** Completed scaffold, started auth — got stuck on JWT strategy

### Technical
- Chose Next.js 15 App Router over Pages Router for future-proofing
- Supabase for auth — rejected Clerk (too expensive at scale)
- Encountered: JWT refresh token strategy needs decision

### Journey
- First session. Good momentum. Auth strategy is the first blocker.

### Patterns
- next-app-router + supabase-auth is a clean starting pattern
- **Distill candidate:** Yes

---

## Game 2 | 2026-01-16T10:15Z | checkpoint
...
```

### Debrief Auto-Suggestion

When significant events are detected, Claude will ask before recording:

```
Looks like a significant architecture pivot.
Run a film session instead of auto recording? [Y/n]
```

Triggers: architecture pivot, major blocker resolved, GSD phase complete,
feature milestone, first session on project, scope change.

### Reading the Tape

Pull up the replay any time:
```
You: read INSTANT-REPLAY.md and tell me what architectural decisions we've made

You: what patterns have emerged across sessions?

You: what was the context for the pivot we made in Game 4?
```

---

## Integrations

### GSD (.planning/)

No-Look Pass reads GSD state on both commands.

**On /alleyoop:** Includes current milestone, phase, task in the handoff.

**On /slamdunk:** Compares timestamps — if GSD's `.continue-here.md` is newer, suggests `/gsd:progress`. If the handoff is newer, uses it as primary.

### Planning with Files (task_plan.md)

**On /alleyoop:** Reads task_plan.md for phase status and checked/unchecked items.

**On /slamdunk:** References task_plan.md for remaining work, suggests next unchecked item.

### Canon Keeper (TOME.md)

The Tome and the Instant Replay coexist — different purposes:
- `TOME.md` — canon and lore consistency across docs/repos
- `INSTANT-REPLAY.md` — build journey, decisions, patterns

If both are detected, a note is added to the Instant Replay header to clarify the distinction.

---

## Contributing

Contributions welcome. See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

### What We're Looking For

- New scaffolding integrations (Jira, Linear, Notion task tracking)
- Additional capture lenses for Instant Replay
- Better detection heuristics for debrief auto-suggestion
- Community examples of game film entries worth sharing

---

## Repo Structure

```
no-look-pass/
├── .github/
│   ├── ISSUE_TEMPLATE/
│   │   ├── bug_report.yml
│   │   ├── feature_request.yml
│   │   └── contribution-type.yml
│   ├── CODEOWNERS
│   └── pull_request_template.md
├── commands/
│   ├── alleyoop.md         /alleyoop command
│   └── slamdunk.md         /slamdunk command
├── references/
│   ├── HANDOFF.md          Full alleyoop process spec
│   ├── INSTANT-REPLAY.md   Instant Replay system spec
│   ├── RESUME.md           Full slamdunk process spec
│   └── INTEGRATIONS.md     Integration details and best practices
├── templates/
│   └── .instant-replay.yml  Config template
├── SKILL.md                Skill definition (root level)
├── README.md               This file
├── CONTRIBUTING.md
├── CHANGELOG.md
├── CODE_OF_CONDUCT.md
├── SECURITY.md
└── LICENSE
```

---

## Ecosystem & License

### Related Projects

| Project | What it does |
|---------|-------------|
| [GSD](https://github.com/Robot-Friends-Community) | Phase-based project scaffolding with persistent state |
| [Flight Deck](https://github.com/Robot-Friends-Community) | Context handoff for project-level work (takeoff/landing) |
| [Canon Keeper](https://github.com/Robot-Friends-Community) | Lore/canon consistency across multi-repo projects |

### License

MIT — Use it, share it, modify it.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

---

<div align="center">

Made by the Robot Friends Community.

</div>
