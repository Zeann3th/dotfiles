return {
  {
    "folke/noice.nvim",
    lazy = false,
    -- dependencies = {
    --   {
    --     "rcarriga/nvim-notify",
    --     lazy = false,
    --   },
    -- },
    config = function()
      require("noice").setup {
        lsp = {
          signature = {
            enabled = false,
          },
        },
      }
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      view = { side = "right" },
    },
  },
  {
    "tzachar/highlight-undo.nvim",
    keys = { { "u" }, { "<C-r>" } },
    config = function()
      require("highlight-undo").setup {}
    end,
  },
}
