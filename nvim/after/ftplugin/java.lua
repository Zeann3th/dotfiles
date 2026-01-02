local cwd = vim.fn.getcwd()
local project_name = vim.fn.fnamemodify(cwd, ":t")

local data_dir = os.getenv "XDG_DATA_HOME" or (os.getenv "HOME" .. "/.local/share")

local workspace_dir = "/tmp/nvim-java/" .. project_name

print("Project name: " .. project_name)
print("Workspace dir: " .. workspace_dir)

local config = {
  cmd = {
    "/usr/lib/jvm/jdk-25.0.1-oracle-x64/bin/java",

    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",

    "-javaagent:" .. data_dir .. "/nvim-data/mason/packages/jdtls/lombok.jar",

    "-Xmx1g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens",
    "java.base/java.util=ALL-UNNAMED",
    "--add-opens",
    "java.base/java.lang=ALL-UNNAMED",

    "-jar",
    vim.fn.glob(data_dir .. "/nvim-data/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"),

    "-configuration",
    data_dir .. "/nvim-data/mason/packages/jdtls/config_linux",

    "-data",
    workspace_dir,
  },

  root_dir = vim.fs.root(0, { ".git", "mvnw", "gradlew" }),

  settings = {
    java = {},
  },

  init_options = {
    bundles = {
      -- vim.fn.glob(data_dir .. "/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar"),
    },
  },
}

config["on_attach"] = function(client, bufnr)
  local status_ok, jdtls = pcall(require, "jdtls")
  if status_ok then
    jdtls.setup_dap { hotcodereplace = "auto" }
    require("jdtls.dap").setup_dap_main_class_configs()
  end
end

require("jdtls").start_or_attach(config)
