-- https://wiki.hypr.land/Configuring/Basics/Variables/#input

hl.config({
  input = {
    kb_layout = "us",
    kb_variant = "",
    kb_model = "",
    kb_options = "",
    kb_rules = "",

    follow_mouse = 1,

    sensitivity = 0,

    touchpad = {
      natural_scroll = true,
      scroll_factor = 0.5,
    },
  },
})

hl.gesture({
  fingers = 3,
  direction = "horizontal",
  action = "workspace",
})

hl.gesture({
  fingers = 3,
  direction = "vertical",
  action = "fullscreen",
  args = "maximize",
})

hl.gesture({
  fingers = 3,
  direction = "pinch",
  action = "fullscreen",
})

hl.gesture({
  fingers = 4,
  direction = "horizontal",
  action = "move",
})

hl.gesture({
  fingers = 4,
  direction = "vertical",
  action = "move",
})

hl.gesture({
  fingers = 4,
  direction = "pinch",
  action = "float",
})
