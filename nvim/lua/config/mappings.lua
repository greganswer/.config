-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Switch between the last two files
vim.keymap.set('n', '<leader><leader>', '<C-^>')

-- Press 'jk' rapidly to write and return to normal mode.
vim.keymap.set('i', 'jk', '<Esc>:w<cr>')

-- map ctrl-a to write the file
vim.keymap.set('i', '<c-a>', '<Esc>:w<cr>')
vim.keymap.set('n', '<c-a>', '<Esc>:w<cr>')
vim.keymap.set('n', '<leader>w', '<Esc>:w<cr>')

-- Make the curson remain in place when [J]oining lines
vim.keymap.set("n", "J", "mzJ`z")

-- Use Ctrl-C instead of Esc when in vertical edit mode.
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Keep the cursor in the middle as you scroll
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Keep the cursor in the middle as you search
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Avoid 'Q' for some reason. Thanks Primeagen.
-- https://youtu.be/w7i4amO_zaE?si=o7xp8VMWAU5Jmz9K&t=1695
vim.keymap.set("n", "Q", "<nop>")
