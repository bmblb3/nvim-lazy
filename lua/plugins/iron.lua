return {
  "hkupty/iron.nvim",
  config = function(plugins, opts)
    local iron = require("iron.core")
    local view = require("iron.view")
    local common = require("iron.fts.common")

    iron.setup({
      config = {
        highlight_last = "IronLastSent",
        scratch_repl = true,
        repl_definition = {
          sh = {
            command = { "bash" },
          },
          python = {
            command = { "ipython", "--no-autoindent" },
            format = common.bracketed_paste_python,
            block_dividers = { "# %%", "#%%" },
          },
        },
        repl_open_cmd = view.split.vertical.belowright(0.4),
      },
      keymaps = {
        toggle_repl = "<leader>rr",
        restart_repl = "<leader>rt",
        send_motion = "<leader>rc",
        visual_send = "<leader>rc",
        send_file = "<leader>rf",
        send_line = "<leader>rl",
        send_paragraph = "<leader>rp",
        send_mark = "<leader>rm",
        mark_motion = "<leader>rmc",
        mark_visual = "<leader>rmc",
        remove_mark = "<leader>rmd",
        cr = "<leader>r<cr>",
        interrupt = "<leader>r<leader>",
        exit = "<leader>rq",
        clear = "<leader>rx",
        send_until_cursor = "<leader>ru",
        send_code_block = "<leader><leader>",
        send_code_block_and_move = "<leader>rn",
      },
      ignore_blank_lines = true,
    })
  end,
}
