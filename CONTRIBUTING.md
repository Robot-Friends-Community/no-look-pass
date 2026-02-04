# Contributing to No-Look Pass Sessions

Thanks for your interest in contributing!

## Quick Start

1. Fork and clone the repo
2. Copy files to your `~/.claude/` for testing
3. Make your changes
4. Test with `/alleyoop` and `/slamdunk`
5. Submit a PR

## Development Setup

```bash
# Clone your fork
git clone https://github.com/YOUR-USERNAME/no-look-pass-sessions.git
cd no-look-pass-sessions

# Create a feature branch
git checkout -b feature/your-feature

# Symlink for testing (optional)
ln -s "$(pwd)/skills/no-look-pass-sessions" ~/.claude/skills/no-look-pass-sessions
ln -s "$(pwd)/commands/alleyoop.md" ~/.claude/commands/alleyoop.md
ln -s "$(pwd)/commands/slamdunk.md" ~/.claude/commands/slamdunk.md
```

## What to Contribute

- Bug fixes
- New scaffolding integrations
- Documentation improvements
- Better handoff templates

## Pull Request Process

1. Create a feature branch from `dev`
2. Make your changes
3. Test locally with Claude Code
4. Update documentation if needed
5. Submit PR to `dev` branch

## Code Style

- Keep SKILL.md under 5k words
- Use clear, imperative instructions
- Document any new fields in HANDOFF-ALLEYOOP.md

## Questions?

Open an issue or start a discussion.
