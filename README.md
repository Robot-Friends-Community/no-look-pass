```
    _   __        __                __      ____
   / | / /___    / /   ____  ____  / /__   / __ \____ ___________
  /  |/ / __ \  / /   / __ \/ __ \/ //_/  / /_/ / __ `/ ___/ ___/
 / /|  / /_/ / / /___/ /_/ / /_/ / ,<    / ____/ /_/ (__  |__  )
/_/ |_/\____/ /_____/\____/\____/_/|_|  /_/    \__,_/____/____/

     _____ __________ _____ ________  _   _______
    / ___// ____/ ___// ___//  _/ __ \/ | / / ___/
    \__ \/ __/  \__ \ \__ \ / // / / /  |/ /\__ \
   ___/ / /___ ___/ /___/ // // /_/ / /|  /___/ /
  /____/_____//____//____/___/\____/_/ |_//____/
```

<div align="center">

**Context handoff for Claude Code. Never lose your work again.**

[![Claude Code](https://img.shields.io/badge/Claude-Code-blueviolet?style=for-the-badge)](https://claude.ai/code)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](https://opensource.org/licenses/MIT)

</div>

---

## 🏀 The Play

Like a no-look pass in basketball, you're throwing context to your future self without seeing where it lands.

```
                       ╔═════════════════════════════════════════════╗
                       ║            THE NO-LOOK PASS                 ║
                       ╚═════════════════════════════════════════════╝

  CONTEXT FULL                      CLEAR                       FRESH START
 ┌─────────────┐                ┌───────────┐                 ┌─────────────┐
 │   ██████    │                │           │                 │   ░░░░░░    │
 │   ██████    │  /alleyoop     │  /clear   │   /slamdunk     │   ░░░░░░    │
 │   ██████    │ ─────────────► │           │ ──────────────► │   ░░░░░░    │
 │   ██████    │  Toss it up!   │    🧹     │  Catch & slam!  │   READY!    │
 │   ██████    │                │           │                 │             │
 └─────────────┘                └───────────┘                 └─────────────┘
        │                                                            │
        │  Creates                                        Restores   │
        │  HANDOFF-ALLEYOOP.md                           context     │
        │         │                                          │       │
        │         ▼                                          │       │
        │    ┌───────────────────────────────────┐           │       │
        │    │  HANDOFF-ALLEYOOP.md              │───────────┘       │
        │    │  ├── Objective                    │                   │
        │    │  ├── Progress (what's done)       │                   │
        │    │  ├── Remaining (what's left)      │                   │
        │    │  ├── Key decisions                │                   │
        │    │  └── Next action                  │                   │
        │    └───────────────────────────────────┘                   │
        │                                                            │
        └────────────────────────────────────────────────────────────┘
                              Your work is SAFE
```

---

## 📍 Important: Stay in Your Project Folder!

```
  ╔════════════════════════════════════════════════════════════════════╗
  ║  ⚠️  CRITICAL: You must be cd'd into your project folder!          ║
  ╠════════════════════════════════════════════════════════════════════╣
  ║                                                                    ║
  ║    The handoff file is created IN YOUR CURRENT DIRECTORY.          ║
  ║                                                                    ║
  ║    ✅  cd ~/projects/my-awesome-app                                ║
  ║        /alleyoop                                                   ║
  ║                                                                    ║
  ║    ❌  cd ~                                                        ║
  ║        /alleyoop    ← Handoff goes to wrong place!                 ║
  ║                                                                    ║
  ╚════════════════════════════════════════════════════════════════════╝
```

---

## 🎯 When to Use It

```
           CONTEXT METER
    ┌───────────────────────┐
    │ ░░░░░░░░░░░░░░░░░░░░░ │  0-30%   Keep working!
    │ ▓▓▓▓▓▓▓▓▓▓░░░░░░░░░░░ │  30-50%  Still good
    │ ▓▓▓▓▓▓▓▓▓▓▓▓▓░░░░░░░░ │  50-60%  ⚡ RUN /alleyoop NOW! ⚡
    │ ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░░░░ │  70-80%  Danger zone
    │ █████████████████████ │  90%+   Too late... context may be lost
    └───────────────────────┘

    💡 TIP: Run /alleyoop at 50-60% context usage for the cleanest handoff!
```

---

## 📖 Step-by-Step Guide

### Step 1: Work on Your Project
```
┌──────────────────────────────────────────────────────────────────────┐
│ $ cd ~/projects/my-awesome-app                                       │
│                                                                      │
│ You: "Help me build a user authentication system"                    │
│ Claude: [works on your code, makes progress...]                      │
│                                                                      │
│ ... time passes, context fills up ...                                │
│                                                                      │
│ [Context: ▓▓▓▓▓▓▓▓▓▓▓▓░░░░░░░ 55%]                                   │
└──────────────────────────────────────────────────────────────────────┘
```

### Step 2: Toss the Alley-Oop 🏀
```
┌──────────────────────────────────────────────────────────────────────┐
│ You: /alleyoop                                                       │
│                                                                      │
│ Claude: "Handoff created: HANDOFF-ALLEYOOP.md"                       │
│                                                                      │
│         Summary:                                                     │
│         - Objective: Build user authentication system                │
│         - Progress: 65% | 8/12 items complete                        │
│         - Next: Implement password reset flow                        │
│                                                                      │
│         To resume: /slamdunk                                         │
└──────────────────────────────────────────────────────────────────────┘
```

### Step 3: Clear the Court
```
┌──────────────────────────────────────────────────────────────────────┐
│ You: /clear                                                          │
│                                                                      │
│ [Context cleared - fresh start!]                                     │
│                                                                      │
│ [Context: ░░░░░░░░░░░░░░░░░░░ 0%]                                     │
└──────────────────────────────────────────────────────────────────────┘
```

### Step 4: Slam Dunk! 🏆
```
┌──────────────────────────────────────────────────────────────────────┐
│ You: /slamdunk                                                       │
│                                                                      │
│ Claude: "Session Restored!"                                          │
│                                                                      │
│         Project: my-awesome-app                                      │
│         Objective: Build user authentication system                  │
│         Progress: 65% complete | 8/12 items done                     │
│                                                                      │
│         Remaining:                                                   │
│         - [ ] Implement password reset flow                          │
│         - [ ] Add email verification                                 │
│         - [ ] Write tests                                            │
│         - [ ] Update documentation                                   │
│                                                                      │
│         Suggested next action: Implement password reset flow         │
│                                                                      │
│         Ready to continue? [Y/n]                                     │
└──────────────────────────────────────────────────────────────────────┘
```

---

## 🛠️ Installation

### Quick Install (Copy)

```bash
# Copy skill
cp -r skills/no-look-pass-sessions ~/.claude/skills/

# Copy commands
cp commands/alleyoop.md ~/.claude/commands/
cp commands/slamdunk.md ~/.claude/commands/
```

### Dev Install (Symlink)

```bash
# From this repo directory
ln -s "$(pwd)/skills/no-look-pass-sessions" ~/.claude/skills/no-look-pass-sessions
ln -s "$(pwd)/commands/alleyoop.md" ~/.claude/commands/alleyoop.md
ln -s "$(pwd)/commands/slamdunk.md" ~/.claude/commands/slamdunk.md
```

### Windows Installation

```powershell
# Copy skill
Copy-Item -Recurse skills\no-look-pass-sessions $env:USERPROFILE\.claude\skills\

# Copy commands
Copy-Item commands\alleyoop.md $env:USERPROFILE\.claude\commands\
Copy-Item commands\slamdunk.md $env:USERPROFILE\.claude\commands\
```

---

## 📦 What Gets Saved

```
╔═══════════════════════════════════════════════════════════════╗
║                   HANDOFF-ALLEYOOP.md                         ║
╠═══════════════════════════════════════════════════════════════╣
║                                                               ║
║  📎 METADATA                                                  ║
║     project: my-awesome-app                                   ║
║     timestamp: 2025-02-04T12:15:00                            ║
║                                                               ║
║  🎯 OBJECTIVE                                                 ║
║     What you're trying to accomplish                          ║
║                                                               ║
║  📊 PROGRESS                                                  ║
║     ✅ Completed items                                        ║
║     ⬜ Remaining items                                        ║
║                                                               ║
║  🧠 KEY DECISIONS                                             ║
║     Why you chose certain approaches                          ║
║                                                               ║
║  🚧 BLOCKERS                                                  ║
║     Issues encountered and workarounds                        ║
║                                                               ║
║  📝 UNCOMMITTED CHANGES                                       ║
║     Files modified but not yet committed                      ║
║                                                               ║
║  ➡️  NEXT ACTION                                              ║
║     Specific first step for next session                      ║
║                                                               ║
╚═══════════════════════════════════════════════════════════════╝
```

---

## 🔌 Integrations

Works seamlessly with these scaffolding systems:

| System | Detection | Resume Suggestion |
|--------|-----------|-------------------|
| **GSD** | `.planning/STATE.md` | `/gsd:progress` |
| **Planning with Files** | `task_plan.md` | Continue next item |
| **Project Log** | `PROJECT_LOG.md` | Reference latest entry |

---

## 📁 File Structure

```
no-look-pass-sessions/
├── 📄 README.md              ← You are here
├── 📄 CONTRIBUTING.md
├── 📄 CHANGELOG.md
├── 📂 skills/
│   └── 📂 no-look-pass-sessions/
│       └── 📄 SKILL.md       ← Skill definition
└── 📂 commands/
    ├── 📄 alleyoop.md        ← /alleyoop command
    └── 📄 slamdunk.md        ← /slamdunk command
```

---

## 🏀 The Basketball Metaphor

```
                                      🏀
                                     ╱
                                    ╱
                                   ╱  "ALLEY-OOP!"
                                  ╱
     ┌───────────┐              ╱
     │           │            ╱
     │    YOU    │ ─────────╱
     │    NOW    │
     │           │
     └───────────┘
                                                          ╲
     Context is full...                                    ╲
     Toss it to your                                        ╲  "SLAM DUNK!"
     future self!                                            ╲
                                                              ╲    🏀
                                                         ┌───────────┐
                                                         │           │
                                                         │    YOU    │
                                                         │   LATER   │
                                                         │           │
                                                         └───────────┘

                                                         Fresh context,
                                                         full memory of
                                                         where you left off!
```

---

## ❓ FAQ

<details>
<summary><b>What if I forget to run /alleyoop before clearing?</b></summary>

Your context is gone. 😢 That's why we recommend running it at 50-60% usage — plenty of buffer!

</details>

<details>
<summary><b>Can I have multiple handoff files?</b></summary>

Each `/alleyoop` overwrites the previous `HANDOFF-ALLEYOOP.md` in that directory. One handoff per project at a time.

</details>

<details>
<summary><b>Does it auto-commit the handoff file?</b></summary>

No! The handoff file is left uncommitted so you can decide what to do with it. Most people delete it after resuming.

</details>

<details>
<summary><b>What if I switch projects between sessions?</b></summary>

Just `cd` to the right project folder before running `/slamdunk`. The handoff file lives in each project root.

</details>

---

## 🤝 Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

---

## 📜 License

MIT — Use it, share it, modify it!

---

<div align="center">

```
 ███████╗████████╗ █████╗ ██╗   ██╗
 ██╔════╝╚══██╔══╝██╔══██╗╚██╗ ██╔╝
 ███████╗   ██║   ███████║ ╚████╔╝
 ╚════██║   ██║   ██╔══██║  ╚██╔╝
 ███████║   ██║   ██║  ██║   ██║
 ╚══════╝   ╚═╝   ╚═╝  ╚═╝   ╚═╝

 ███████╗████████╗ █████╗  ██████╗██╗  ██╗███████╗██████╗
 ██╔════╝╚══██╔══╝██╔══██╗██╔════╝██║ ██╔╝██╔════╝██╔══██╗
 ███████╗   ██║   ███████║██║     █████╔╝ █████╗  ██║  ██║
 ╚════██║   ██║   ██╔══██║██║     ██╔═██╗ ██╔══╝  ██║  ██║
 ███████║   ██║   ██║  ██║╚██████╗██║  ██╗███████╗██████╔╝
 ╚══════╝   ╚═╝   ╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚══════╝╚═════╝
```

**Made with 🏀 by developers who hate losing context**

</div>
