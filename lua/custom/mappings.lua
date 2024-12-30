local M = {}

M.lspconfig = {
    plugin = true,
    n = {
        ["<leader>ts"] = {
            "<cmd> LspStop <CR>",
            "Stop LSP",
        },
        ["<leader>tc"] = {
            "<cmd> LspStart <CR>",
            "Start/Continue LSP",
        }
    }
}

M.dap = {
    plugin = true,
    n = {
        ["<leader>db"] = {
            "<cmd> DapToggleBreakpoint <CR>",
            "Add breakpoint at line",
        },
        ["<leader>dr"] = {
            "<cmd> DapContinue <CR>",
            "Start or continue the debugger",
        }
    }
}

return M
