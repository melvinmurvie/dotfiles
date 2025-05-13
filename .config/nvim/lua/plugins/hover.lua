return {
  "lewis6991/hover.nvim",
  lazy = true,
  specs = {
    {
      "AstroNvim/astrocore",
      opts = {
        options = { opt = { mousemoveevent = true } },
        mappings = {
          n = {
            -- Disable hover from hover plugin and uses default lsp from
            -- AstroNvim mainly because hover plugin does not have scroll
            -- functionality.
            -- K = { function() require("hover").hover() end, desc = "Hover cursor" },
            gh = { function() require("hover").hover_select() end, desc = "Hover selection" },
            ["]h"] = { function() require("hover").hover_switch "next" end, desc = "Next hover source" },
            ["[h"] = { function() require("hover").hover_switch "previous" end, desc = "Previous hover source" },
            ["<MouseMove>"] = { function() require("hover").hover_mouse() end, desc = "Hover mouse" },
          },
        },
      },
    },
    -- {
    --   "AstroNvim/astrolsp",
    --   opts = { mappings = { n = { K = false } } },
    -- },
  },
  opts = {
    init = function() require "hover.providers.lsp" end,
    mouse_delay = 300,
    preview_window = true,
  },
}
