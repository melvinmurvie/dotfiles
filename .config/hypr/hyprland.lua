-- Hyprland main configuration file
-- See https://wiki.hypr.land/Configuring/Start/

require("global")
require("monitors")
require("plugins")
require("inputs")
require("looknfeel")
require("keybindings")
require("windows")
require("autostarts")

local function safe_dofile(path)
  local f, err = io.open(path)
  if f then
    f:close()
    dofile(path)
  else
    hl.notification.create({
      text = "Failed to load '" .. path .. "':" .. err,
      timeout = 1000,
    })
  end
end

-- Theme specific configuration
safe_dofile(os.getenv("HOME") .. "/.config/fnf/current/theme/hyprland.lua")

-- Host specific configuration
safe_dofile(os.getenv("HOME") .. "/.config/fnf/hyprland.lua")
