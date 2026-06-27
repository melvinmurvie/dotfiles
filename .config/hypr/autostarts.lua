-- Autostart necessary processes (like notifications daemons, status bars, etc.)

local G = require("global")

hl.on("hyprland.start", function()
  hl.exec_cmd("uwsm app -- waybar")
  hl.exec_cmd("uwsm app -- hyprpaper")
  hl.exec_cmd("uwsm app -- hypridle")

  hl.exec_cmd(G.browser)
  hl.exec_cmd(G.terminal)

  -- hl.exec_cmd("hyprpm reload")
end)
