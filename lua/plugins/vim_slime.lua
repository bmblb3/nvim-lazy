return {
  "jpalardy/vim-slime",
  ft = { "python" },
  config = function()
    vim.g.slime_target = "zellij"
    vim.g.slime_cell_delimiter = "# %%"
    vim.g.slime_bracketed_paste = 1
    vim.g.slime_no_mappings = 1

    local map = function(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc })
    end

    map("n", "<leader>ri", "<Plug>SlimeConfig", "Slime config")
    map("n", "<leader>rc", "<Plug>SlimeSendCell", "Run the cell")
  end,
}
