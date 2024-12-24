return {
  -- Color theme
  -- https://github.com/olimorris/onedarkpro.nvim
  {
    'olimorris/onedarkpro.nvim',
    priority = 1000, -- Ensure it loads first
    config = function()
      require('onedarkpro').setup {
        colors = {
          dark = { bg = '#292854' }, -- Dark blue
        },
      }
      vim.cmd 'colorscheme onedark'
    end,
  },

  -- Highlight todo, notes, etc in comments
  -- https://github.com/folke/todo-comments.nvim
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false, highlight = { after = '' } },
    -- config = function()
    --   vim.keymap.set('n', ']t', function()
    --     require('todo-comments').jump_next()
    --   end, { desc = 'Next [T]odo comment' })
    --
    --   vim.keymap.set('n', '[t', function()
    --     require('todo-comments').jump_prev()
    --   end, { desc = 'Previous [T]odo comment' })
    -- end,
  },
}
