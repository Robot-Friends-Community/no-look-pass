# Contributing to No-Look Pass

Thanks for your interest in contributing to the community edition!

## Quick Start

1. Fork this repo
2. Install locally using the copy or symlink method (see README)
3. Make your changes on a feature branch
4. Test with `/alleyoop` and `/slamdunk` in a real Claude Code session
5. Submit a PR to the `dev` branch

## Development Setup

```bash
# Clone your fork
git clone https://github.com/YOUR-USERNAME/no-look-pass.git
cd no-look-pass

# Create a feature branch from dev
git checkout -b feature/your-feature dev

# Symlink for testing (macOS / Linux)
mkdir -p ~/.claude/skills/no-look-pass/references ~/.claude/commands
ln -sf "$(pwd)/SKILL.md" ~/.claude/skills/no-look-pass/SKILL.md
for f in references/*.md; do
  ln -sf "$(pwd)/$f" ~/.claude/skills/no-look-pass/$f
done
ln -sf "$(pwd)/commands/alleyoop.md" ~/.claude/commands/alleyoop.md
ln -sf "$(pwd)/commands/slamdunk.md" ~/.claude/commands/slamdunk.md
```

## What to Contribute

- **New scaffolding integrations** — Jira, Linear, Notion task tracking, etc.
- **Instant Replay improvements** — new lenses, better auto-detection, richer entry formats
- **Bug fixes** — unexpected behavior in edge cases
- **Documentation** — clearer instructions, more examples
- **Community examples** — sample Instant Replay entries, handoff patterns

## Pull Request Process

1. Create a feature branch from `dev` (never branch from `main` directly)
2. Make your changes
3. Test locally with Claude Code — run actual `/alleyoop` and `/slamdunk` sessions
4. Update `CHANGELOG.md` with your changes under `## [Unreleased]`
5. Update `SKILL.md` if you've added new commands or changed behavior
6. Submit PR to `dev` branch with a clear description

## Code Style

- Keep `SKILL.md` focused — it's the brain, not the encyclopedia. Details go in `references/`
- Use clear, imperative instructions in command files
- Document any new fields added to `HANDOFF-ALLEYOOP.md` format
- Reference files use `references/FILENAME.md` in execution_context blocks (relative, not absolute)
- No hardcoded paths to user home directories

## Testing Checklist

Before submitting a PR, verify:

- [ ] `/alleyoop` creates `HANDOFF-ALLEYOOP.md` in the correct location
- [ ] `/slamdunk` finds and parses the handoff correctly
- [ ] Instant Replay appends correctly (if you touched that logic)
- [ ] GSD scaffolding detected correctly (if you have a GSD project to test with)
- [ ] No absolute paths in command files

## Questions?

Open an issue or start a Discussion.
