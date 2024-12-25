-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map({ "i", "n" }, "jk", "<Esc>:w<cr>") -- Press 'jk' rapidly to write and return to normal mode.
map("n", "<leader><leader>", "<C-^>", { desc = "Toggle last files", noremap = true })
