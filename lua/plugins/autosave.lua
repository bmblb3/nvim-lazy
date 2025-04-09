return {
  "0x00-ketsu/autosave.nvim",
  event = { "InsertLeave", "TextChanged" },
  opts = {
    enable = true,
    prompt = {
      enable = true,
      style = "stdout",
      message = function()
        return "Autosave: saved at " .. vim.fn.strftime("%H:%M:%S")
      end,
    },
    events = { "InsertLeave", "TextChanged" },
    conditions = {
      exists = true,
      modifiable = true,
      filename_is_not = {},
      filetype_is_not = { "gitcommit" },
    },
    write_all_buffers = false,
    debounce_delay = 135,
  },
}
