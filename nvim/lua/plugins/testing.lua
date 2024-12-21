return {
  -- -- A framework for interacting with tests within NeoVim
  -- -- https://github.com/nvim-neotest/neotest
  -- {
  --   "nvim-neotest/neotest",
  --   lazy = true,
  --   dependencies = {
  --     "nvim-neotest/nvim-nio",
  --     "nvim-lua/plenary.nvim",
  --     "antoinemadec/FixCursorHold.nvim",
  --     "nvim-treesitter/nvim-treesitter",
  --     "olimorris/neotest-rspec", -- https://github.com/olimorris/neotest-rspec
  --   },
  --   config = function()
  --
  --     -- RSpec setup
  --     require("neotest").setup({
  --       adapters = {
  --         require("neotest-rspec")({
  --           -- Optionally your function can take a position_type which is one of:
  --           -- - "file"
  --           -- - "test"
  --           -- - "dir"
  --           rspec_cmd = function(position_type)
  --             if position_type == "test" then
  --               return vim.tbl_flatten({
  --                 "bundle",
  --                 "exec",
  --                 "rspec",
  --                 "--fail-fast"
  --               })
  --             else
  --               return vim.tbl_flatten({
  --                 "bundle",
  --                 "exec",
  --                 "rspec",
  --               })
  --             end
  --           end
  --         })
  --       },
  --     })
  --
  --     -- Key mappings
  --     local map = vim.keymap.set
  --
  --     -- Run the nearest test
  --     map("n", "<leader>tn", ":lua require('neotest').run.run()<CR>", { desc = '[T]est [N]earest' })
  --
  --     -- Run all tests in the current file
  --     map("n", "<leader>t", ":lua require('neotest').run.run(vim.fn.expand('%'))<CR>", { desc = '[T]est [F]ile' })
  --   end,
  -- },

  -- easily interact with tmux from vim
  -- https://github.com/preservim/vimux
  { 'preservim/vimux' },

  -- A Vim wrapper for running tests on different granularities.
  -- https://github.com/vim-test/vim-test
  -- https://github.com/skbolton/titan/blob/main/nvim/nvim/lua/testing.lua
  {
    'vim-test/vim-test',
    config = function()
      vim.g['test#strategy'] = 'vimux'
      vim.g.VimuxOrientation = 'h'
      vim.g.VimuxUseNearest = 0

      -- Keymap
      vim.keymap.set('n', '<Leader>tf', ':TestFile <CR>', { desc = '[T]est [F]ile', noremap = true, silent = true })
      vim.keymap.set('n', '<Leader>tn', ':TestNearest <CR>', { desc = '[T]est [N]earest', noremap = true, silent = true })
      vim.keymap.set('n', '<Leader>tl', ':TestLast <CR>', { desc = '[T]est [L]ast', noremap = true, silent = true })
    end,
  },
}
