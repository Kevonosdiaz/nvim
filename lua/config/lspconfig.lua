local base = require 'plugins.configs.lspconfig'
local on_attach = base.on_attach
local capabilities = base.capabilities

local config = require 'lspconfig'

config.clangd.setup {
  -- autostart = false,
  settings = {
    clangd = {
      InlayHints = {
        Designators = true,
        Enabled = true,
        ParameterNames = true,
        DeducedTypes = true,
      },
      fallbackFlags = { '-std=c++17' },
    },
  },
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    if client.server_capabilities.inlayHintProvider then
      vim.lsp.buf.inlay_hint(bufnr, true)
    end
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
}
