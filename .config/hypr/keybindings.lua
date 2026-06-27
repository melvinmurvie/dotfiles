-- See https://wiki.hypr.land/Configuring/Basics/Binds/

local G = require("global")
local smw = require("plugins.split-monitor-workspaces")

local mainMod = G.mainMod
local opMod = G.opMod

-- Applications
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(G.terminal))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(G.browser))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(G.fileManager))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(G.fnfMenu .. " run drun"))
hl.bind(mainMod .. " + U", hl.dsp.exec_cmd(G.serviceMenu))
hl.bind(mainMod .. " + SHIFT + N", hl.dsp.exec_cmd(G.nc))
hl.bind(opMod .. " + SPACE", hl.dsp.exec_cmd(G.fnfMenu .. " show main"))
hl.bind(mainMod .. " + period", hl.dsp.exec_cmd(G.fnfMenu .. " run emoji"))
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(G.top))

-- Utility
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + G", hl.dsp.group.toggle())
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "maximized" }))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen({ mode = "fullscreen" }))

-- Window movement
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "d" }))
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "d" }))

hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "r" }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "d" }))

hl.bind(mainMod .. " + N", hl.dsp.window.cycle_next())
hl.bind(mainMod .. " + P", hl.dsp.window.cycle_next({ next = false }))
hl.bind(mainMod .. " + TAB", hl.dsp.window.cycle_next())
hl.bind(mainMod .. " + SHIFT + TAB", hl.dsp.window.cycle_next({ next = false }))
hl.bind(mainMod .. " + bracketright", hl.dsp.window.cycle_next())
hl.bind(mainMod .. " + bracketleft", hl.dsp.window.cycle_next({ next = false }))

-- Group movement
hl.bind(mainMod .. " + CTRL + SHIFT + H", hl.dsp.window.move({ direction = "l", group_aware = true }))
hl.bind(mainMod .. " + CTRL + SHIFT + L", hl.dsp.window.move({ direction = "r", group_aware = true }))
hl.bind(mainMod .. " + CTRL + SHIFT + K", hl.dsp.window.move({ direction = "u", group_aware = true }))
hl.bind(mainMod .. " + CTRL + SHIFT + J", hl.dsp.window.move({ direction = "d", group_aware = true }))
hl.bind(mainMod .. " + CTRL + SHIFT + N", hl.dsp.group.move_window())
hl.bind(mainMod .. " + CTRL + SHIFT + P", hl.dsp.group.move_window({ forward = false }))

for i = 1, smw.get_amount_of_workspaces() do
  local n = tostring(i)
  if n == "10" then
    n = "0"
  end

  -- Switch workspaces with mainMod + [0-9]
  hl.bind(mainMod .. " + " .. n, smw.workspace(n))

  -- Move active window to a workspace with mainMod + SHIFT + [0-9]
  hl.bind(mainMod .. " + SHIFT + " .. n, smw.move_to_workspace(n))
end

-- Switch active group
hl.bind(mainMod .. " + CTRL + 1", hl.dsp.group.active({ index = 1 }))
hl.bind(mainMod .. " + CTRL + 2", hl.dsp.group.active({ index = 2 }))
hl.bind(mainMod .. " + CTRL + 3", hl.dsp.group.active({ index = 3 }))
hl.bind(mainMod .. " + CTRL + 4", hl.dsp.group.active({ index = 4 }))
hl.bind(mainMod .. " + CTRL + 5", hl.dsp.group.active({ index = 5 }))
hl.bind(mainMod .. " + CTRL + 6", hl.dsp.group.active({ index = 6 }))
hl.bind(mainMod .. " + CTRL + 7", hl.dsp.group.active({ index = 7 }))
hl.bind(mainMod .. " + CTRL + 8", hl.dsp.group.active({ index = 8 }))
hl.bind(mainMod .. " + CTRL + 9", hl.dsp.group.active({ index = 9 }))
hl.bind(mainMod .. " + CTRL + 0", hl.dsp.group.active({ index = 10 }))
hl.bind(mainMod .. " + CTRL + TAB", hl.dsp.group.next())
hl.bind(mainMod .. " + CTRL + SHIFT + TAB", hl.dsp.group.prev())
hl.bind(mainMod .. " + CTRL + L", hl.dsp.group.next())
hl.bind(mainMod .. " + CTRL + H", hl.dsp.group.prev())
hl.bind(mainMod .. " + CTRL + bracketright", hl.dsp.group.next())
hl.bind(mainMod .. " + CTRL + bracketleft", hl.dsp.group.next())
hl.bind(mainMod .. " + CTRL + I", hl.dsp.focus({ workspace = "previous" }))

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + CTRL + N", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + CTRL + P", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag())
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize())

