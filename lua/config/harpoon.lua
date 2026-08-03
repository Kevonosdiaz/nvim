local harpoon = require 'harpoon'

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set('n', '<leader>a', function()
  harpoon:list():add()
end, { desc = 'Add to Harpoon' })
vim.keymap.set('n', '<leader>y', function()
  harpoon:list():remove()
end, { desc = 'Remove from Harpoon' })
-- vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set('n', '<leader>1', function()
  harpoon:list():select(1)
end, { desc = 'Select Harpoon 1' })
vim.keymap.set('n', '<leader>2', function()
  harpoon:list():select(2)
end, { desc = 'Select Harpoon 2' })
vim.keymap.set('n', '<leader>3', function()
  harpoon:list():select(3)
end, { desc = 'Select Harpoon 3' })
vim.keymap.set('n', '<leader>4', function()
  harpoon:list():select(4)
end, { desc = 'Select Harpoon 4' })
vim.keymap.set('n', '<leader>5', function()
  harpoon:list():select(5)
end, { desc = 'Select Harpoon 5' })

-- Toggle previous & next buffers stored within Harpoon list
-- vim.keymap.set("n", "<C-S-h>", function() harpoon:list():prev() end)
-- vim.keymap.set("n", "<C-S-l>", function() harpoon:list():next() end)

-- Workaround for loading nvim-ufo folds
require('harpoon'):extend(require('harpoon.extensions').builtins.command_on_nav 'UfoEnableFold')

-- basic telescope configuration
local conf = require('telescope.config').values
local function toggle_telescope(harpoon_files)
  local file_paths = {}
  for _, item in ipairs(harpoon_files.items) do
    table.insert(file_paths, item.value)
  end

  require('telescope.pickers')
    .new({}, {
      prompt_title = 'Harpoon',
      finder = require('telescope.finders').new_table {
        results = file_paths,
      },
      previewer = conf.file_previewer {},
      sorter = conf.generic_sorter {},
    })
    :find()
end

vim.keymap.set('n', '<C-e>', function()
  toggle_telescope(harpoon:list())
end, { desc = 'Open harpoon window' })
