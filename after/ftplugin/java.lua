local cwd = vim.fn.getcwd()

-- Avoid backend and frontend dirs if project is a monorepo
local project_name
local tail, parent = vim.fn.fnamemodify(cwd, ":t"), vim.fn.fnamemodify(cwd, ":h:t")

local exclude_dirs = { "backend", "frontend", "be", "fe" }

local valid_tails = {}
for _, v in ipairs(exclude_dirs) do
  valid_tails[v] = true
end

if valid_tails[tail] then
  project_name = parent .. "/" .. tail
else
  project_name = tail
end

-- Temp files / Data files
local workspace_dir = os.getenv "TEMP" .. "/nvim-java/" .. project_name

local localappdata = os.getenv "LOCALAPPDATA"
print("Project name: " .. project_name)
print("Workspace dir: " .. workspace_dir)

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
    workspace_dir,
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
