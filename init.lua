
vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

--------
local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"
--require("custom")


vim.schedule(function()
  require "mappings"
end)


--- ENABLE LANGUAGE PROVIDERS

local vEnv = "/opt/homebrew/anaconda3/envs/firstTest/bin/python3"
vim.g.python3_host_prog=vim.fn.expand(vEnv)

local enable_providers = {
      "python3_provider",
      -- and so on
}

for _, plugin in pairs(enable_providers) do
  local name = "loaded_"..plugin
  vim.g[name] = nil
  vim.cmd("runtime " .. plugin)
end

