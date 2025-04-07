return {
  "kevinhwang91/nvim-ufo",
  dependencies = { "kevinhwang91/promise-async" },
  opts = {
    filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
  },
  config = function()
    require("ufo").setup {
      close_fold_kinds_for_ft = {
        default = { "imports", "comment" },
      },
    }
  end,
  lazy = false,
}
