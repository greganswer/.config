-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

local map = vim.keymap.set

--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' ' -- See `:help mapleader`
vim.g.maplocalleader = ' ' -- Set <space> as the leader key

-- Exit terminal mode using Esc button. Otherwise, you need to press <C-\><C-n>
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping or just use <C-\><C-n> to exit
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier. Use CTRL+<hjkl> to switch between windows
--  See `:help wincmd` for a list of all window commands
map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

--
-- Misc
--
map('n', '<leader><leader>', '<C-^>') -- Switch between the last two files
map({ 'i', 'n' }, 'jk', '<Esc>:w<cr>') -- Press 'jk' rapidly to write and return to normal mode.
map('n', 'J', 'mzJ`z') -- Make the cursor remain in place when [J]oining lines
map('i', '<C-c>', '<Esc>') -- Use Ctrl-C instead of Esc when in vertical edit mode.

map('n', '<C-u>', '<C-u>zz') -- Keep the cursor in the middle as you scroll
map('n', '<C-d>', '<C-d>zz') -- Keep the cursor in the middle as you scroll

map('n', 'n', 'nzzzv') -- Keep the cursor in the middle as you search
map('n', 'N', 'Nzzzv') -- Keep the cursor in the middle as you search

map('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear highlights on search' }) --  See `:help hlsearch`
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' }) -- Diagnostic keymaps

-- Avoid 'Q' for some reason. Thanks Primeagen.
-- https://youtu.be/w7i4amO_zaE?si=o7xp8VMWAU5Jmz9K&t=1695
map('n', 'Q', '<nop>')

-- reload config
-- map('n', '<C-r>', ':source ~/.config/nvim/init.lua<CR>') -- reload neovim config
