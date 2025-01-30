local localappdata = os.getenv "LOCALAPPDATA"
local project_full_path = vim.fn.fnamemodify(vim.fn.getcwd(), ":p")
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")

local config = {
  cmd = {

    -- 💀
    "java",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-javaagent:" .. localappdata .. "/nvim-data/mason/packages/jdtls/lombok.jar",
    "-Xmx1g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens",
    "java.base/java.util=ALL-UNNAMED",
    "--add-opens",
    "java.base/java.lang=ALL-UNNAMED",

    -- 💀
    "-jar",
    localappdata .. "/nvim-data/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.6.900.v20240613-2009.jar",

    -- 💀
    "-configuration",
    localappdata .. "/nvim-data/mason/packages/jdtls/config_win",
    -- 💀
    "-data",
    project_full_path .. "../temp/" .. project_name,
  },

  -- 💀
  root_dir = vim.fs.root(0, { ".git", "mvnw", "gradlew" }),

  settings = {
    java = {},
  },

  init_options = {
    bundles = {
      -- 💀 Must install java-debug
      vim.fn.glob "D:/Apps/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-0.53.1.jar",
    },
  },
}

-- Debugging
config["on_attach"] = function(client, bufnr)
  require("jdtls").setup_dap { hotcodereplace = "auto" }
  require("jdtls.dap").setup_dap_main_class_configs()
end

require("jdtls").start_or_attach(config)
