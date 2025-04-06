return {
  "benlubas/molten-nvim",
  build = ":UpdateRemotePlugins",
  config = function()
    local map = function(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc })
    end

    -- Normal mode mappings
    map("n", "<leader>ri", ":MoltenInit<CR>", "Initialize the plugin")
    map("n", "<leader>re", ":MoltenEvaluateOperator<CR>", "Run operator selection")
    map("n", "<leader>rl", ":MoltenEvaluateLine<CR>", "Evaluate line")
    map("n", "<leader>rr", ":MoltenReevaluateCell<CR>", "Re-evaluate cell")

    -- Visual mode mapping (only once)
    map("v", "<leader>r", ":<C-u>MoltenEvaluateVisual<CR>gv", "Evaluate visual selection")
  end,
}
