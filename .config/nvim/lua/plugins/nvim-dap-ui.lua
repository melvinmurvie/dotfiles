return {
  {
    "rcarriga/nvim-dap-ui",
    optional = true,
    opts = {
      layouts = {
        {
          -- You can change the order of elements in the sidebar
          elements = {
            -- Provide IDs as strings or tables with "id" and "size" keys
            {
              id = "scopes",
              size = 0.25, -- Can be float or integer > 1
            },
            { id = "breakpoints", size = 0.25 },
            { id = "stacks", size = 0.25 },
            { id = "watches", size = 0.25 },
          },
          size = 40,
          position = "right", -- Can be "left" or "right"
        },
        {
          elements = {
            "repl",
            -- "console",
          },
          size = 25,
          position = "bottom", -- Can be "bottom" or "top"
        },
      },
    },
    config = function(plugin, opts)
      -- run default AstroNvim nvim-dap-ui configuration function
      require "astronvim.plugins.configs.nvim-dap-ui"(plugin, opts)

      -- disable dap events that are created
      local dap = require "dap"
      -- dap.listeners.after.event_initialized.dapui_config = nil
      dap.listeners.before.event_terminated.dapui_config = nil
      dap.listeners.before.event_exited.dapui_config = nil
    end,
  },
  {
    "AstroNvim/astrocore",
    opts = function(_, opts)
      local maps = opts.mappings
      -- Added true reset option, the defalt one has no options
      maps.n["<Leader>du"] = { function() require("dapui").toggle { reset = true } end, desc = "Toggle Debugger UI" }
    end,
  },
  {
    "AstroNvim/astrocore",
    ft = "dap-repl",
    ---@type AstroCoreOpts
    opts = {
      autocmds = {
        daprepl_color = {
          {
            event = "FileType",
            desc = "Colorise dap-repl",
            pattern = { "dap-repl" },
            callback = function()
              local ok, baleia = pcall(require, "baleia")
              if not ok then return end
              baleia.setup().automatically(vim.api.nvim_get_current_buf())
            end,
          },
        },
      },
    },
  },
}
