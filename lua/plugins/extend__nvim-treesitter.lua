return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["ae"] = "@cell.outer",
        },
      },
      move = {
        enable = true,
        goto_next_start = {
          ["]e"] = "@cell.start",
        },
        goto_previous_start = {
          ["[e"] = "@cell.start",
        },
      },
    },
  },
}
