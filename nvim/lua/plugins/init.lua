return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require "configs.conform",
  },

  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
    },
  },

  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    opts = {
      renderer = {
        icons = {
          git_placement = "after",
        },
      },
      diagnostics = {
        enable = true,
      },
    },
  },

  {
    "kevinhwang91/nvim-bqf",
    ft = { "qf" },
    opts = {
      auto_resize_height = true,
    },
  },

  {
    "echasnovski/mini.diff",
    version = false,
  },

  {
    "antosha417/nvim-lsp-file-operations",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-tree.lua",
    },
    config = function()
      require("lsp-file-operations").setup()
    end,
  },

  {
    -- See https://codecompanion.olimorris.dev/usage/chat-buffer/
    "olimorris/codecompanion.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "echasnovski/mini.diff",
    },
    opts = require "configs.codecompanion",
  },

  {
    "OXY2DEV/markview.nvim",
    lazy = false,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "echasnovski/mini.icons",
    },
    ft = { "markdown", "codecompanion" },
    opts = {
      preview = {
        filetypes = { "markdown", "codecompanion" },
        ignore_buftypes = {},
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    -- Show trailing spaces
    "kaplanz/retrail.nvim",
    lazy = false,
    opts = {}, -- calls `setup` using provided `opts`
  },

  {
    "rachartier/tiny-glimmer.nvim",
    event = "VeryLazy",
    opts = {},
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "css",
        "html",
        "hyprlang",
        "just",
        "lua",
        "markdown",
        "rust",
        "terraform",
        "typescript",
        "typst",
        "vim",
        "vimdoc",
        "yaml",
      },
    },
  },
}
