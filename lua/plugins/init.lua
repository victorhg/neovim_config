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
    cmd = { "Pi", "PiContinue", "PiResume", "PiToggleChat", "PiSelectModel", "PiToggleLayout", "PiSendMention", "PiAttention", "PiAbort", "PiStop" },
    config = function()
      require("pi").setup()

      local pi = require("pi")

      -- Global mappings — open / toggle / resume from anywhere.
      vim.keymap.set({ "n", "v" }, "<Leader>pp", function() vim.cmd("Pi layout=side")  end, { desc = "Pi side"  })
      vim.keymap.set({ "n", "v" }, "<Leader>pf", function() vim.cmd("Pi layout=float") end, { desc = "Pi float" })
      vim.keymap.set({ "n", "v" }, "<Leader>pl", "<Cmd>PiToggleChat<CR>",                 { desc = "Pi toggle layout" })
      vim.keymap.set({ "n", "v" }, "<Leader>pc", "<Cmd>PiContinue<CR>",                     { desc = "Pi continue last session" })
      vim.keymap.set({ "n", "v" }, "<Leader>pr", "<Cmd>PiResume<CR>",                       { desc = "Pi resume past session" })
      vim.keymap.set({ "n", "v" }, "<Leader>pm", "<Cmd>PiSendMention<CR>",                  { desc = "Pi mention file/selection" })
      vim.keymap.set({ "n", "v" }, "<Leader>pa", "<Cmd>PiAttention<CR>",                    { desc = "Pi open next attention request" })
      vim.keymap.set({ "n", "v" }, "<Leader>mm", "<Cmd>PiSelectModel<CR>",                  { desc = "Pi select model" })

      -- Buffer-local mappings inside π windows.
      local group = vim.api.nvim_create_augroup("pi-keymaps", { clear = true })

      local function map(buf, key, action, modes)
        vim.keymap.set(modes or { "n", "i", "v" }, key, action, { buffer = buf })
      end

      -- Shared across all π windows.
      -- M is the alt key
      vim.api.nvim_create_autocmd("FileType", {
        group = group,
        pattern = { "pi-chat-history", "pi-chat-prompt", "pi-chat-attachments" },
        callback = function(event)
          map(event.buf, "<C-q>", "<Cmd>PiToggleLayout<CR>")
          map(event.buf, "<M-c>", "<Cmd>PiAbort<CR>")
          map(event.buf, "<C-o>", pi.toggle_history_blocks)
        end,
      })

      -- History window: jump to prompt.
      vim.api.nvim_create_autocmd("FileType", {
        group = group,
        pattern = "pi-chat-history",
        callback = function(event)
          map(event.buf, "<S-Down>", pi.focus_chat_prompt)
        end,
      })

      -- Prompt window: navigation, scrolling, model & thinking, sessions, attachments.
      vim.api.nvim_create_autocmd("FileType", {
        group = group,
        pattern = "pi-chat-prompt",
        callback = function(event)
          -- focus
          map(event.buf, "<S-Up>",   pi.focus_chat_history)
          map(event.buf, "<S-Down>", pi.focus_chat_attachments)
          -- scroll history from the prompt
          map(event.buf, "<C-Up>",   function() pi.scroll_chat_history("up", 2) end)
          map(event.buf, "<C-Down>", function() pi.scroll_chat_history("down", 2) end)
          -- model & thinking
          map(event.buf, "<M-m>", pi.cycle_model)
          map(event.buf, "<M-M>", pi.select_model)
          map(event.buf, "<M-t>", pi.cycle_thinking_level)
          map(event.buf, "<M-T>", pi.select_thinking_level)
          -- sessions & context
          map(event.buf, "<M-n>", pi.new_session)
          map(event.buf, "<M-x>", pi.compact)
        end,
      })
    end,
}

}
