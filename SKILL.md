---
name: no-look-pass
description: Context handoff for Claude Code. Create session handoffs before clearing context and resume seamlessly. Optionally records an Instant Replay — a persistent game film log that builds across sessions. USE WHEN user says "alleyoop", "slamdunk", "handoff", "pause", "context handoff", "save state", "resume", "pick up where we left off", "continue from last session", "instant replay", "game film", "check the tape", or is about to clear context.
---

# No-Look Pass

Preserve and restore complete work state across Claude Code sessions, with an optional Instant Replay that builds a running log of the entire project journey.

## Overview

**Two outputs, two purposes:**

| Output | Purpose | Lifespan |
|--------|---------|----------|
| `HANDOFF-ALLEYOOP.md` | Session continuity — "where was I?" | Overwritten each alleyoop |
| `INSTANT-REPLAY.md` | Game film log — "what happened and why?" | Accumulates across all sessions |

The handoff is short-term memory. The Instant Replay is long-term memory.

## Commands

| Command | Description |
|---------|-------------|
| `/alleyoop` (standard) | Create handoff + append to Instant Replay (if configured) |
| `/alleyoop debrief` | Create handoff + run full debrief interview for the Instant Replay |
| `/alleyoop init-replay` | Configure Instant Replay for the current project (wizard) |
| `/slamdunk` | Restore context and suggest next action |

## References

- [HANDOFF.md](references/HANDOFF.md) — Full alleyoop process: detect context, gather state, write HANDOFF-ALLEYOOP.md, append to replay
- [INSTANT-REPLAY.md](references/INSTANT-REPLAY.md) — Instant Replay: setup wizard, recording modes, capture lenses, entry format, scaffolding detection
- [RESUME.md](references/RESUME.md) — Full slamdunk process: locate handoff, load context, present summary, suggest next action
- [INTEGRATIONS.md](references/INTEGRATIONS.md) — Integration points (GSD, planning files, case study) and best practices
