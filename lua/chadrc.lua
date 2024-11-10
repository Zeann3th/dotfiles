---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "nightfox",
  -- best_ones = {
  --    "nightfox",
  --    "oxocarbon",
  --    "tokyonight",
  --    "decay"
  -- }

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },
  transparency = true,
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
