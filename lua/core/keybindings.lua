local function map(mode, l, r, opts)
  opts = opts or {}
  vim.keymap.set(mode, l, r, opts)
end

-- map("n", "<C-u>", "<C-u>zz")
-- map("n", "<C-d>", "<C-d>zz")

-- Clear highlights on search when pressing <Esc> in normal mode
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.hl.hl_op()
  end,
})

-- Rebind <C-L> clear command to avoid conflict with smart-splits
map("n", "<C-[>", function()
  vim.cmd("nohlsearch")
  vim.cmd("redraw")

  local mc_ns = vim.api.nvim_create_namespace("nvim.multicursor")
  vim.api.nvim_buf_clear_namespace(0, mc_ns, 0, -1)
end, { desc = "Clear highlights, screen, and multicursors" })

-- Terminal shortcuts
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- NOTE: float-term.lua in ../lua/custom adds <space>ot for floating terminal toggle
map("n", "<space>oht", function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 12)
  vim.cmd("normal i")
end, { desc = "[O]pen [H]orizontal [T]erminal split" })

map("n", "<space>ovt", function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.api.nvim_win_set_width(0, 64)
  vim.cmd("normal i")
end, { desc = "[O]pen [V]ertical [T]erminal split" })

-- File explorer
map("n", "\\", "<cmd> NvimTreeToggle <CR>", { desc = "Toggle nvimtree" })
map("n", "<leader>e", "<cmd> NvimTreeToggle <CR>", { desc = "Toggle nvimtree" })
