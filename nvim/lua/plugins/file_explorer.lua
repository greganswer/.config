return {
  -- file explorer that lets you edit your filesystem like a normal Neovim buffer
  --   https://github.com/stevearc/oil.nvim
  'stevearc/oil.nvim',
  config = function()
    local oil = require 'oil'
    oil.setup()
    vim.keymap.set('n', '-', oil.toggle_float, {})
  end,
}
