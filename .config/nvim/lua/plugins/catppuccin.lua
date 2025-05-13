return {
  {
    "catppuccin/nvim",
    optional = true,
    -- https://github.com/catppuccin/nvim?tab=readme-ov-file#configuration
    opts = {
      transparent_background = true,
      integrations = {
        blink_cmp = true,
        diffview = true,
        gitgraph = true,
        hop = true,
        neogit = true,
        snacks = {
          enabled = false,
        },
      },
    },
  },
}
