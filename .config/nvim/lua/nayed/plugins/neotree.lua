vim.keymap.set('n', '<space>n', ':Neotree toggle<CR>')
vim.keymap.set('n', '<space>d', ':Neotree diagnostics toggle bottom<CR>', { desc = 'Toggle diagnostics (bottom)' })

--local bg = "#fbf1c7" -- match your fzf-lua bg for consistency
local bg = "#f2e5bc"

local function set_neotree_hl()
  vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = bg })
  vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = bg }) -- non-current window
  vim.api.nvim_set_hl(0, "NeoTreeEndOfBuffer", { bg = bg })

  vim.api.nvim_set_hl(0, "NeoTreeFileName", { fg = "#282828" })
  vim.api.nvim_set_hl(0, "NeoTreeFileNameOpened", { fg = "#665c54", italic = true })
  vim.api.nvim_set_hl(0, "NeoTreeDirectoryName", { fg = "#076678", bold = true })
  vim.api.nvim_set_hl(0, "NeoTreeDirectoryIcon", { fg = "#076678" })
  vim.api.nvim_set_hl(0, "NeoTreeRootName", { fg = "#af3a03", bold = true })

  vim.api.nvim_set_hl(0, "NeoTreeIndentMarker", { fg = "#bdae93" })
  vim.api.nvim_set_hl(0, "NeoTreeCursorLine", { bg = "#ebdbb2" })

  -- git status colors (if you have gitsigns integration showing modified/staged icons)
  vim.api.nvim_set_hl(0, "NeoTreeGitModified", { fg = "#d79921" })
  vim.api.nvim_set_hl(0, "NeoTreeGitAdded", { fg = "#98971a" })
  vim.api.nvim_set_hl(0, "NeoTreeGitDeleted", { fg = "#cc241d" })
  vim.api.nvim_set_hl(0, "NeoTreeGitUntracked", { fg = "#928374" })
end

require('neo-tree').setup({
  sources = { 'filesystem', 'buffers', 'git_status', 'diagnostics' },
  diagnostics = {
    show_unloaded = true, -- key option
  },
  filesystem = {
    filtered_items = {
      hide_dotfiles = false
    }
  }
})

set_neotree_hl()
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "gruvbox",
  callback = set_neotree_hl,
})
