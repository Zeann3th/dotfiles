require "nvchad.options"

vim.wo.relativenumber = true

vim.fn.sign_define("DapBreakpoint", { text = "📌", texthl = "", linehl = "", numhl = "" })

-- vim.o.foldmethod = "expr"
-- vim.o.foldexpr = "nvim_treesitter#foldexpr()"

vim.o.foldcolumn = "1"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 3
vim.o.foldenable = true
