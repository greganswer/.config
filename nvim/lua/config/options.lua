-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

-- LSP Server to use for Ruby.
-- Set to "solargraph" to use solargraph instead of ruby_lsp.
-- vim.g.lazyvim_ruby_lsp = "ruby_lsp"
-- vim.g.lazyvim_ruby_formatter = "rubocop"

-- Snacks animations
-- Set to `false` to globally disable all snacks animations
vim.g.snacks_animate = false

opt.smoothscroll = false
opt.swapfile = false
opt.backup = false
vim.opt.spelllang = "en_us"
vim.opt.spell = true
vim.opt.colorcolumn = "100"
