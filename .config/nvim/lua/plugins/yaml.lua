---@type LazySpec
return {
  "AstroNvim/astrolsp",
  dependencies = { "b0o/schemastore.nvim" },
  opts = {
    config = {
      yamlls = {
        settings = {
          yaml = {
            schemaStore = { enable = false, url = "" },
            schemas = require("schemastore").yaml.schemas(),
          },
        },
      },
    },
  },
}
