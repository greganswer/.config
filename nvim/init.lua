-- TODO: Move this somewhere
-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- Note: Keep these in order
require("config.options")
require("config.mappings")
require("config.autocmds")
require("config.utils")
require("config.lazy")

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
