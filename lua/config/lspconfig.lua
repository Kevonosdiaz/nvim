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
  root_dir = "compile_commands.json",
  init_options = {
    usePlaceholders = true,
    completeUnimported = true,
    clangdFileStatus = true,
  },
  -- on_attach = function(client, bufnr)
  --   client.server_capabilities.semanticTokensProvider = nil
  -- end,
})

vim.lsp.enable("clangd")
vim.keymap.set("n", "ch", "<cmd>LspClangdSwitchSourceHeader<cr>", { desc = "Switch Source/Header (C/C++)" })
