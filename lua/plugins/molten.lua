return {
  "benlubas/molten-nvim",
  version = "^1.0.0",
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
    map("n", "<leader>rc", ":MoltenInterrupt<CR>", "Interrupt")
    map("n", "<leader>rn", ":MoltenNext<CR>", "GoTo Next")
    map("n", "<leader>rp", ":MoltenPrev <CR>", "GoTo Prev")
    map("n", "<leader>rs", ":MoltenRestart! <CR>", "Reset")
    map("n", "<leader>ro", ":noautocmd MoltenEnterOutput<CR>", "show/enter output")

    -- Visual mode mapping (only once)
    map("v", "<leader>r", ":<C-u>MoltenEvaluateVisual<CR>gv", "Evaluate visual selection")
  end,
}
