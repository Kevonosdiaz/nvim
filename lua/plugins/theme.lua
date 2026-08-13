return {
  {
    "rcarriga/nvim-notify",
    config = function()
      require("notify").setup({
        background_color = "#181825",
      })
      vim.notify = require("notify")
    end,
  },
  {
    "sainnhe/everforest",
    priority = 1000,
  },
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    -- config = function()
    --   vim.cmd([[colorscheme catppuccin-nvim]])
    -- end,
  },
  {
    "wtfox/luna.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = false,
      accent = 1.0,
      plugins = {
        all = true,
        auto = true,
      },
      on_colors = function(colors) end,
      on_highlights = function(highlights, colors) end,
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("config.lualine")
    end,
  },
}
