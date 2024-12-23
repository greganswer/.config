return {
  -- file explorer that lets you edit your filesystem like a normal Neovim buffer
  --   https://github.com/stevearc/oil.nvim
  'stevearc/oil.nvim',
  config = function()
    local oil = require 'oil'
    oil.setup {
      view_options = { show_hidden = true },
      default_file_explorer = true,
    }
    vim.keymap.set('n', '-', oil.toggle_float, {})
  end,
}
