-- Application-specific window rules

-- Network Configuration
hl.window_rule({
  match = { class = "nm-connection-editor" },
  float = true,
  center = true,
  size = { "600", "800" },
})

hl.window_rule({
  match = { class = "com.fnf.nmtui" },
  float = true,
  center = true,
  size = { "1100", "800" },
})

hl.window_rule({
  match = { class = "com.fnf.wifitui" },
  float = true,
  center = true,
  size = { "600", "800" },
})

-- Bluetooth Devices
hl.window_rule({
  match = { class = "blueman-manager" },
  float = true,
  center = true,
  size = { "600", "800" },
})

hl.window_rule({
  match = { class = "com.fnf.bluetui" },
  float = true,
  center = true,
  size = { "600", "800" },
})

hl.window_rule({
  match = { class = "com.fnf.bluetuith" },
  float = true,
  center = true,
  size = { "1100", "800" },
})

-- Volume Control
hl.window_rule({
  match = { class = "org.pulseaudio.pavucontrol" },
  float = true,
  center = true,
  size = { "800", "800" },
})

hl.window_rule({
  match = { class = "com.fnf.wiremix" },
  float = true,
  center = true,
  size = { "610", "800" },
})
