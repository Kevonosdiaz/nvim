-- [Basic Vim Settings]

-- Set <space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = true
vim.opt.termguicolors = true
vim.o.mouse = "a"
vim.o.number = true
vim.o.relativenumber = true
vim.o.showmode = false
vim.o.undofile = true
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.signcolumn = "yes"
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.o.inccommand = "split"
vim.o.cursorline = true
vim.o.scrolloff = 14
vim.o.confirm = true

-- Disable netrw for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Shared clipboard with OS
vim.schedule(function()
  vim.o.clipboard = "unnamedplus"
end)

-- Use treesitter folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldtext = ""

-- 4 size tab, expand tabs to spaces
vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.breakindent = true

-- Specific tabs/format for TeX
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "tex", "plaintex" }, -- You can include other LaTeX-related filetypes here
  callback = function()
    vim.opt_local.tabstop = 2 -- A tab character is 2 columns wide
    vim.opt_local.shiftwidth = 2 -- Auto-indent commands (like >>) use 2 spaces
    vim.opt_local.softtabstop = 2 -- When pressing Tab in insert mode, use 2 spaces
    vim.opt_local.expandtab = true -- Use spaces instead of actual tab characters
    -- Disable auto-indenting options specifically for this buffer
    vim.opt_local.autoindent = true
    vim.opt_local.smartindent = false
    vim.opt_local.indentexpr = ""
  end,
})

-- Autocommands to save state of folds
vim.api.nvim_create_autocmd({ "BufWinLeave" }, {
  pattern = "?*",
  callback = function()
    vim.cmd([[silent! mkview 1]])
  end,
})
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  pattern = "?*",
  callback = function()
    vim.cmd([[silent! loadview 1]])
  end,
})

-- Reopen file at same location
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = { "*" },
  callback = function()
    if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
      vim.api.nvim_exec("normal! g'\"", false)
    end
  end,
})

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.hl.hl_op()
  end,
})

-- Terminal shortcuts
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- NOTE: float-term.lua in ./lua/custom adds <space>ot for floating terminal toggle
vim.keymap.set("n", "<space>oht", function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 12)
  vim.cmd("normal i")
end, { desc = "[O]pen [H]orizontal [T]erminal split" })

vim.keymap.set("n", "<space>ovt", function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.api.nvim_win_set_width(0, 64)
  vim.cmd("normal i")
end, { desc = "[O]pen [V]ertical [T]erminal split" })

-- [Lazy, Plugins, and Stuff]
require("config.lazy")
-- vim.cmd([[colorscheme luna]])
-- vim.cmd([[colorscheme doom-one]])
vim.cmd([[colorscheme catppuccin-mocha]])

-- Floating terminal mini plugin
require("float-term")

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp", "h", "hpp" },
  callback = function()
    vim.treesitter.start()
    -- vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
    -- vim.wo[0][0].foldmethod = "expr"
  end,
})

require("aerial").setup({
  -- optionally use on_attach to set keymaps when aerial has attached to a buffer
  on_attach = function(bufnr)
    -- Jump forwards/backwards with '{' and '}'
    vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
    vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
  end,
})

require("oil").setup()
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Rebind <C-L> clear command to avoid conflict with smart-splits
vim.keymap.set("n", "<C-[>", function()
  vim.cmd("nohlsearch")
  vim.cmd("redraw")

  local mc_ns = vim.api.nvim_create_namespace("nvim.multicursor")
  vim.api.nvim_buf_clear_namespace(0, mc_ns, 0, -1)
end, { desc = "Clear highlights, screen, and multicursors" })
