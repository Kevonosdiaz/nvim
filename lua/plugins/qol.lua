return {
  {
    "mrjones2014/smart-splits.nvim",
    lazy = false,
    config = function()
      require("config.smart-splits")
    end,
  },
  -- {
  --   "m4xshen/hardtime.nvim",
  --   lazy = false,
  --   dependencies = { "MunifTanjim/nui.nvim" },
  --   opts = {
  --     max_time = 2000,
  --     max_count = 15,
  --     disable_mouse = false,
  --     timeout = 2500,
  --   },
  -- },
  -- {
  --   "folke/zen-mode.nvim",
  --   opts = {},
  -- },
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("config.bufferline")
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("config.nvimtree")
    end,
    opts = function()
      require("config.nvimtree-opts")
    end,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
    opts = {},
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {},
  },
  {
    "NMAC427/guess-indent.nvim",
    opts = {},
  },
  {
    "mfussenegger/nvim-lint",
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },
  { "karb94/neoscroll.nvim", opts = {
    duration_multiplier = 0.3,
  } },
}
