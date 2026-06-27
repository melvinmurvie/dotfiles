package.path = package.path .. ";./?.lua;./?/init.lua"
local smw = require("plugins.split-monitor-workspaces")

smw.setup({
  workspace_count = 10,
  keep_focused = true,
  enable_notifications = false,
  enable_persistent_workspaces = false,
})
