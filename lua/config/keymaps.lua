-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

local function add_line_to_quickfix()
  local file = vim.fn.expand("%:p")
  local lnum = vim.fn.line(".")
  local line_text = vim.fn.getline(".")
  vim.fn.setqflist({ { filename = file, lnum = lnum, col = 1, text = line_text } }, "a")
  print("Added current line to quickfix")
end

map("n", "<leader>xa", add_line_to_quickfix, { noremap = true, silent = true, desc = "Add line to quickfix list" })
