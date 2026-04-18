---@type LazySpec
return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          visible = false, -- when true, they will just be displayed differently than normal items
          hide_dotfiles = false, -- default to true
          hide_gitignored = false, -- default to true
          hide_hidden = false, -- only works on Windows for hidden files/directories
        },
      },
      window = {
        position = "right",
      },
    },
  },
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = table.concat({
            "███▄▄▄▄    ▄█    █▄   ▄█    ▄▄▄▄███▄▄▄▄  ",
            "███▀▀▀██▄ ███    ███ ███  ▄██▀▀▀███▀▀▀██▄",
            "███   ███ ███    ███ ███▌ ███   ███   ███",
            "███   ███ ███    ███ ███▌ ███   ███   ███",
            "███   ███ ███    ███ ███▌ ███   ███   ███",
            "███   ███ ███    ███ ███  ███   ███   ███",
            "███   ███ ███    ███ ███  ███   ███   ███",
            " ▀█   █▀   ▀██████▀  █▀    ▀█   ███   █▀ ",
          }, "\n"),
        },
      },
    },
  },
}
