# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [2.0.0] - 2026-03-03

### Added
- **Instant Replay** — persistent game film log that accumulates across sessions
  - Three recording modes: Auto (zero friction), Checkpoint (~30 sec), Film Session (~2-3 min)
  - Five capture lenses: Technical, Journey, Patterns, Business, Learning
  - First-time setup wizard with `/alleyoop init-replay`
  - Debrief auto-suggestion on significant events (pivots, milestones, blockers resolved)
  - Per-project config via `.instant-replay.yml`
- `/alleyoop debrief` subcommand — handoff + structured film session interview
- `/alleyoop init-replay` subcommand — launch Instant Replay setup wizard directly
- `references/` directory with full process specs:
  - `HANDOFF.md` — complete alleyoop 7-step process
  - `INSTANT-REPLAY.md` — full Instant Replay spec (modes, lenses, entry format, scaffolding detection)
  - `RESUME.md` — complete slamdunk 6-step process
  - `INTEGRATIONS.md` — GSD, planning files, Canon Keeper integration details
- `templates/.instant-replay.yml` — config template for Instant Replay
- `SKILL.md` at root level (flat architecture, mirrors Flight Deck)
- `CODE_OF_CONDUCT.md` — Contributor Covenant 2.1
- `SECURITY.md` — security policy and vulnerability reporting
- `LICENSE` — MIT license
- `.github/CODEOWNERS` — maintainer assignments
- `.github/ISSUE_TEMPLATE/contribution-type.yml` — contribution type template
- Updated `.github/pull_request_template.md`

### Changed
- Restructured from nested `skills/no-look-pass-sessions/` to flat root-level `SKILL.md`
- Rewrote `commands/alleyoop.md` — uses relative `@references/` paths, adds subcommand routing
- Rewrote `commands/slamdunk.md` — uses relative `@references/` paths, cleaner process steps
- Full README rewrite with rv404 15-section standard and new ASCII banner (Concept C, ANSI Shadow)
- Removed hardcoded Windows paths from command execution_context blocks
- Published as community edition under Robot-Friends-Community org

### Removed
- `skills/no-look-pass-sessions/` nested folder structure
- `skills/no-look-pass-sessions/templates/HANDOFF.template.md` (replaced by references/)

## [1.0.0] - 2025-02-04

### Added
- Initial release
- `/alleyoop` command — creates HANDOFF-ALLEYOOP.md before clearing context
- `/slamdunk` command — restores context and suggests next action
- GSD integration (detects `.planning/STATE.md`)
- Planning files integration (`task_plan.md`)
- Project log integration (`PROJECT_LOG.md`)
- Captures: objective, progress, decisions, blockers, uncommitted changes
- Suggests specific next action on resume
- Option to delete handoff after successful resume
