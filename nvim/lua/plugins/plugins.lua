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
        -- compat = {}, -- TODO: Delete if not needed.
        default = { "buffer", "snippets", "lsp", "path" },
        -- cmdline = {}, -- TODO: Delete if not needed.
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

  -- LSP config
  -- https://github.com/neovim/nvim-lspconfig
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        typos_lsp = { enabled = true }, --NOTE: Set to false if this type of spell checking becomes annoying.
      },
    },
  },

  -- Linting
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

  -- Spell checking
  -- https://github.com/tekumara/typos-lsp
  {
    "tekumara/typos-lsp",
  },

  -- Outline for the current buffer
  -- https://github.com/hedyhli/outline.nvim
  {
    "hedyhli/outline.nvim",
    config = function()
      map("n", "<leader>co", "<cmd>Outline<CR>", { desc = "Outline" })
      require("outline").setup({
        outline_window = {
          position = "left", -- Where to open the split window: right/left
          show_numbers = true,
          show_relative_numbers = true,
        },
      })
    end,
  },

  -- Refactoring
  -- https://github.com/ThePrimeagen/refactoring.nvim
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    lazy = false,
    config = function()
      require("refactoring").setup()
      map("n", "<leader>r", "", { desc = "+refactor" })
      map("x", "<leader>re", ":Refactor extract ", { desc = "Extract" })
      map("x", "<leader>rf", ":Refactor extract_to_file ", { desc = "Extract to file" })
      map("x", "<leader>rv", ":Refactor extract_var ", { desc = "Extract var" })
      map({ "n", "x" }, "<leader>ri", ":Refactor inline_var", { desc = "Inline var" })
      map("n", "<leader>rI", ":Refactor inline_func", { desc = "Inline func" })
      map("n", "<leader>rb", ":Refactor extract_block", { desc = "Extract block" })
      map("n", "<leader>rbf", ":Refactor extract_block_to_file", { desc = "Extract block to file" })
    end,
  },
}
