return {
  "smoka7/hop.nvim",
  opts = {},
  dependencies = {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        n = {
          ---@diagnostic disable-next-line: missing-parameter
          ["<Leader>s"] = { function() require("hop").hint_words() end, desc = "Hop hint words" },

          ---@diagnostic disable-next-line: missing-parameter
          ["<Leader><S-s>"] = { function() require("hop").hint_lines() end, desc = "Hop hint lines" },
        },
        v = {
          ["<Leader>s"] = {
            ---@diagnostic disable-next-line: missing-fields
            function() require("hop").hint_words { extend_visual = true } end,
            desc = "Hop hint words",
          },

          ["<Leader><S-s>"] = {
            ---@diagnostic disable-next-line: missing-fields
            function() require("hop").hint_lines { extend_visual = true } end,
            desc = "Hop hint lines",
          },
        },
      },
    },
  },
}
