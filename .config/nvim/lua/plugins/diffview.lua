return {
  "sindrets/diffview.nvim",
  -- opts = {
  --   hooks = {
  --     view_post_layout = function(callback)
  --       -- vim.cmd "tabclose"
  --       vim.notify("closedclosed", callback)
  --     end,
  --   },
  -- },
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
      end,
    },
  },
}
