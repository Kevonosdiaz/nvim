local clang_cmd = {
  "clangd",
  "--background-index",
  "--clang-tidy",
  "--header-insertion=never",
  "--completion-style=detailed",
  "--function-arg-placeholders",
  "--fallback-style=llvm",
  "-j=32",
  "--compile-commands-dir=.",
}
-- configure clangd server
vim.lsp.config("clangd", {
  cmd = clang_cmd,
  init_options = {
    usePlaceholders = true,
    completeUnimported = true,
    clangdFileStatus = true,
  },
  -- on_attach = function(client, bufnr)
  --   -- client.server_capabilities.semanticTokensProvider = nil
  --   if client:supports_method("textDocument/inlayHint", bufnr) then
  --     vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
  --   end
  -- end,
  -- on_attach = function(client, bufnr)
  --   client.server_capabilities.semanticTokensProvider = nil
  -- end,
})

vim.lsp.enable("clangd")
vim.keymap.set("n", "ch", "<cmd>LspClangdSwitchSourceHeader<cr>", { desc = "Switch Source/Header (C/C++)" })

-- basedpyright server for python
vim.lsp.enable("basedpyright")

-- Enable inlay hints for any supporting server
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client:supports_method("textDocument/inlayHint", args.buf) then
      vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
    end
  end,
})

vim.keymap.set("n", "<leader>ih", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = 0 }), { bufnr = 0 })
end, { desc = "Toggle inlay hints" })
