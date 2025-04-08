return {
  "pappasam/nvim-repl",
  config = function()
    local map = function(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc })
    end

    -- Mappings
    map("n", "<leader>ri", ":Repl<CR>", "Initialize REPL")
    map("n", "<leader>rx", ":ReplClear<CR>", "Clear REPL")
    map("n", "<leader>ro", ":ReplToggle<CR>", "Open/close the REPL")
    map("n", "<leader>rr", "<Plug>(ReplSendCell)", "Run the cell")
    map("n", "<leader><leader>", "<Plug>(ReplSendCell)", "Run the cell")
    map("n", "<leader>rn", ":ReplNewCell<CR>", "New cell")
    map("n", "<leader>rl", "<Plug>(ReplSendLine)", "Send line")
    map("x", "<leader>rl", "<Plug>(ReplSendVisual)", "Send visual")
    map("n", "<leader>rs", ":ReplSend<CR>", "Send a command to REPL")
  end,
}
