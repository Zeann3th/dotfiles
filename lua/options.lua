require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
vim.wo.relativenumber = true

vim.fn.sign_define("DapBreakpoint", { text = "📌", texthl = "", linehl = "", numhl = "" })
