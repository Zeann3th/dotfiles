vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

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
  { import = "plugins.languages" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "*.docx", "*.png", "*.jpg", "*.pdf", "*.xlsx" },
  callback = function()
    local filepath = vim.fn.expand "%:p"
    local opener

    if vim.fn.has "mac" == 1 then
      opener = "open"
    elseif vim.fn.has "unix" == 1 then
      opener = "xdg-open"
    elseif vim.fn.has "win32" == 1 then
      opener = 'start ""'
    else
      print "Unsupported OS"
      return
    end

    vim.print("Opening: '" .. filepath .. "'")

    -- Execute the command
    vim.fn.jobstart(opener .. " " .. vim.fn.shellescape(filepath), { detach = true })

    vim.cmd "bdelete!"
  end,
})
