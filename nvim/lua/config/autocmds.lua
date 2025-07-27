-- Autocmds are automatically loaded on the VeryLazy event
--
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
vim.cmd([[ autocmd BufRead,BufNewFile *.yml set filetype=yaml ]])

--
-- Make the current buffer reload automatically when contents change outside of Neovim.
--

-- Reload files changed outside of Neovim (only when buffer has no unsaved changes)
vim.opt.autoread = true
vim.opt.updatetime = 200 -- ms (default is 4000)

-- Proactively check timestamps so autoread can kick in
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  callback = function()
    if vim.fn.mode() ~= "c" then
      vim.cmd.checktime()
    end
  end,
})
