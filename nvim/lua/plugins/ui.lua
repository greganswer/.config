return {
  "olimorris/onedarkpro.nvim",
  priority = 1000, -- Ensure it loads first
  config = function()
    require("onedarkpro").setup({
      colors = {
        dark = { bg = "#292854" }, -- Dark blue
      }
    })
    vim.cmd("colorscheme onedark")
  end,
}
