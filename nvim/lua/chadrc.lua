---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "material-deep-ocean",
  -- best_ones = {
  --    "decay",
  --    "oxocarbon",
  --    "tokyonight",
  --    "material-deep-ocean"
  -- }

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true, fg = "cyan" },
  },
  transparency = true,
}

M.ui = {
  tabufline = {
    enabled = false,
  },
}

M.nvdash = {
  load_on_startup = false,
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
