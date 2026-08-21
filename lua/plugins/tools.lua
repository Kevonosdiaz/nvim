return {
  {
    "nvim-telescope/telescope.nvim",
    version = "*",
    dependencies = {
      "nvim-lua/plenary.nvim",
      -- optional but recommended
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
    },
    config = function()
      require("config.telescope")
    end,
  },
  {
    "stevearc/aerial.nvim",
    opts = {},
    -- Optional dependencies
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
  },
  {
    "stevearc/overseer.nvim",
    ---@module 'overseer'
    ---@type overseer.SetupOpts
    opts = {},
  },
  {
    "stevearc/quicker.nvim",
    ft = "qf",
    ---@module "quicker"
    ---@type quicker.SetupOptions
    opts = {},
  },
  {
    "basola21/PDFview",
    lazy = false,
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      vim.api.nvim_create_autocmd("BufReadPost", {
        pattern = "*.pdf",
        callback = function()
          local file_path = vim.api.nvim_buf_get_name(0)
          require("pdfview").open(file_path)
        end,
      })
    end,
  },
}
