-- Includes vim settings and keybindings
require("core")

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

-- Enable mini.nvim plugins
require("mini.ai").setup()
require("mini.surround").setup()
require("mini.bracketed").setup()
