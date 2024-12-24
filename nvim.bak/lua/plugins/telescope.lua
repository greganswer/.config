return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    'nvim-tree/nvim-web-devicons',
    'folke/todo-comments.nvim',
  },
  config = function()
    local telescope = require 'telescope'
    local actions = require 'telescope.actions'
    -- local transform_mod = require('telescope.actions.mt').transform_mod
    -- local trouble = require 'trouble'
    -- local trouble_telescope = require 'trouble.sources.telescope'
    -- local custom_actions = transform_mod {
    --   open_trouble_qflist = function(prompt_bufnr)
    --     trouble.toggle 'quickfix'
    --   end,
    -- }

    telescope.setup {
      defaults = {
        -- path_display = { 'smart' },
        pickers = { find_files = { hidden = true } },
        mappings = {
          i = {
            ['<C-k>'] = actions.move_selection_previous, -- move to prev result
            ['<C-j>'] = actions.move_selection_next, -- move to next result
            -- ['<C-q>'] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist,
            -- ['<C-t>'] = trouble_telescope.open,
          },
        },
      },
    }

    telescope.load_extension 'fzf'

    -- set keymaps
    -- Press <C-/> in Telescope Insert mode to see available keymaps
    -- See `:help telescope.builtin`
    local map = vim.keymap.set -- for conciseness
    local builtin = require 'telescope.builtin'

    map('n', '<leader>fh', builtin.help_tags, { desc = '[F]ind [H]elp' })
    map('n', '<leader>fk', builtin.keymaps, { desc = '[F]ind [K]eymaps' })
    map('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
    map('n', '<C-p>', builtin.find_files, { desc = '[F]ind [F]iles' })
    map('n', '<leader>fs', builtin.builtin, { desc = '[F]ind [S]elect Telescope' })
    map('n', '<leader>fw', builtin.grep_string, { desc = '[F]ind current [W]ord' })
    map('n', '<leader>fg', builtin.live_grep, { desc = '[F]ind by [G]rep' })
    map('n', '<leader>fd', builtin.diagnostics, { desc = '[F]ind [D]iagnostics' })
    map('n', '<leader>fr', builtin.resume, { desc = '[F]ind [R]esume' })
    map('n', '<leader>fb', builtin.buffers, { desc = '[F]ind existing [B]uffers' })
    map('n', '<leader>ft', '<cmd>TodoTelescope<cr>', { desc = '[F]ind [T]odos' })

    -- Search recent files in the current working directory
    vim.keymap.set('n', '<C-e>', function()
      builtin.oldfiles { only_cwd = true }
    end, { desc = '[S]earch [R]ecent Files' })
  end,
}
