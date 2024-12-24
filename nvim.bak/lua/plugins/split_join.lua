-- Neovim plugin for splitting/joining blocks of code like arrays, hashes, statements, objects, dictionaries, etc.
-- https://github.com/Wansmer/treesj
return {
  'Wansmer/treesj',
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  config = function()
    local treesj = require 'treesj'
    local map = vim.keymap.set

    treesj.setup {
      map('n', 'gj', treesj.join, { desc = '[G]o [J]oin nodes under cursor' }),
      map('n', 'gs', treesj.split, { desc = '[G]o [S]plit node under cursor' }),
    }
  end,
}
