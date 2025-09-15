-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'R-nvim/R.nvim',
    -- Only required if you also set defaults.lazy = true
    lazy = false,
    -- R.nvim is still young and we may make some breaking changes from time
    -- to time (but also bug fixes all the time). If configuration stability
    -- is a high priority for you, pin to the latest minor version, but unpin
    -- it and try the latest version before reporting an issue:
    -- version = "~0.1.0"
    config = function()
      -- Create a table with the options to be passed to setup()
      ---@type RConfigUserOpts
      local opts = {
        hook = {
          on_filetype = function()
            vim.api.nvim_buf_set_keymap(0, 'n', '<Enter>', '<Plug>RDSendLine', {})
            vim.api.nvim_buf_set_keymap(0, 'v', '<Enter>', '<Plug>RSendSelection', {})
          end,
        },
        R_args = { '--quiet', '--no-save' },
        min_editor_width = 72,
        rconsole_width = 78,
        objbr_mappings = { -- Object browser keymap
          c = 'class', -- Call R functions
          ['<localleader>gg'] = 'head({object}, n = 15)', -- Use {object} notation to write arbitrary R code.
          v = function()
            -- Run lua functions
            require('r.browser').toggle_view()
          end,
        },
        disable_cmds = {
          'RClearConsole',
          'RCustomStart',
          'RSPlot',
          'RSaveClose',
        },
      }
      -- Check if the environment variable "R_AUTO_START" exists.
      -- If using fish shell, you could put in your config.fish:
      -- alias r "R_AUTO_START=true nvim"
      if vim.env.R_AUTO_START == 'true' then
        opts.auto_start = 'on startup'
        opts.objbr_auto_start = true
      end
      require('r').setup(opts)
    end,
  },
  {
    'R-nvim/cmp-r',
    {
      'hrsh7th/nvim-cmp',
      config = function()
        require('cmp').setup { sources = { { name = 'cmp_r' } } }
        require('cmp_r').setup {}
      end,
    },
  },
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
    'm4xshen/hardtime.nvim',
    lazy = false,
    dependencies = { 'MunifTanjim/nui.nvim' },
    opts = {},
  },
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
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
  {
    'goolord/alpha-nvim',
    -- dependencies = { 'echasnovski/mini.icons' },
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local startify = require 'alpha.themes.startify'
      -- available: devicons, mini, default is mini
      -- if provider not loaded and enabled is true, it will try to use another provider
      startify.file_icons.provider = 'devicons'
      require('alpha').setup(startify.config)
    end,
  },
  {
    'kevinhwang91/nvim-ufo',
    lazy = false,
    dependencies = { 'kevinhwang91/promise-async' },
    config = function()
      require 'custom.configs.nvim-ufo'
    end,
  },
  {
    'ThePrimeagen/harpoon',
    lazy = false,
    branch = 'harpoon2',
    -- nvim-ufo just for workaround config...
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim', 'kevinhwang91/nvim-ufo' },
    config = function()
      require 'custom.configs.harpoon'
    end,
  },
  {
    'folke/zen-mode.nvim',
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  {
    'nvim-orgmode/orgmode',
    event = 'VeryLazy',
    ft = { 'org' },
    config = function()
      -- Setup orgmode
      require('orgmode').setup {
        org_agenda_files = '~/orgfiles/**/*',
        org_default_notes_file = '~/orgfiles/refile.org',
      }

      -- NOTE: If you are using nvim-treesitter with ~ensure_installed = "all"~ option
      -- add ~org~ to ignore_install
      -- require('nvim-treesitter.configs').setup({
      --   ensure_installed = 'all',
      --   ignore_install = { 'org' },
      -- })
    end,
  },
  {
    'lervag/vimtex',
    lazy = false, -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
      -- VimTeX configuration goes here, e.g.
      vim.g.vimtex_view_method = 'zathura'
    end,
    keys = {
      { '<localLeader>l', '', desc = '+vimtex' },
    },
  },
  {
    'kdheepak/lazygit.nvim',
    lazy = true,
    cmd = {
      'LazyGit',
      'LazyGitConfig',
      'LazyGitCurrentFile',
      'LazyGitFilter',
      'LazyGitFilterCurrentFile',
    },
    -- optional for floating window border decoration
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { '<leader>lg', '<cmd>LazyGit<cr>', desc = 'LazyGit' },
    },
  },
  {
    'christoomey/vim-tmux-navigator',
    cmd = {
      'TmuxNavigateLeft',
      'TmuxNavigateDown',
      'TmuxNavigateUp',
      'TmuxNavigateRight',
      'TmuxNavigatePrevious',
      'TmuxNavigatorProcessList',
    },
    keys = {
      { '<c-h>', '<cmd><C-U>TmuxNavigateLeft<cr>' },
      { '<c-j>', '<cmd><C-U>TmuxNavigateDown<cr>' },
      { '<c-k>', '<cmd><C-U>TmuxNavigateUp<cr>' },
      { '<c-l>', '<cmd><C-U>TmuxNavigateRight<cr>' },
      { '<c-\\>', '<cmd><C-U>TmuxNavigatePrevious<cr>' },
    },
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', 'catppuccin/nvim' },
    config = function()
      require 'custom.configs.lualine'
    end,
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      vim.cmd [[colorscheme catppuccin-mocha]]
    end,
  },
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require 'custom.configs.bufferline'
    end,
  },
  {
    'nvim-tree/nvim-tree.lua',
    config = function()
      require 'custom.configs.nvimtree'
    end,
    opts = function()
      require 'custom.configs.nvimtree-opts'
    end,
  },
  { -- Autoformat
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = {}
        local lsp_format_opt
        if disable_filetypes[vim.bo[bufnr].filetype] then
          lsp_format_opt = 'never'
        else
          lsp_format_opt = 'fallback'
        end
        return {
          timeout_ms = 500,
          lsp_format = lsp_format_opt,
        }
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        -- Conform can also run multiple formatters sequentially
        python = { 'yapf' },
        cpp = { 'clang-format' },
        markdown = { 'deno_fmt' },
        --
        -- You can use 'stop_after_first' to run the first available formatter from the list
        -- javascript = { "prettierd", "prettier", stop_after_first = true },
      },
      formatters = {
        clang_format = {
          prepend_args = { '--style=file' },
        },
        yapf = {
          prepend_args = { '--style', 'pep8' },
        },
      },
    },
  },
}
