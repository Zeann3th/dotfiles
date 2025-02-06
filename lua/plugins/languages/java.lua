return {
  {
    "mfussenegger/nvim-jdtls",
    denpendencies = {
      "mfussenegger/nvim-dap",
    },
    ft = { "java" },
  },
  {
    "JavaHello/spring-boot.nvim",
    ft = { "java", "yaml", "jproperties" },
    dependencies = {
      "mfussenegger/nvim-jdtls",
    },
    --@type bootls.Config
    opts = {},
  },
}
