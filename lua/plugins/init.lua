return {
{
  "vhyrro/luarocks.nvim",
  priority = 1001,
  opts = { 
	rocks = { "magick" },
  },
},
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  -- ----------------------------
  -- CUSTOM PLUGINS CONFIGURATION
  -- ----------------------------
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = {"python"},
    opts = function()
      return require "configs.null-ls"
    end,
  },

  {
    "williamboman/mason.nvim",
    dependencies = {
        "WhoIsSethDaniel/mason-tool-installer.nvim"
    },

    config = function()
        require("mason").setup()

        require("mason-tool-installer").setup({
            ensure_installed = {
              "lua_ls",
              "black",
              "pyright",
              "mypy",
            }
        })

    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
      require "configs.pylspconfig"
    end,

  },
  {
    'willothy/wezterm.nvim',
    opts = {
        create_commands = false
    },
  },

}
