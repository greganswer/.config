-- [[ Setting options ]]
-- See `:help opt`
--  For more options, you can see `:help option-list`
--  TODO: Comment each setting

local opt = vim.opt

opt.autoindent = true -- copy indent from current line when starting new one
opt.autoread = true -- automatically read the current file when changed outside vim
opt.autowrite = true -- automatically write before running commands
opt.backup = false
opt.breakindent = true -- Enable break indent
opt.cmdheight = 0
opt.cursorline = true -- Show which line your cursor is on
opt.expandtab = true
opt.hlsearch = false
opt.ignorecase = true -- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
opt.inccommand = 'split' -- Preview substitutions live, as you type!
opt.incsearch = true
opt.list = true
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
opt.mouse = 'a' -- Enable mouse mode, can be useful for resizing splits for example!
opt.number = true -- Make line numbers default
opt.relativenumber = true -- Show relative line numbers
opt.scrolloff = 10 -- Minimal number of screen lines to keep above and below the cursor.
opt.shiftround = true
opt.shiftwidth = 2 -- use number of spaces to insert a <Tab>
opt.showmode = false -- Don't show the mode, since it's already in the status line
opt.signcolumn = 'yes' -- Keep signcolumn on by default
opt.smartcase = true
opt.smarttab = true
opt.softtabstop = 2
opt.splitbelow = true -- Configure how new splits should be opened
opt.splitright = true -- Configure how new splits should be opened
opt.swapfile = false
opt.tabstop = 2
opt.termguicolors = true
opt.timeoutlen = 300 -- Decrease mapped sequence wait time Displays which-key popup sooner
opt.undodir = os.getenv 'HOME' .. '/.vim/undodir'
opt.undofile = true
opt.updatetime = 250 -- Decrease update time

-- Sync clipboard between OS and Neo
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  opt.clipboard = 'unnamedplus'
end)
