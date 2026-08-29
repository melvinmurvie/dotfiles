-- Override toggleterm defaults shipped via AstroNvim/astrocommunity.
-- Remap terminal-mode "exit to normal" key (for scrollback) from
-- `<C-\><C-N>` to `<C-\>`, scoped to toggleterm buffers only so inner
-- TUIs (lazygit, etc.) keep their own `<Esc>` behavior untouched.
---@type LazySpec
return {
  "akinsho/toggleterm.nvim",
  opts = {
    on_open = function(term)
      vim.keymap.set(
        "t",
        "<C-\\>",
        "<C-\\><C-N>",
        { buffer = term.bufnr, silent = true, desc = "Terminal normal mode" }
      )
    end,
  },
}
