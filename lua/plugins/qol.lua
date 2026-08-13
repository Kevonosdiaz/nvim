return {
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
    duration_multiplier = 0.5,
  } },
  -- {
  --   "folke/twilight.nvim",
  --   opts = {
  --     context = 18,
  --     dimming = { alpha = 0.70 },
  --   },
  -- },
}
