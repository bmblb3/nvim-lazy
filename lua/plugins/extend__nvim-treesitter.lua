return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["a#"] = "@cell.outer",
        },
      },
      move = {
        enable = true,
        goto_next_start = {
          ["]#"] = "@cell.start",
        },
        goto_previous_start = {
          ["[#"] = "@cell.start",
        },
      },
    },
  },
}
