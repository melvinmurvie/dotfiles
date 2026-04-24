# AGENTS.md - Dotfiles Repository

Dotfiles for Arch Linux Hyprland setup. Managed with Taskfile and rsync.

## Quick Commands

```bash
# First time setup
./init.sh
mise use --global task

# Daily workflow
task sync          # Sync all configs to system
task --list        # See all tasks
```

No tests or linters. Configs validated by tools on startup.

## Code Style

### Indentation
- **2 spaces**: YAML, JSON, Lua, shell scripts
- **4 spaces**: Hyprland `.conf` files
- Max line length: 120

### Shell Scripts
```bash
#!/usr/bin/env bash
set -euo pipefail
install_dir="${HOME}/.local/bin"
[ -d "${install_dir}" ] || mkdir -p "${install_dir}"
```

- Always `set -euo pipefail`
- Quote all expansions: `"${VAR}"` not `$VAR`
- Lowercase-hyphens for variables

### Taskfile Patterns

- Internal tasks prefixed with `_` (e.g., `_sync:nvim`)
- Use `status:` for idempotency checks
- Use `ignore_error: true` for non-critical tasks
- Variables: SCREAMING_SNAKE_CASE

### Naming

- Files/dirs: lowercase-hyphens (`hyprland.conf`, `custom/plugins.zsh`)
- Theme configs use relative symlinks to `themes/`

## Architecture

```
.dotfiles/
├── .config/              # Tool configs (hypr, nvim, tmux, etc.)
│   └── opencode/         # OpenCode config + agents
├── themes/               # Catppuccin variants
├── .local/share/         # Bin scripts, applications, icons
├── Taskfile.yml          # All automation lives here
└── init.sh               # Bootstraps mise
```

**Key conventions:**
- XDG compliance: respects `$XDG_CONFIG_HOME`, `$XDG_DATA_HOME`
- Theme linking: symlinks in `~/.config/` point to `themes/`
- Sync uses rsync with `--delete` by default (configurable per-task)

## OpenCode Agents

Custom agents defined in `.config/opencode/agents/`:
- `code-reviewer` - Quality/security review
- `security-auditor` - Vulnerability focus
- `docs-writer` - Documentation

Global caveman rules: `.config/opencode/AGENTS.md`
