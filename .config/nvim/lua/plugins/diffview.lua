return {
  "sindrets/diffview.nvim",
  event = "User AstroGitFile",
  dependencies = {
    { "AstroNvim/astroui", opts = { icons = { Diffview = "" } } },
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        local maps = opts.mappings
        local prefix = "<Leader>g"

        maps.n[prefix .. "w"] = { desc = require("astroui").get_icon("Diffview", 1, true) .. "Diffview" }
        maps.n[prefix .. "wd"] = { "<Cmd>DiffviewOpen<CR>", desc = "Open Diffview Tab Page" }
        maps.n[prefix .. "wc"] = { "<Cmd>DiffviewClose<CR>", desc = "Close Diffview Tab Page" }
        maps.n[prefix .. "wh"] =
          { "<Cmd>DiffviewFileHistory %<CR>", desc = "Open Diffview file history on current file" }
        maps.n[prefix .. "wa"] =
          { "<Cmd>DiffviewFileHistory --all<CR>", desc = "Open Diffview file history on all files" }
      end,
    },
  },
}
