return {
  "jpalardy/vim-slime",
  ft = { "python" },
  config = function()
    vim.g.slime_target = "zellij"
    vim.g.slime_cell_delimiter = "# %%"
    vim.g.slime_bracketed_paste = 1
    vim.g.slime_no_mappings = 1
    vim.g.slime_default_config = { session_id = "current", relative_pane = "right" }

    local map = function(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc })
    end

    map("n", "<leader><leader>", "<Plug>SlimeSendCell", "Run the cell in REPL")
    map("n", "<leader>rm", "<Plug>SlimeMotionSend", "Run a motion in REPL")
    map("x", "<leader>r", "<Plug>SlimeRegionSend", "Run the visual select in REPL")

    local move_to_next_cell_delimiter_or_nothing = function()
      local cell_delimiter = vim.b.slime_cell_delimiter or vim.g.slime_cell_delimiter
      if not cell_delimiter or cell_delimiter == "" then
        return
      end
      local delim_line = vim.fn.search(cell_delimiter, "nW")
      if delim_line > 0 then
        vim.api.nvim_win_set_cursor(0, { delim_line + 1, 0 })
      end
    end
    map("n", "<leader>rn", move_to_next_cell_delimiter_or_nothing, "Go to next cell")

    local move_to_prev_cell_delimiter_or_nothing = function()
      local cell_delimiter = vim.b.slime_cell_delimiter or vim.g.slime_cell_delimiter
      if not cell_delimiter or cell_delimiter == "" then
        return
      end
      local delim_line = vim.fn.search(cell_delimiter, "bnW")
      if delim_line <= 1 then
        return
      end
      local init_cursor = vim.api.nvim_win_get_cursor(0)
      vim.api.nvim_win_set_cursor(0, { delim_line - 1, 0 })

      local delim_line2 = vim.fn.search(cell_delimiter, "bnW")
      if delim_line2 == 0 then
        vim.api.nvim_win_set_cursor(0, init_cursor)
        return
      end
      vim.api.nvim_win_set_cursor(0, { delim_line2 + 1, 0 })
    end
    map("n", "<leader>rp", move_to_prev_cell_delimiter_or_nothing, "Go to prev cell")

    local move_to_next_cell_delimiter_full_line_match_or_nothing = function()
      local cell_delimiter = vim.b.slime_cell_delimiter or vim.g.slime_cell_delimiter
      if not cell_delimiter or cell_delimiter == "" then
        return
      end
      local delim_line = vim.fn.search(cell_delimiter .. "$", "nW")
      if delim_line > 0 then
        vim.api.nvim_win_set_cursor(0, { delim_line + 1, 0 })
      end
    end
    map(
      "n",
      "<leader>rN",
      move_to_next_cell_delimiter_full_line_match_or_nothing,
      "Go to next cell (full line delimited)"
    )

    map("n", "<leader>rr", function()
      vim.fn["slime#send_cell"]()
      move_to_next_cell_delimiter_full_line_match_or_nothing()
    end, "Send cell and go to next")
  end,
}
