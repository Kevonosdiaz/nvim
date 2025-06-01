local api = require 'nvim-tree.api'

local function edit_or_open()
  local node = api.tree.get_node_under_cursor()

  if node.nodes ~= nil then
    -- expand or collapse folder
    api.node.open.edit()
  else
    -- open file
    api.node.open.edit()
    -- Close the tree if file was opened
    api.tree.close()
  end
end

-- open as vsplit on current node
local function vsplit_preview()
  local node = api.tree.get_node_under_cursor()

  if node.nodes ~= nil then
    -- expand or collapse folder
    api.node.open.edit()
  else
    -- open file as vsplit
    api.node.open.vertical()
  end

  -- Finally refocus on tree if it was lost
  api.tree.focus()
end

-- Open and close nvimtree bindings
vim.keymap.set('n', '\\', '<cmd> NvimTreeToggle <CR>', { desc = 'Toggle nvimtree' })
vim.keymap.set('n', '<leader>e', '<cmd> NvimTreeToggle <CR>', { desc = 'Toggle nvimtree' })

require('nvim-tree').setup {
  on_attach = function(bufnr)
    local opts = { buffer = bufnr }
    api.config.mappings.default_on_attach(bufnr)
    -- function for left to assign to keybindings
    local lefty = function()
      local node_at_cursor = api.tree.get_node_under_cursor()
      -- if it's a node and it's open, close
      if node_at_cursor.nodes and node_at_cursor.open then
        api.node.open.edit()
        -- else left jumps up to parent
      else
        api.node.navigate.parent()
      end
    end
    -- function for right to assign to keybindings
    local righty = function()
      local node_at_cursor = api.tree.get_node_under_cursor()
      -- if it's a closed node, open it
      if node_at_cursor.nodes and not node_at_cursor.open then
        api.node.open.edit()
      end
    end
    vim.keymap.set('n', 'h', lefty, opts)
    vim.keymap.set('n', '<Left>', lefty, opts)
    -- vim.keymap.set("n", "<Right>", righty, opts)
    -- vim.keymap.set("n", "l", righty, opts)
    vim.keymap.set('n', 'l', edit_or_open, opts)
    vim.keymap.set('n', 'L', vsplit_preview, opts)
  end,
}
