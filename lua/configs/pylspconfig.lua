local config = require("nvchad.configs.lspconfig")

-- We keep the NvChad defaults for consistency
local opts = {
  on_attach = config.on_attach,
  capabilities = config.capabilities,
  filetypes = {"python"},
}

-- Use the new native LSP config
vim.lsp.config('pyright', opts)
vim.lsp.enable('pyright')
