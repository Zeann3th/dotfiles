---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "decay",
  -- best_ones = {
  --    "decay",
  --    "oxocarbon",
  --    "tokyonight",
  -- }

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },
  transparency = false,
}

M.ui = {
  tabufline = {
    enabled = false,
  },
}

M.nvdash = {
  load_on_startup = true,
  header = {
    "                                  ",
    "██╗  ██╗██╗   ██╗███████╗████████╗",
    "██║  ██║██║   ██║██╔════╝╚══██╔══╝",
    "███████║██║   ██║███████╗   ██║   ",
    "██╔══██║██║   ██║╚════██║   ██║   ",
    "██║  ██║╚██████╔╝███████║   ██║   ",
    "╚═╝  ╚═╝ ╚═════╝ ╚══════╝   ╚═╝   ",
    "                                  ",
    "       Powered By  eovim        ",
    "                                  ",
  },
}

return M
