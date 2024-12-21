-- [[ Setting options ]]
-- See `:help vim.opt`
--  For more options, you can see `:help option-list`

--
-- Saving
--
vim.opt.undodir = os.getenv 'HOME' .. '/.vim/undodir'
vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.autoread = true -- automatically read the current file when changed outside vim
vim.opt.autowrite = true -- automatically write before running commands

--
-- Searching
--
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true -- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.smartcase = true

--
-- Tabs
--

vim.opt.expandtab = true
vim.opt.shiftround = true
vim.opt.shiftwidth = 2 -- use number of spaces to insert a <Tab>
vim.opt.smarttab = true
vim.opt.softtabstop = 2
vim.opt.tabstop = 2

--
-- Misc
--
vim.opt.signcolumn = 'yes' -- Keep signcolumn on by default
vim.opt.updatetime = 250 -- Decrease update time
vim.opt.timeoutlen = 300 -- Decrease mapped sequence wait time Displays which-key popup sooner
vim.opt.splitright = true -- Configure how new splits should be opened
vim.opt.splitbelow = true -- Configure how new splits should be opened

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.inccommand = 'split' -- Preview substitutions live, as you type!
vim.opt.cursorline = true -- Show which line your cursor is on
vim.opt.scrolloff = 10 -- Minimal number of screen lines to keep above and below the cursor.
vim.opt.termguicolors = true
vim.opt.cmdheight = 0
vim.opt.breakindent = true -- Enable break indent
vim.opt.number = true -- Make line numbers default
vim.opt.relativenumber = true -- Show relative line numbers
vim.opt.mouse = 'a' -- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.showmode = false -- Don't show the mode, since it's already in the status line

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)
