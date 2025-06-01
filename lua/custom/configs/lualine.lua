local lualine = require 'lualine'

lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'catppuccin',
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    always_show_tabline = false,
    globalstatus = false,
    refresh = {
      statusline = 100,
      tabline = 100,
      winbar = 100,
    },
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch' },
    lualine_c = { 'filename' },
    lualine_x = {
      'progress',
    },
    lualine_y = {
      "os.date('%-I:%-M')",
    },
    lualine_z = { 'location' },
  },
  inactive_sections = {},
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {},
}

vim.opt.laststatus = 3
