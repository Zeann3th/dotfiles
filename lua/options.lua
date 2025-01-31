require "nvchad.options"

-- Shell --
------------------------------------------------------------------------------------------
vim.o.shell = "pwsh"
------------------------------------------------------------------------------------------

-- Editor --
------------------------------------------------------------------------------------------

-- Relative line number
vim.wo.relativenumber = true

-- Breakpoint icon
vim.fn.sign_define("DapBreakpoint", { text = "📌", texthl = "", linehl = "", numhl = "" })

-- Folds
-- vim.o.foldmethod = "expr"
-- vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldcolumn = "1"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

vim.g.nvimtree_side = "right"
------------------------------------------------------------------------------------------
