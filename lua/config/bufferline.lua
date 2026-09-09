require("bufferline").setup({
  options = {
    themable = true,
  },
  -- Fill in the gap in rest of tab line empty space
  highlights = {
    fill = {
      -- Catppuccin Mocha
      -- fg = "#1E1E2F",
      -- bg = "#1E1E2F",

      -- luna.nvim
      -- bg = "#000000",

      -- doom-one
      bg = "#282C34",
    },
  },
})

vim.keymap.set("n", "<Tab>", "<cmd> BufferLineCycleNext <CR>", { desc = "Cycle buffers" })
vim.keymap.set("n", "<S-Tab>", "<cmd> BufferLineCyclePrev <CR>", { desc = "Cycle buffers" })
vim.keymap.set("n", "<leader>x", "<cmd> bp|sp|bn|bd! <CR>", { desc = "Close buffer" })
vim.keymap.set("n", "<S-b>", "<cmd> enew <CR>", { desc = "Spawn new buffer" })
