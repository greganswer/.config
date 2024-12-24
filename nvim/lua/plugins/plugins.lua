-- How to configure plugins
-- https://www.lazyvim.org/configuration/plugins

local map = vim.keymap.set
local HOME = os.getenv("HOME")

return {
  -- Vim plugin for editing Ruby on Rails applications
  -- https://github.com/tpope/vim-rails
  { "tpope/vim-rails" },

  -- Highlight todo, notes, etc in comments
  -- https://github.com/folke/todo-comments.nvim
  {
    "folke/todo-comments.nvim",
    opts = { signs = false, highlight = { after = "" } },
  },

  -- Fuzzy finder
  -- https://github.com/ibhagwan/fzf-lua
  {
    "ibhagwan/fzf-lua",
    config = function()
      vim.keymap.set("n", "<C-e>", function()
        require("fzf-lua").oldfiles({ cwd_only = true })
      end, { desc = "Recent Files" })
    end,
    keys = {
      { "<leader><leader>", vim.NIL }, -- NOTE: This is needed to allow me to remap it in keymaps.lua file
      { "<C-p>", require("fzf-lua").files, desc = "Fzf Files" },
    },
  },

  -- Autocompletion
  -- https://github.com/saghen/blink.cmp
  {
    "saghen/blink.cmp",
    opts = {
      sources = {
        compat = {},
        default = { "buffer", "snippets", "lsp", "path" },
        cmdline = {},
      },
      keymap = {
        ["<C-k>"] = { "select_prev", "fallback" },
        ["<C-j>"] = { "select_next", "fallback" },
      },
    },
  },

  -- https://github.com/nvim-treesitter/nvim-treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "RRethy/nvim-treesitter-endwise" },
    opts = function(_, opts)
      opts.auto_install = true -- Auto install languages that are not installed
      opts.endwise = { enable = true }
      opts.indent = { enable = true, disable = { "yaml", "ruby" } }
    end,
  },

  -- Tmux navigation in NeoVim
  -- https://github.com/christoomey/vim-tmux-navigator
  {
    "christoomey/vim-tmux-navigator",
    keys = {
      { "<C-\\>", "<cmd>TmuxNavigatePrevious<cr>", desc = "Go to the previous pane" },
      { "<C-h>", "<cmd>TmuxNavigateLeft<cr>", desc = "Got to the left pane" },
      { "<C-j>", "<cmd>TmuxNavigateDown<cr>", desc = "Got to the down pane" },
      { "<C-k>", "<cmd>TmuxNavigateUp<cr>", desc = "Got to the up pane" },
      { "<C-l>", "<cmd>TmuxNavigateRight<cr>", desc = "Got to the right pane" },
    },
  },

  -- Use one buffer instead of multiple
  -- https://github.com/akinsho/bufferline.nvim
  { "akinsho/bufferline.nvim", enabled = false },

  -- Neovim plugin for splitting/joining blocks of code like arrays, hashes, statements, objects, dictionaries, etc.
  -- https://github.com/Wansmer/treesj
  {
    "Wansmer/treesj",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      map("n", "<leader>cm", require("treesj").toggle, { desc = "split/join node under cursor" })
    end,
  },

  -- https://github.com/mfussenegger/nvim-lint
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters = {
        ["markdownlint-cli2"] = {
          args = { "--config", HOME .. "/.markdownlint-cli2.yaml", "--" },
        },
      },
    },
  },
}
