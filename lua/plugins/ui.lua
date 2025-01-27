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
}