-- Laptop multimedia keys for volume and LCD brightness
hl.bind(
  "XF86AudioRaiseVolume",
  hl.dsp.exec_cmd("wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 1%+"),
  { locked = true, repeating = true }
)
hl.bind(
  "XF86AudioLowerVolume",
  hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-"),
  { locked = true, repeating = true }
)
hl.bind(
  "XF86AudioMute",
  hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
  { locked = true, repeating = true }
)
hl.bind(
  "XF86AudioMicMute",
  hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
  { locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 1%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 1%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- Control panel
hl.bind(mainMod .. " + CTRL + SHIFT + Y", hl.dsp.exec_cmd("pkill -SIGUSR2 waybar"))
hl.bind(mainMod .. " + CTRL + SHIFT + R", hl.dsp.exec_cmd("hyprctl reload"))

-- Audio control
hl.bind(
  mainMod .. " + CTRL + SHIFT + W",
  hl.dsp.exec_cmd("wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 1%+"),
  { locked = true, repeating = true }
)
hl.bind(
  mainMod .. " + CTRL + SHIFT + S",
  hl.dsp.exec_cmd("wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 1%-"),
  { locked = true, repeating = true }
)
hl.bind(
  mainMod .. " + CTRL + SHIFT + D",
  hl.dsp.exec_cmd("wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SOURCE@ 1%+"),
  { locked = true, repeating = true }
)
hl.bind(
  mainMod .. " + CTRL + SHIFT + A",
  hl.dsp.exec_cmd("wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SOURCE@ 1%-"),
  { locked = true, repeating = true }
)
hl.bind(
  mainMod .. " + CTRL + SHIFT + Z",
  hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
  { locked = true }
)
hl.bind(
  mainMod .. " + CTRL + SHIFT + X",
  hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
  { locked = true }
)
hl.bind(mainMod .. " + CTRL + SHIFT + 1", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
hl.bind(mainMod .. " + CTRL + SHIFT + 2", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind(mainMod .. " + CTRL + SHIFT + 3", hl.dsp.exec_cmd("playerctl next"), { locked = true })

-- Brightness control
hl.bind(mainMod .. " + CTRL + SHIFT + period", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 1%+"), { repeating = true })
hl.bind(mainMod .. " + CTRL + SHIFT + comma", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 1%-"), { repeating = true })

-- Submap: moveresize
hl.bind(opMod .. " + R", hl.dsp.submap("moveresize"))
hl.define_submap("moveresize", function()
  hl.bind("L", hl.dsp.window.move({ x = 10, y = 0, relative = true }), { repeating = true })
  hl.bind("H", hl.dsp.window.move({ x = -10, y = 0, relative = true }), { repeating = true })
  hl.bind("K", hl.dsp.window.move({ x = 0, y = -10, relative = true }), { repeating = true })
  hl.bind("J", hl.dsp.window.move({ x = 0, y = 10, relative = true }), { repeating = true })

  hl.bind("SHIFT + L", hl.dsp.window.move({ x = 50, y = 0, relative = true }), { repeating = true })
  hl.bind("SHIFT + H", hl.dsp.window.move({ x = -50, y = 0, relative = true }), { repeating = true })
  hl.bind("SHIFT + K", hl.dsp.window.move({ x = 0, y = -50, relative = true }), { repeating = true })
  hl.bind("SHIFT + J", hl.dsp.window.move({ x = 0, y = 50, relative = true }), { repeating = true })

  hl.bind(opMod .. " + L", hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true })
  hl.bind(opMod .. " + H", hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })
  hl.bind(opMod .. " + K", hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true })
  hl.bind(opMod .. " + J", hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true })

  hl.bind(opMod .. " + SHIFT + L", hl.dsp.window.resize({ x = 50, y = 0, relative = true }), { repeating = true })
  hl.bind(opMod .. " + SHIFT + H", hl.dsp.window.resize({ x = -50, y = 0, relative = true }), { repeating = true })
  hl.bind(opMod .. " + SHIFT + K", hl.dsp.window.resize({ x = 0, y = -50, relative = true }), { repeating = true })
  hl.bind(opMod .. " + SHIFT + J", hl.dsp.window.resize({ x = 0, y = 50, relative = true }), { repeating = true })

  hl.bind("escape", hl.dsp.submap("reset"))
end)

-- Submap: screenshot
hl.bind(opMod .. " + S", hl.dsp.submap("screenshot"))
hl.define_submap("screenshot", function()
  hl.bind("S", hl.dsp.exec_cmd(G.hyprshot .. " -m region --raw | " .. G.sattyEditStdin))
  hl.bind("SHIFT + S", hl.dsp.exec_cmd(G.hyprshot .. " -m region"))
  hl.bind("W", hl.dsp.exec_cmd(G.hyprshot .. " -m window --raw | " .. G.sattyEditStdin))
  hl.bind("SHIFT + W", hl.dsp.exec_cmd(G.hyprshot .. " -m window"))
  hl.bind("E", hl.dsp.exec_cmd(G.ocr4))

  hl.bind("escape", hl.dsp.submap("reset"))
end)
