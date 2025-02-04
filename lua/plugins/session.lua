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
      os.getenv "LOCALAPPDATA" .. "/nvim",
    },
    -- log_level = 'debug',
  },
}
