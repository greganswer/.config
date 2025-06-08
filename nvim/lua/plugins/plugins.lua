-- How to configure plugins
-- https://www.lazyvim.org/configuration/plugins

local map = vim.keymap.set
local HOME = os.getenv("HOME")

return {
  -- navigate your code with search labels, enhanced character motions, and Treesitter integration.
  -- https://github.com/folke/flash.nvim
  { "folke/flash.nvim", enabled = false }, -- Disabled so that I can use "s" key normally

  -- Use one buffer instead of multiple
  -- https://github.com/akinsho/bufferline.nvim
  { "akinsho/bufferline.nvim", enabled = false },

  -- I tried to use this one but was unable to use things like "binding.pry" easily
  -- https://github.com/nvim-neotest/neotest
  { "nvim-neotest/neotest", enabled = false },

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
    opts = {
      oldfiles = {
        include_current_session = true, -- load old buffers in the current session
        cwd_only = true,
      },
      previewers = {
        builtin = {
          syntax_limit_b = 1024 * 100, -- Only show files less than 100KB
        },
      },
    },
    keys = {
      { "<leader><leader>", vim.NIL }, -- NOTE: This is needed to allow me to remap it in keymaps.lua file
      { "<C-p>", require("fzf-lua").files, desc = "Fzf Files" },
      { "<C-e>", require("fzf-lua").oldfiles, desc = "Fzf Buffers" },
    },
  },

  -- browse the file system
  -- https://github.com/nvim-neo-tree/neo-tree.nvim
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = { visible = true }, -- Show hidden files
      },
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
        ["<Tab>"] = { "select_and_accept" },
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

  -- LSP config
  -- https://github.com/neovim/nvim-lspconfig
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        typos_lsp = { enabled = true }, --NOTE: Set to false if this type of spell checking becomes annoying.
        tsserver = { enabled = true },
        ts_ls = { enabled = false },
        vtsls = { enabled = false },
      },
      setup = {
        tsserver = function(_, opts)
          local lspconfig = require("lspconfig")
          lspconfig.tsserver.setup({
            init_options = {
              preferences = {
                disableSuggestions = true,
              },
            },
          })
          return true
        end,
      },
    },
  },

  -- https://github.com/williamboman/mason.nvim/issues/1777#issuecomment-2579045185
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = true,
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
      require("mason").setup({})
      require("mason-lspconfig").setup({})
      require("mason-lspconfig").setup_handlers({
        ruby_lsp = function()
          require("lspconfig").ruby_lsp.setup({
            -- Handle different Ruby versions per project
            cmd_env = { BUNDLE_GEMFILE = vim.fn.getenv("GLOBAL_GEMFILE") },
          })
        end,
      })
    end,
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

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        sql = { "sql_formatter" }, -- https://github.com/sql-formatter-org/sql-formatter

        -- NOTE: prettierd is supposedly faster than regular prettier
        javascript = { "prettierd", "prettier", stop_after_first = true },
        typescript = { "prettierd", "prettier", stop_after_first = true },
        javascriptreact = { "prettierd", "prettier", stop_after_first = true },
        typescriptreact = { "prettierd", "prettier", stop_after_first = true },
        css = { "prettierd", "prettier", stop_after_first = true },
        html = { "prettierd", "prettier", stop_after_first = true },
        json = { "prettierd", "prettier", stop_after_first = true },
        -- yaml = { "prettierd", "prettier", stop_after_first = true },
        -- yml = { "prettierd", "prettier", stop_after_first = true },
        graphql = { "prettierd", "prettier", stop_after_first = true },
      },
      formatters = {
        sql_formatter = {
          args = { "--config", HOME .. "/.config/.sql-formatter.json", "--" },
        },
      },
    },
  },

  -- {
  --   "sql-formatter-org/sql-formatter",
  --   config = function(_, opts)
  --     opts.keywordCase = "upper"
  --   end,
  -- },

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

  -- easily interact with tmux from vim
  -- https://github.com/preservim/vimux
  { "preservim/vimux" },

  -- A Vim wrapper for running tests on different granularities.
  -- https://github.com/vim-test/vim-test
  -- https://github.com/skbolton/titan/blob/main/nvim/nvim/lua/testing.lua
  {
    "vim-test/vim-test",
    config = function()
      vim.g["test#strategy"] = "vimux"
      vim.g.VimuxOrientation = "v"
      vim.g.VimuxUseNearest = 0
      -- Keymap
      vim.keymap.set("n", "<Leader>t", "", { desc = "+test" })
      vim.keymap.set("n", "<Leader>ta", ":TestSuite <CR>", { desc = "All", noremap = true, silent = true })
      vim.keymap.set("n", "<Leader>tf", ":TestFile <CR>", { desc = "File", noremap = true, silent = true })
      vim.keymap.set("n", "<Leader>tn", ":TestNearest <CR>", { desc = "Nearest", noremap = true, silent = true })
      vim.keymap.set("n", "<Leader>tl", ":TestLast <CR>", { desc = "Last", noremap = true, silent = true })
      vim.keymap.set("n", "<Leader>j", ":TestLast <CR>", { desc = "Test Last", noremap = true, silent = true })
      vim.keymap.set("n", "<Leader>tv", ":TestVisit <CR>", { desc = "Visit Last", noremap = true, silent = true })
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

  -- Neovim plugin for splitting/joining blocks of code like arrays, hashes, statements, objects, dictionaries, etc.
  -- https://github.com/Wansmer/treesj
  {
    "Wansmer/treesj",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      map("n", "<leader>rj", require("treesj").join, { desc = "Join node under cursor" })
      map("n", "<leader>rs", require("treesj").split, { desc = "Split node under cursor" })
    end,
  },

  -- Solve LeetCode problems within Neovim
  -- Login using: https://github.com/kawre/leetcode.nvim/issues/95#issuecomment-2071058406
  -- https://github.com/kawre/leetcode.nvim
  {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html",
    dependencies = {
      "ibhagwan/fzf-lua",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "tree-sitter/tree-sitter-html",
    },
    opts = function(_, opts)
      opts.lang = "python3"
      opts.injector = {
        ["python3"] = {
          before = {
            "from typing import List",
          },
        },
      }
      map("n", "<leader>k", "", { desc = "Leetcode" })
      map("n", "<leader>kr", ":Leet run<cr>", { desc = "Run" })
      map("n", "<leader>ks", ":Leet submit<cr>", { desc = "Submit" })
      map("n", "<leader>kp", ":Leet list<cr>", { desc = "Problems" })
      map("n", "<leader>kl", ":Leet lang<cr>", { desc = "Language" })
      map("n", "<leader>ko", ":Leet open<cr>", { desc = "Browser" })
      map("n", "<leader>kt", ":Leet reset<cr>", { desc = "Reset" })
      map("n", "<leader>ky", ":Leet yank<cr>", { desc = "Yank" })
      map("n", "<leader>ku", ":Leet cache update<cr>", { desc = "Cache update" })
    end,
  },

  -- https://github.com/CopilotC-Nvim/CopilotChat.nvim
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    opts = {
      mappings = {
        reset = {
          normal = "<C-q>",
          insert = "<C-q>",
        },
      },
    },
  },
}
