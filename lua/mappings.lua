require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

map("n", "<leader>ha", function()
  require("harpoon"):list():add()
end, { desc = "Harpoon file" })

map("n", "<leader>hv", function()
  local harpoon = require "harpoon"
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Harpoon quick menu" })

map("n", "<leader>hc", function()
  require("harpoon"):list():clear()
end, { desc = "Harpoon clear list" })

map("n", "<leader>1", function()
  require("harpoon"):list():select(1)
end, { desc = "Harpoon to file 1" })

map("n", "<leader>2", function()
  require("harpoon"):list():select(2)
end, { desc = "Harpoon to file 2" })

map("n", "<leader>3", function()
  require("harpoon"):list():select(3)
end, { desc = "Harpoon to file 3" })

map("n", "<leader>4", function()
  require("harpoon"):list():select(4)
end, { desc = "Harpoon to file 4" })

map("n", "<leader>5", function()
  require("harpoon"):list():select(5)
end, { desc = "Harpoon to file 5" })

map("n", "<S-Up>", "0v$x2ko<Esc>pjdd", { desc = "Move line up" })
map("n", "<S-Down>", "0v$xjp", { desc = "Move line down" })

map("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true, noremap = true })
