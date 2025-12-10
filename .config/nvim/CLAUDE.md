# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a Neovim configuration written in Lua, using lazy.nvim as the plugin manager. The configuration is organized under the `lua/rb/` namespace with a modular structure separating core settings from plugin configurations.

## Architecture

### Entry Point Flow
1. `init.lua` - Main entry point that loads:
   - `lua/rb/core/` - Core Neovim settings (options, keymaps)
   - `lua/rb/lazy.lua` - Plugin manager bootstrap

2. Plugin loading happens via lazy.nvim, which auto-imports from:
   - `lua/rb/plugins/*.lua` - Individual plugin configurations
   - `lua/rb/plugins/lsp/*.lua` - LSP-related configurations

### Core Structure
- `lua/rb/core/options.lua` - Editor options (tabs=2 spaces, relative numbers, system clipboard, no swap files)
- `lua/rb/core/keymaps.lua` - Global keymaps with `<Space>` as leader key
- `lua/rb/core/init.lua` - Loads core modules and sets fold configuration

### Plugin Organization
Each plugin is defined in its own file under `lua/rb/plugins/` as a lazy.nvim spec. Files return a table with plugin configuration including dependencies, lazy-loading events, and setup functions.

## Key Technologies

### LSP Setup
LSP configuration uses a three-layer approach:
1. **mason.lua** - Installs LSP servers (clangd, pyright, lua_ls) and tools (prettier, stylua, black, isort, pylint, eslint_d)
2. **lspconfig.lua** - Configures LSP servers with custom handlers for svelte, graphql, emmet_ls, and lua_ls
3. Auto-attaches LSP keybindings when LSP client connects to buffer

LSP keybindings are dynamically set via `LspAttach` autocmd in lspconfig.lua:81-68.

### Formatting & Linting
- **formatting.lua** - Uses conform.nvim with format-on-save enabled (timeout: 1000ms)
  - JavaScript/TypeScript: prettier
  - Python: isort + black
  - Lua: stylua
  - C/C++: clang-format
- **linting.lua** - Uses nvim-lint with auto-linting on BufEnter/BufWritePost/InsertLeave
  - JavaScript/TypeScript: eslint_d
  - Python: ruff
  - C/C++: cpplint

### Completion
nvim-cmp configuration (nvim-cmp.lua:28-62) integrates:
- LSP completions
- LuaSnip snippets
- GitHub Copilot (via copilot-cmp.lua)
- Buffer text and file paths

Sources priority: nvim_lsp > luasnip > copilot > buffer > path

### Key Plugins
- **Telescope** - Fuzzy finder with fzf-native, integrated with Trouble for quickfix
- **Treesitter** - Syntax highlighting and text objects
- **nvim-tree** - File explorer
- **gitsigns** - Git integration
- **auto-save** - Automatic file saving
- **which-key** - Keymap popup helper

## Common Tasks

### Managing Plugins
```lua
-- Open Lazy plugin manager
:Lazy
-- or use keymap: <leader>l
```

### Managing LSP/Tools
```lua
-- Open Mason to manage LSP servers and formatters
:Mason
-- or use keymap: <leader>m

-- In the Mason UI:
--   - Press 'i' on a package to install it
--   - Press 'X' on a package to uninstall it
--   - Press 'u' on a package to update it individually
--   - Press 'U' to update ALL installed packages
--   - Press 'g?' to see all available keybinds

-- To see which packages have updates available:
-- 1. Open :Mason (<leader>m)
-- 2. Navigate to an installed package
-- 3. Press <CR> (Enter) to see package details including latest version
-- 4. Press 'u' to update that package if outdated

-- Or update all tools at once:
:MasonToolsUpdate
```

### Formatting Code
- Auto-formats on save (configured in formatting.lua:25-29)
- Manual format: `<leader>mp` (works in normal/visual mode)

### Linting
- Auto-lints on buffer enter, write, and leaving insert mode
- Manual lint: `<leader>ll`

## Important Conventions

### Code Style
- Lua files use 4-space indentation (defined in .stylua.toml)
- Editor default is 2-space indentation for other filetypes (options.lua:9-12)

### Keymap Patterns
- Leader key is `<Space>` (keymaps.lua:1)
- All keymaps include `desc` field for which-key integration
- Plugin-specific keymaps are defined within their respective config files

### Adding New Plugins
1. Create new file in `lua/rb/plugins/` or `lua/rb/plugins/lsp/`
2. Return lazy.nvim spec table with at minimum:
   ```lua
   return {
     "author/plugin-name",
     config = function()
       -- setup code
     end,
   }
   ```
3. Lazy.nvim auto-imports files from these directories (lazy.lua:14)

### LSP Server Configuration
To add new LSP server:
1. Add to `ensure_installed` in mason.lua:29-33
2. Add custom handler in lspconfig.lua:81-155 only if server needs special configuration
3. Default handler (lspconfig.lua:83-86) automatically configures servers without special needs

## Running Code
Quick keybinds for running code (keymaps.lua:42-45):
- Python: `<leader>p` (runs in shell) or `<leader>pm` (runs in terminal split)
- C++: `<leader>c` (compiles with g++ and runs a.out)
