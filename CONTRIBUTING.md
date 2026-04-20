# Contributing to nvim-spectre

Thank you for your interest in contributing to nvim-spectre! This document provides guidelines and information for contributors.

## Development Setup

### Prerequisites

- [Neovim](https://neovim.io/) >= 0.8
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [sed](https://www.gnu.org/software/sed/) (or `gsed` on macOS: `brew install gnu-sed`)
- [plenary.nvim](https://github.com/nvim-lua/plenary.nvim)
- [StyLua](https://github.com/JohnnyMorganz/StyLua) for code formatting
- [Luacheck](https://github.com/mpeterv/luacheck) for linting (optional)

### Optional

- [Rust toolchain](https://rustup.rs/) — only needed if working on the `spectre_oxi` native module

### Getting Started

1. Fork and clone the repository.
2. Ensure `plenary.nvim` is available in your Neovim runtime path.
3. Run the health check to verify your setup:
   ```vim
   :checkhealth spectre
   ```

## Code Structure

```
nvim-spectre/
├── plugin/          — Neovim plugin entry point (user commands)
├── lua/spectre/     — Main plugin code
│   ├── init.lua     — Public API and setup()
│   ├── config.lua   — Default configuration
│   ├── state.lua    — Global state management
│   ├── ui.lua       — UI rendering
│   ├── actions.lua  — User action handlers
│   ├── utils.lua    — Utility functions
│   ├── health.lua   — Health check (:checkhealth spectre)
│   ├── highlight.lua— Highlight group definitions
│   ├── search/      — Pluggable search engines (rg, ag)
│   ├── replace/     — Pluggable replace engines (sed, sd, oxi)
│   └── regex/       — Regex engines (vim, rust)
├── autoload/        — Vim script autoload functions
├── doc/             — Vim help documentation (auto-generated)
├── tests/           — Plenary busted test suite
└── spectre_oxi/     — Rust native module (optional)
```

## Running Tests

Tests use [plenary.nvim](https://github.com/nvim-lua/plenary.nvim)'s busted test runner:

```bash
make test
```

This runs all `*_spec.lua` files in the `tests/` directory under a headless Neovim instance.

### Writing Tests

- Place test files in `tests/` with the `_spec.lua` suffix.
- Use `describe` and `it` blocks (plenary busted syntax).
- Test fixtures go in `tests/project/`.
- See existing test files for examples.

## Code Style

### Formatting

We use [StyLua](https://github.com/JohnnyMorganz/StyLua) for consistent Lua formatting. The configuration is in `stylua.toml`.

Check formatting:
```bash
stylua --check lua/
```

Auto-format:
```bash
stylua lua/
```

### Linting

We use [Luacheck](https://github.com/mpeterv/luacheck) for static analysis. The configuration is in `.luacheckrc`.

```bash
luacheck lua/ tests/ plugin/
```

### Type Annotations

Use [LuaLS](https://github.com/LuaLS/lua-language-server) / EmmyLua-style annotations for all public functions and types:

```lua
---@param search_text string The text to search for
---@param replace_text string The replacement text
---@return boolean success Whether the replacement succeeded
function M.replace(search_text, replace_text)
```

## Submitting Changes

1. Create a feature branch from `master`.
2. Make your changes following the code style guidelines.
3. Add or update tests as needed.
4. Ensure all tests pass: `make test`
5. Ensure formatting is correct: `stylua --check lua/`
6. Open a pull request with a clear description of your changes.

## Reporting Bugs

When reporting bugs, please include:

- Neovim version (`nvim --version`)
- Output of `:checkhealth spectre`
- Steps to reproduce
- Expected vs. actual behavior
- Relevant configuration

## Documentation

- The vim help file `doc/spectre.txt` is auto-generated from `README.md` using [panvimdoc](https://github.com/kdheepak/panvimdoc). Do not edit it manually.
- Update `README.md` for any user-facing changes.
