-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd('BufEnter', {
  desc = 'Tab format for .lua files',
  pattern = { '*.lua' },
  callback = function()
    vim.opt.shiftwidth = 2
    vim.opt.tabstop = 2
    vim.opt.softtabstop = 2
    -- vim.opt_local.colorcolumn = { 70, 80 }
  end,
})

vim.api.nvim_create_autocmd('BufReadPost', {
  desc = 'go to last loc when opening a buffer',
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- TODO: Delete this if git commits have spell check
-- vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
--   desc = 'Enable spell checking for certain file types',
--   pattern = { '*.txt', '*.md', '*.tex', '*.typ' },
--   callback = function()
--     vim.opt.spell = true
--     vim.opt.spelllang = 'en_us'
--   end,
-- })

vim.api.nvim_create_autocmd('FileType', {
  desc = 'Enable spell checking for certain file types',
  pattern = { 'text', 'plaintex', 'typst', 'gitcommit', 'markdown' },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})
