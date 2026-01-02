return {
  "stevearc/conform.nvim",
event = { "BufReadPre", "BufNewFile" },
  opts = require "configs.conform",
}
