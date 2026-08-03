return {
  {
    'rcarriga/nvim-notify',
    config = function()
      require('notify').setup {
        background_color = '#181825',
      }
      vim.notify = require 'notify'
    end,
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function() vim.cmd [[colorscheme catppuccin-nvim]] end,
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', 'catppuccin/nvim' },
    config = function() require 'config.lualine' end,
  },
}
