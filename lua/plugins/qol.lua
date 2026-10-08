return {
  {
    "mrjones2014/smart-splits.nvim",
    lazy = false,
    config = function()
      require("config.smart-splits")
    end,
  },
  {
    "m4xshen/hardtime.nvim",
    lazy = false,
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {
      max_time = 2000,
      max_count = 15,
      disable_mouse = false,
      timeout = 2500,
    },
  },
  -- {
  --   "ThePrimeagen/harpoon",
  --   lazy = false,
  --   branch = "harpoon2",
  --   -- nvim-ufo just for workaround config...
  --   dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim", "kevinhwang91/nvim-ufo" },
  --   config = function()
  --     require("config.harpoon")
  --   end,
  -- },
  {
    "folke/zen-mode.nvim",
    opts = {},
  },
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
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
      -- stylua: ignore
      keys = {
        { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
        { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
        { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
        { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
        { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
      },
  },
  { "nvim-mini/mini.surround", version = false, opts = {} },
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
  -- {
  --   'lukas-reineke/indent-blankline.nvim',
  --   main = "ibl",
  --   --@module "ibl"
  --   ---@type ibl.config
  --   opts = {},
  -- },
  {
    "mfussenegger/nvim-lint",
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
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
  -- {
  --   "folke/twilight.nvim",
  --   opts = {
  --     context = 18,
  --     dimming = { alpha = 0.70 },
  --   },
  -- },
}
