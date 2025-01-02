require "core"

local custom_init_path = vim.api.nvim_get_runtime_file("lua/custom/init.lua", false)[1]

if custom_init_path then
    dofile(custom_init_path)
end

require("core.utils").load_mappings()

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

-- bootstrap lazy.nvim!
if not vim.loop.fs_stat(lazypath) then
    require("core.bootstrap").gen_chadrc_template()
    require("core.bootstrap").lazy(lazypath)
end

dofile(vim.g.base46_cache .. "defaults")
vim.opt.rtp:prepend(lazypath)
require "plugins"

-- Dumping custom stuff here
vim.diagnostic.config({ virtual_text = false, signs = false }) -- Disable warning text and signs from LSP

-- Attempt to fix Kitty over SSH
vim.opt.termguicolors = true

-- 4 size tab
vim.o.tabstop = 4      -- A TAB character looks like 4 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 4  -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4   -- Number of spaces inserted when indenting

-- Save undo history
vim.opt.undofile = true

-- Autocommand to save state of folds
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
    end
})
