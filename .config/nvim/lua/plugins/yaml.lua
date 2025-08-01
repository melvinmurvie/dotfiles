return {
  "b0o/SchemaStore.nvim",
  lazy = true,
  -- optional = true,
  dependencies = {
    {
      "AstroNvim/astrolsp",
      optional = true,
      ---@type AstroLSPOpts
      opts = {
        ---@diagnostic disable: missing-fields
        config = {
          yamlls = {
            on_new_config = function(config)
              config.settings.yaml.schemas = vim.tbl_deep_extend(
                "force",
                config.settings.yaml.schemas or {},
                require("schemastore").yaml.schemas {
                  -- Disable this since it conflicts with my custom taksfile path
                  ignore = { "Ansible Tasks File" },
                  extra = {
                    {
                      name = "Custom Taskfile",
                      url = "https://taskfile.dev/schema.json",
                      fileMatch = {
                        "Taskfile.yaml",
                        "Taskfile.dist.yaml",
                        "Taskfile.yml",
                        "Taskfile.dist.yml",
                        "**/scripts/tasks/*.yml",
                      },
                    },
                  },
                }
              )
              -- local custom_schemas = {
              --   ["https://taskfile.dev/schema.json"] = {
              --     "Taskfile.yaml",
              --     "Taskfile.dist.yaml",
              --     "Taskfile.yml",
              --     "Taskfile.dist.yml",
              --     "**/scripts/tasks/*.yml",
              --   },
              -- }
              -- config.settings.yaml.schemas =
              --   vim.tbl_deep_extend("force", config.settings.yaml.schemas or {}, schemastore_schemas, custom_schemas)
            end,
            settings = {
              yaml = {
                schemaStore = { enable = false, url = "" },
              },
            },
          },
        },
      },
    },
  },
}
