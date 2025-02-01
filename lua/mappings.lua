require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Copilot
map("i", "<C-\\>", 'copilot#Accept("<CR>")', {
  expr = true,
  replace_keycodes = false,
  desc = "Copilot complete",
})
vim.g.copilot_no_tab_map = true

-- Harpoon
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

-- Snippets
map("n", "<S-Up>", "0v$x2ko<Esc>pjdd", { desc = "Snippet Move line up" })

map("n", "<S-Down>", "0v$xjp", { desc = "Snippet Move line down" })

map("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true, noremap = true })

map("i", "<C-Up>", function()
  require("cmp"):select_prev_item()
end, { desc = "Snippet Move caret up", silent = true })

map("i", "<C-Down>", function()
  require("cmp"):select_next_item()
end, { desc = "Snippet Move caret down", silent = true })

-- Debugging
map("n", "<F1>", function()
  require("dap").toggle_breakpoint()
end, { desc = "DAP Toggle breakpoint" })

map("n", "<F2>", function()
  require("dap").continue()
end, { desc = "DAP Continue" })

map("n", "<F3>", function()
  require("dap").close()
end, { desc = "DAP Close" })

map("n", "<F4>", function()
  require("dap").restart()
end, { desc = "DAP Restart" })

map("n", "<F5>", function()
  require("dap").disconnect()
  require("dapui").toggle()
end, { desc = "DAP Disconnect" })

map("n", "<leader><F1>", function()
  require("dap").step_into()
end, { desc = "DAP Step into" })

map("n", "<leader><F2>", function()
  require("dap").step_over()
end, { desc = "DAP Step over" })

map("n", "<leader><F3>", function()
  require("dap").step_out()
end, { desc = "DAP Step out" })

map("n", "<leader><F4>", function()
  require("dap").step_back()
end, { desc = "DAP Step back" })
