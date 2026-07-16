# nvim-config

Personal Neovim configuration built on top of [NvChad](https://nvchad.com/) (v2.5).

## Requirements

| Tool | Why |
|---|---|
| [Neovim](https://neovim.io/) ≥ 0.10 | Runtime |
| [Git](https://git-scm.com/) | Plugin manager bootstrap |
| A [Nerd Font](https://www.nerdfonts.com/) | Icons in the UI |
| `ripgrep` + `fd` | Telescope file/text search |
| Node.js & `npm` | Many LSP servers installed via Mason |

## Install

> **Back up any existing config first:**
> ```bash
> mv ~/.config/nvim ~/.config/nvim.bak
> mv ~/.local/share/nvim ~/.local/share/nvim.bak
> ```

Clone the repo into the Neovim config directory:

```bash
git clone https://github.com/<your-user>/nvim-config ~/.config/nvim
```

Launch Neovim — [lazy.nvim](https://github.com/folke/lazy.nvim) bootstraps itself and installs all plugins automatically on first run:

```bash
nvim
```

After plugins finish installing, restart Neovim. Mason will handle LSP/formatter/linter binaries as needed.

## What's included

| Plugin | Purpose |
|---|---|
| NvChad / NvChad UI | Base framework, theme engine, statusline |
| lazy.nvim | Plugin manager |
| Mason | LSP / DAP / linter / formatter installer |
| nvim-lspconfig | LSP client configuration |
| conform.nvim | Formatter (format on save opt-in) |
| Neogit + diffview.nvim | Git UI (`<leader>gg`) |
| Telescope | Fuzzy finder |
| pi-nvim | [Pi](https://github.com/carderne/pi-nvim) coding-agent integration |

**Theme:** `bearded-arc`

## Key mappings

`<leader>` is **Space**.

| Key | Mode | Action |
|---|---|---|
| `<leader>gg` | Normal | Open Neogit |
| `;` | Normal | Enter command mode (`:`) |
| `jk` | Insert | Escape to Normal mode |

All default NvChad mappings apply — run `:NvChad help` or `<leader>ch` to browse them.

## LSP & Formatters

LSP servers are configured in `lua/configs/lspconfig.lua`. Install new servers with `:MasonInstall <server>`.

Format on save is **off** by default. Enable it by uncommenting `event = 'BufWritePre'` in `lua/plugins/init.lua`.

## Customization

| File | What to change |
|---|---|
| `lua/plugins/init.lua` | Add / remove plugins |
| `lua/configs/lspconfig.lua` | LSP server setup |
| `lua/mappings.lua` | Custom keymaps |
| `lua/options.lua` | Vim options |
| `lua/chadrc.lua` | NvChad theme & UI options |

## Pi Agent

This config includes the [pi-nvim](https://github.com/carderne/pi-nvim) plugin for AI-assisted coding inside Neovim. The socket path is auto-discovered. Default keymaps are enabled — see the pi-nvim docs for usage.

## License

MIT
