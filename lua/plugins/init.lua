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
    "alex35mil/pi.nvim",

    -- Optional: required only for `:PiPasteImage` (clipboard image paste).
    dependencies = { "HakonHarnes/img-clip.nvim" },

    -- if you're fine with defaults:
    cmd = { "Pi", "PiContinue", "PiResume", "PiToggleChat" },
    config = true,

    -- or, if you want to customize:
    opts = {
 --       models = { ... },
  --      layout = { ... },
    },
}

}
