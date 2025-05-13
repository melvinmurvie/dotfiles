return {
  {
    "m00qek/baleia.nvim",
    -- config = function() vim.g.baleia = require("baleia").setup {} end,
  },
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      autocmds = {
        daprepl_color = {
          {
            event = "FileType",
            desc = "Colorise dap-repl",
            pattern = { "dap-repl" },
            callback = function()
              -- vim.notify "test"
              local baleia = require("baleia").setup()
              baleia.automatically(vim.api.nvim_get_current_buf())
            end,
          },
        },
      },
    },
  },
}
