local localappdata = vim.fn.has "win32" == 1 and os.getenv "LOCALAPPDATA"

return {
  "rmagatti/auto-session",
  lazy = false,
  enabled = false,
  ---enables autocomplete for opts
  ---@module "auto-session"
  ---@type AutoSession.Config
  opts = {
    suppressed_dirs = {
      vim.fn.expand "~",
      vim.fn.expand "~/Downloads",
      localappdata .. "/nvim",
    },
    -- log_level = 'debug',
  },
}
