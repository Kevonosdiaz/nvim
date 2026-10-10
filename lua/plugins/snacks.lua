return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      bigfile = { enabled = true },
      dashboard = { enabled = true },
      explorer = { enabled = true, git_status = true },
      input = { enabled = true },
      picker = { enabled = true },
      quickfile = { enabled = true },
      -- scope = { enabled = true },
      -- statuscolumn = { enabled = true },
      -- words = { enabled = true },
      -- notifier = { enabled = true },
      -- scroll = { enabled = true },
      -- indent = { enabled = false },
    },
    keys = {
      -- Top Pickers
      {
        "<leader><space>",
        function()
          Snacks.picker.smart()
        end,
        desc = "Smart Find Files",
      },
      {
        "<leader>,",
        function()
          Snacks.picker.buffers()
        end,
        desc = "Buffers",
      },
      -- {
      --   "<leader>/",
      --   function()
      --     Snacks.picker.grep()
      --   end,
      --   desc = "Grep",
      -- },
      {
        "<leader>:",
        function()
          Snacks.picker.command_history()
        end,
        desc = "Command History",
      },
      {
        "<leader>e",
        function()
          Snacks.picker.explorer()
        end,
        desc = "File [E]xplorer",
      },
      -- Find
      -- {
      --   "<leader>fb",
      --   function()
      --     Snacks.picker.buffers()
      --   end,
      --   desc = "Buffers",
      -- },
      {
        "<leader>fc",
        function()
          Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
        end,
        desc = "[F]ind [C]onfig File",
      },
      {
        "<leader>ff",
        function()
          Snacks.picker.files()
        end,
        desc = "[F]ind [F]iles",
      },
      {
        "<leader>fg",
        function()
          Snacks.picker.git_files()
        end,
        desc = "[F]ind [G]it Files",
      },
      {
        "<leader>fr",
        function()
          Snacks.picker.recent()
        end,
        desc = "[F]ind [R]ecent",
      },
      -- Git
      {
        "<leader>gl",
        function()
          Snacks.picker.git_log()
        end,
        desc = "[G]it [L]og",
      },
      {
        "<leader>gs",
        function()
          Snacks.picker.git_status()
        end,
        desc = "[G]it [S]tatus",
      },
      -- Search
    },
  },
}
