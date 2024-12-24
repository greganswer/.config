return {
  -- Visualize undo history and browse/switch between different undo branches
  -- https://github.com/mbbill/undotree
  {
    'mbbill/undotree',
    config = function()
      vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
    end
  }
}
