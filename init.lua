-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

local lspconfig = require("lspconfig")
lspconfig.gopls.setup({})

vim.cmd([[autocmd BufWritePre *.go lua vim.lsp.buf.format({ async = true })]])

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    vim.lsp.buf.code_action({ context = { only = { "source.organizeImports" } }, apply = true })
  end,
})

lspconfig.emmet_language_server.setup({
  filetypes = {
    "css",
    "eruby",
    "html",
    "javascript",
    "javascriptreact",
    "less",
    "sass",
    "scss",
    "svelte",
    "pug",
    "typescriptreact",
    "vue",
  },
  init_options = {
    --- @type table<string, any> https://docs.emmet.io/customization/preferences/
    preferences = {},
    --- @type "always" | "never" defaults to `"always"`
    showexpandedabbreviation = "always",
    --- @type boolean defaults to `true`
    showabbreviationsuggestions = true,
    --- @type boolean defaults to `false`
    showsuggestionsassnippets = false,
    --- @type table<string, any> https://docs.emmet.io/customization/syntax-profiles/
    syntaxprofiles = {},
    --- @type table<string, string> https://docs.emmet.io/customization/snippets/#variables
    variables = {},
    --- @type string[]
    excludelanguages = {},
  },
})
