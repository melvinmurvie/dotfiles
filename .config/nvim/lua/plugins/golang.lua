-- NOTE: The motivation is just to parse `envFile` field and override dap-go setup on
-- dap.adapters.go and make sure the dap-go is initialized first so we get debug for
-- tests as well.
--
-- Current precedence `env` > `envFile`.

local gopls_settings = {
  -- Disable gofumpt for now
  gofumpt = false,
  analyses = {
    ST1003 = false,
    shadow = false,
  },
}

local M = {
  "leoluz/nvim-dap-go",
  ft = "go",
  dependencies = {
    "folke/neoconf.nvim",
    "mfussenegger/nvim-dap",
    {
      "jay-babu/mason-nvim-dap.nvim",
      optional = true,
    },
  },
}

-- Placeholder expansion for launch directives
local placeholders = {
  ["${file}"] = function(_) return vim.fn.expand "%:p" end,
  ["${fileBasename}"] = function(_) return vim.fn.expand "%:t" end,
  ["${fileBasenameNoExtension}"] = function(_) return vim.fn.fnamemodify(vim.fn.expand "%:t", ":r") end,
  ["${fileDirname}"] = function(_) return vim.fn.expand "%:p:h" end,
  ["${fileExtname}"] = function(_) return vim.fn.expand "%:e" end,
  ["${relativeFile}"] = function(_) return vim.fn.expand "%:." end,
  ["${relativeFileDirname}"] = function(_) return vim.fn.fnamemodify(vim.fn.expand "%:.:h", ":r") end,
  ["${workspaceFolder}"] = function(_) return vim.fn.getcwd() end,
  ["${workspaceFolderBasename}"] = function(_) return vim.fn.fnamemodify(vim.fn.getcwd(), ":t") end,
  ["${env:([%w_]+)}"] = function(match) return os.getenv(match) or "" end,
}

--- Expand value variable with placeholder functions.
---@param value? string The envFile file path
---@return string expanded The expanded value
local function expand(value)
  if not value or value == "" then return "" end
  for key, fn in pairs(placeholders) do
    value = value:gsub(key, fn)
  end
  return value
end

--- Parses env file and return key value table, if env_file is nil this simply returns an empty table.
---@param env_file? string The envFile file path
---@return table? env The env table
local function parse_env_file(env_file)
  local env = {}
  if not env_file then return env end

  for line in io.lines(expand(env_file)) do
    -- local words = {}
    -- for word in string.gmatch(line, "[^=]+") do
    --   table.insert(words, word)
    -- end
    -- if not final_config.env then final_config.env = {} end
    -- final_config.env[words[1]] = words[2]

    -- Trim leading and trailing whitespace
    line = line:match "^%s*(.-)%s*$"

    -- Ignore empty lines and comments
    if line ~= "" and not line:match "^#" then
      local key, value = line:match "^([^=]+)=(.*)$"
      if key and value then
        -- Remove inline comment from value e.g. `FOO=BAR # this is foo comment`
        -- value = value:match "^(.-)%s*#" or value

        -- Trim spaces around key and value
        key = key:match "^%s*(.-)%s*$"
        value = expand(value:match "^%s*(.-)%s*$")

        env[key] = value
      end
    end
  end

  return env
end

--- Expand all of the value in the table
---@param vars? table The table of the variables
---@return table? expanded The table which value is expanded
local function expand_vars(vars)
  if not vars then return vars end
  for key, value in pairs(vars) do
    vars[key] = expand(value)
  end
  return vars
end

function M.config()
  require("dap-go").setup {} -- include default dap-go setup call
  local dap = require "dap"
  local astro = require "astrocore"
  local notify = function(msg, type, opts) astro.notify(msg, type, astro.extend_tbl({ title = "Golang" }, opts)) end

  dap.adapters.go = {
    type = "server",
    port = "${port}",
    executable = {
      -- command = registry.get_package("delve"):get_install_path(),
      command = "dlv", -- uses installed tool in host, still has some issue with delve installed with mason
      args = { "dap", "-l", "127.0.0.1:${port}" },
    },
    enrich_config = function(config, on_config)
      local final_config = vim.deepcopy(config)
      local final_env = final_config.env

      -- Add default outputMode since without it the debugger won't print log to repl
      -- and default vscode launch.json does not support this field.
      if not final_config.outputMode then final_config.outputMode = "remote" end

      -- Inject test settings from neoconf in `test` mode
      if final_config.mode == "test" then
        -- Currently I only inject the settings comes from vscode settings.json
        local neoconf = require "neoconf"
        local testEnvFile = neoconf.get "vscode.go.testEnvFile"
        local testEnvVars = neoconf.get "vscode.go.testEnvVars" or {}

        final_env = astro.extend_tbl(final_env, parse_env_file(testEnvFile))
        final_env = astro.extend_tbl(final_env, expand_vars(testEnvVars))
      end

      final_env = astro.extend_tbl(final_env, parse_env_file(final_config.envFile))
      final_config.env = final_env

      -- This guards if there is no env in the configurations final_config.env will be an empty
      -- table '{}' and delve does not like that. The error if env was an empty table: `Error
      -- on launch: Failed to launch: invalid debug configuration - cannot unmarshal array into
      -- "env" of type map[string]*string`
      if next(final_config.env) == nil then final_config.env = nil end

      notify("config:\n" .. vim.inspect(final_config), vim.log.levels.DEBUG)
      on_config(final_config)
    end,
  }
end

return {
  {
    "AstroNvim/astrolsp",
    optional = true,
    ---@type AstroLSPOpts
    opts = {
      ---@diagnostic disable-next-line: missing-fields
      config = {
        gopls = {
          settings = {
            gopls = gopls_settings,
          },
        },
      },
    },
  },
  M,
}
