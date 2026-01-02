---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "tokyonight",
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

M.ui = {
  tabufline = {
    enabled = false,
  },
}

return M
