local M = {}

M.lspconfig = {
  plugin = true,
  n = {
    ['<leader>ts'] = {
      '<cmd> LspStop <CR>',
      'Stop LSP',
    },
    ['<leader>tc'] = {
      '<cmd> LspStart <CR>',
      'Start/Continue LSP',
    },
  },
}

return M
