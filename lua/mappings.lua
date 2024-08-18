require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
--
--
-- MOLTEN KEYMAPS

map("n", "<localleader>e", ":MoltenEvaluateOperator<CR>", { desc = "evaluate operator", silent = true })
map("n", "<localleader>mo", ":noautocmd MoltenEnterOutput<CR>", { desc = "open output window", silent = true })

map("n", "<localleader>mr", ":MoltenReevaluateCell<CR>", { desc = "re-eval cell", silent = true })
map("v", "<localleader>mv", ":<C-u>MoltenEvaluateVisual<CR>gv", { desc = "execute visual selection", silent = true })
map("n", "<localleader>moh", ":MoltenHideOutput<CR>", { desc = "close output window", silent = true })
map("n", "<localleader>md", ":MoltenDelete<CR>", { desc = "delete Molten cell", silent = true })

-- if you work with html outputs:
--vim.keymap.set("n", "<localleader>mx", ":MoltenOpenInBrowser<CR>", { desc = "open output in browser", silent = true })
