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
    opts = {
        ensure_installed = {
            "lua_ls",
            "black",
            "pyright",
            "mypy",
        },
      },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
      require "configs.pylspconfig"
    end,

  },

  ------ MOLTEN SETUP - DataScience ENV
  {
    'willothy/wezterm.nvim',
    opts = {
        create_commands = false
    },
  },
  {
    "benlubas/molten-nvim",
    version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
    --dependencies = "3rd/image.nvim",
    build = ":UpdateRemotePlugins",
    lazy = false,
    init = require "configs.molten",
  },
  {
      -- see the image.nvim readme for more information about configuring this plugin
    "3rd/image.nvim",
    opts = {
        backend = "kitty", -- whatever backend you would like to use
        max_width = 100,
        max_height = 12,
        max_height_window_percentage = math.huge,
        max_width_window_percentage = math.huge,
        window_overlap_clear_enabled = true, -- toggles images when windows are overlapped
        window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
      },
    }

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
