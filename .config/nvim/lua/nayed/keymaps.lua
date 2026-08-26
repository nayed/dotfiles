-- KEYMAPS
--
-- See `:h vim.keymap.set()`, `:h mapping`, `:h keycodes`

-- Enable default undotree
vim.cmd("packadd nvim.undotree")
vim.keymap.set('n', '<leader>u', ':Undotree<CR>')


-- Use <Esc> to exit terminal mode
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- Map <A-j>, <A-k>, <A-h>, <A-l> to navigate between windows in any modes
-- vim.keymap.set({ 't', 'i' }, '<A-h>', '<C-\\><C-n><C-w>h')
-- vim.keymap.set({ 't', 'i' }, '<A-j>', '<C-\\><C-n><C-w>j')
-- vim.keymap.set({ 't', 'i' }, '<A-k>', '<C-\\><C-n><C-w>k')
-- vim.keymap.set({ 't', 'i' }, '<A-l>', '<C-\\><C-n><C-w>l')
-- vim.keymap.set({ 'n' }, '<A-h>', '<C-w>h')
-- vim.keymap.set({ 'n' }, '<A-j>', '<C-w>j')
-- vim.keymap.set({ 'n' }, '<A-k>', '<C-w>k')
-- vim.keymap.set({ 'n' }, '<A-l>', '<C-w>l')

-- Inspect treesitter
vim.keymap.set('n', '<M-t>', ':InspectTree<CR>')

-- Source init.lua and reload all packages
-- vim.keymap.set('n', '<F5>', function()
--   vim.cmd('source $MYVIMRC')
--   vim.cmd('packloadall')
--   print('Neovim config reloaded!')
-- end, { noremap = true, silent = true })
vim.keymap.set('n', '<F5>', ':restart<CR>')


-- Remove unused plugins
local function pack_clean()
  local unused_plugins = {}

  for _, plugin in ipairs(vim.pack.get()) do
    if not plugin.active then
      table.insert(unused_plugins, plugin.spec.name)
    end
  end

  if #unused_plugins == 0 then
    print("No unused plugins.")
    return
  end

  print("Unused: " .. table.concat(unused_plugins, ", "))
  local choice = vim.fn.confirm("Remove unused plugins?", "&Yes\n&No", 2)
  if choice == 1 then
    vim.pack.del(unused_plugins)
  end
end
vim.keymap.set("n", "<leader>pc", pack_clean, { desc = 'Clean unused vim.pack plugins' })
