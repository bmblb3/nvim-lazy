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
            format = require("iron.fts.common").bracketed_paste,
            block_dividers = { "# %%", "#%%" },
          },
        },
        repl_open_cmd = view.split.vertical.belowright(0.4),
      },
      keymaps = {
        restart_repl = "<leader>r.",
        send_code_block = "<leader><leader>",
        send_code_block_and_move = "<leader>rr",
        send_motion = "<leader>rm",
        visual_send = "<leader>r",
      },
      ignore_blank_lines = true,
    })
  end,
}
