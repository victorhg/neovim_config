This is my NeoVim configuration. 

Assumes the use of NvChad and Mason as package manager.


Working Principles

- Be concise. Prefer small, targeted edits over full-file rewrites.
- Ask before broad, multi-file, or potentially destructive changes. State assumptions and tradeoffs briefly when they matter.
- Match the existing style and conventions of the file/project. Don't reformat unrelated code and avoid unrelated cleanup.
- Treat lua/ as the source of truth; README.md is user-facing documentation, not authority over behavior.
- If public API, commands, keymaps, config defaults, or other user-visible behavior change, update README.md in the same change.
- Re-read a file immediately before editing it. Never rely on content from an earlier read — it may be stale.
- Handle errors explicitly. Don't swallow them or mask them with odd defaults. Use pcall for Neovim API calls that may fail (invalid windows/buffers) and Notify.error/warn/info for user-facing messages.
- Skills as located at .agents/skills/

