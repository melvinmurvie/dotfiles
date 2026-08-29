-- Formatting via none-ls (a.k.a. null-ls — the Lua module kept the old name).
--
-- Three independent layers make a tool format a buffer:
--   1. install  — mason downloads the prettierd binary (mason-tool-installer below)
--   2. register — a none-ls "source" ties that binary to filetypes (opts.sources below)
--   3. run      — none-ls pipes a matching buffer through the source when formatting
--
-- json/jsonc are deliberately NOT covered here: jsonls formats those, because
-- it respects the buffer's indentation (shiftwidth/expandtab) instead of
-- imposing prettier's fixed style. jsonls formatting stays enabled in
-- plugins/astrolsp.lua (not listed under formatting.disabled).

---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    -- layer 1: ensure the prettierd binary is installed via mason
    {
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      optional = true,
      opts = function(_, opts)
        opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed or {}, { "prettierd" })
      end,
    },
    -- layer 2 guard: AstroNvim configures mason-null-ls in automatic mode
    -- (`handlers = {}`), which would register a SECOND prettierd source built
    -- from the stock builtin — json/jsonc included — bypassing the filetype
    -- list below and fighting jsonls. A no-op handler skips auto-registration
    -- for prettierd only; every other mason tool is unaffected.
    {
      "jay-babu/mason-null-ls.nvim",
      optional = true,
      opts = {
        handlers = {
          prettierd = function() end,
        },
      },
    },
  },
  opts = function(_, opts)
    local null_ls = require "null-ls"

    -- layer 2: register the single, customized prettierd source.
    -- `.with{}` returns a configured copy of the stock builtin; this
    -- `filetypes` list REPLACES the stock one (json/jsonc left out on purpose,
    -- see header). Prettierd handles formatting only; LSP (vtsls/vue_ls)
    -- keeps the intelligence — their formatting capability is disabled in
    -- plugins/astrolsp.lua (formatting.disabled).
    opts.sources = require("astrocore").list_insert_unique(opts.sources, {
      null_ls.builtins.formatting.prettierd.with {
        filetypes = {
          "javascript",
          "javascriptreact",
          "typescript",
          "typescriptreact",
          "vue",
          "css",
          "scss",
          "less",
          "html",
          "yaml",
          "markdown",
          "markdown.mdx",
        },
        -- Prettier picks its parser from the file EXTENSION, not the buffer
        -- filetype, so extensionless files (e.g. `:set ft=yaml` on a config
        -- blob) fail with "No parser could be inferred". For those, derive
        -- the parser from the filetype and pass it explicitly.
        extra_args = function(params)
          if vim.fn.fnamemodify(params.bufname, ":e") ~= "" then return {} end
          local parser = ({
            yaml = "yaml",
            markdown = "markdown",
            ["markdown.mdx"] = "mdx",
            javascript = "babel",
            javascriptreact = "babel",
            typescript = "typescript",
            typescriptreact = "typescript",
            css = "css",
            scss = "scss",
            less = "less",
            html = "html",
            vue = "vue",
          })[params.ft]
          -- equals form required: prettierd rejects `--parser x` as two args
          return parser and { "--parser=" .. parser } or {}
        end,
      },
    })
  end,
}
