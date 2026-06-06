local function quickfix_history()
  local items = {}
  local max = vim.fn.getqflist({ nr = "$" }).nr
  local current_nr = vim.fn.getqflist({ nr = 0 }).nr
  local current_idx = 1
  for nr = max, 1, -1 do
    local list = vim.fn.getqflist { nr = nr, id = 0, title = 0, size = 0, items = true }
    if list and list.id and list.id > 0 then
      local preview_lines = {}
      for i, qf_item in ipairs(list.items or {}) do
        if i > 50 then
          table.insert(preview_lines, "... and " .. (list.size - 50) .. " more")
          break
        end
        local bufname = qf_item.bufnr and vim.api.nvim_buf_get_name(qf_item.bufnr) or ""
        bufname = bufname ~= "" and vim.fn.fnamemodify(bufname, ":~:.") or ""

        local lnum = qf_item.lnum or 0
        local col = qf_item.col or 0
        local end_col = qf_item.end_col or 0

        local pos = tostring(lnum)
        if col > 0 then
          if end_col > 0 and end_col > col then
            pos = pos .. string.format(" col %d-%d", col, end_col)
          else
            pos = pos .. string.format(" col %d", col)
          end
        end

        local text = qf_item.text and qf_item.text:gsub("^%s+", "") or ""
        table.insert(preview_lines, string.format("%s|%s| %s", bufname, pos, text))
      end

      table.insert(items, {
        text = ("[%d] %s (%d items)"):format(nr, list.title, list.size),
        nr = nr,
        preview = {
          text = table.concat(preview_lines, "\n"),
          ft = "qf",
        },
      })
      if nr == current_nr then current_idx = #items end
    end
  end

  if #items == 0 then
    vim.notify("No Quickfix History", vim.log.levels.WARN)
    return
  end

  require("snacks").picker.pick {
    source = "qflist_history",
    items = items,
    title = "Quickfix History",
    format = "text",
    preview = "preview",
    on_show = function(picker) picker.list:view(current_idx) end,
    confirm = function(picker, item)
      picker:close()
      if item then
        vim.cmd(item.nr .. "chistory")
        vim.cmd "botright copen"
      end
    end,
  }
end

return {
  {
    "AstroNvim/astrocore",
    opts = function(_, opts)
      local maps = opts.mappings
      local prefix = "<Leader>xc"

      -- disable AstroNvim default quickfix mapping
      maps.n["<Leader>xq"] = false
      maps.n[prefix] = { desc = "Quickfix" }
      maps.n[prefix .. "f"] = { function() require("snacks").picker.qflist() end, desc = "Find" }
      maps.n[prefix .. "l"] = { "<Cmd>copen<CR>", desc = "List" }
      maps.n[prefix .. "n"] = { "<Cmd>silent cnewer | copen<CR>", desc = "Newer list" }
      maps.n[prefix .. "p"] = { "<Cmd>silent colder | copen<CR>", desc = "Older list" }
      maps.n[prefix .. "h"] = { function() quickfix_history() end, desc = "History" }

      -- add snacks quickfix picker to global find section
      maps.n["<Leader>fx"] = { desc = "Quickfix/Lists" }
      maps.n["<Leader>fx" .. "c"] = { function() require("snacks").picker.qflist() end, desc = "Quickfix" }
    end,
  },
}
