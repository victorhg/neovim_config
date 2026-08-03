return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  -- ----------------------------
  -- CUSTOM PLUGINS CONFIGURATION
  -- ----------------------------
  --

  {
     'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' },            -- if you use the mini.nvim suite
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },
  {
    "carderne/pi-nvim"
  },

  -- Nvim 0.12 bundles its own markdown treesitter parser; nvim-treesitter's
  -- injection queries (#offset! predicate) crash against the new runtime.
  -- Disable nvim-treesitter highlight for markdown and let Neovim's builtin handle it.
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      highlight = {
        enable = true,
        disable = { "markdown", "markdown_inline" },
      },
    },
  },


  {
    "NeogitOrg/neogit",
    lazy = true,
    dependencies = {
      -- Only one of these is needed.
      "sindrets/diffview.nvim",        -- optional
      "esmuellert/codediff.nvim",      -- optional

      -- For a custom log pager
      "m00qek/baleia.nvim",            -- optional

      -- Only one of these is needed.
      "nvim-telescope/telescope.nvim", -- optional
      "ibhagwan/fzf-lua",              -- optional
      "nvim-mini/mini.pick",           -- optional
      "folke/snacks.nvim",             -- optional
    },
    cmd = "Neogit",
    keys = {
      { "<leader>gg", "<cmd>Neogit<cr>", desc = "Show Neogit UI" }
    }
  }
}
