local colors = require('nayed.plugins.ui.shared').gruv_light

require('neogit').setup {
}

local function set_neogit_hl()
  -- Diff hunk body
  vim.api.nvim_set_hl(0, 'NeogitDiffContext', { bg = colors.lsp_bg, fg = colors.fg })
  vim.api.nvim_set_hl(0, 'NeogitDiffContextHighlight', { bg = colors.lsp_bg, fg = colors.fg })
  -- vim.api.nvim_set_hl(0, 'NeogitDiffAdd', { bg = colors.green_bg, fg = colors.green })
  -- vim.api.nvim_set_hl(0, 'NeogitDiffAddHighlight', { bg = colors.green, fg = colors.bg, bold = true })
  -- vim.api.nvim_set_hl(0, 'NeogitDiffDelete', { bg = colors.red_bg, fg = colors.red })
  -- vim.api.nvim_set_hl(0, 'NeogitDiffDeleteHighlight', { bg = colors.red, fg = colors.bg, bold = true })
  vim.api.nvim_set_hl(0, 'NeogitHunkHeader', { bg = colors.grey, fg = colors.bg })
  vim.api.nvim_set_hl(0, 'NeogitHunkHeaderHighlight', { bg = colors.grey, fg = colors.bg, bold = true })

  -- Status buffer file-state labels (this is your "deleted" text specifically)
  vim.api.nvim_set_hl(0, 'NeogitChangeModified', { fg = colors.yellow })
  vim.api.nvim_set_hl(0, 'NeogitChangeAdded', { fg = colors.green })
  vim.api.nvim_set_hl(0, 'NeogitChangeDeleted', { fg = colors.red })
  vim.api.nvim_set_hl(0, 'NeogitChangeRenamed', { fg = colors.blue })
  vim.api.nvim_set_hl(0, 'NeogitChangeCopied', { fg = colors.purple })
  vim.api.nvim_set_hl(0, 'NeogitChangeUpdated', { fg = colors.yellow })
  vim.api.nvim_set_hl(0, 'NeogitChangeConflict', { fg = colors.red, bold = true })

  -- General buffer background, matches your Normal/LSP-float convention
  vim.api.nvim_set_hl(0, 'NeogitNormal', { bg = colors.bg, fg = colors.fg })
  vim.api.nvim_set_hl(0, 'NeogitFilePath', { fg = colors.grey, italic = true })
  vim.api.nvim_set_hl(0, 'NeogitSectionHeader', { fg = colors.aqua, bold = true })
end

set_neogit_hl()
vim.api.nvim_create_autocmd('ColorScheme', {
  pattern = 'gruvbox',
  callback = set_neogit_hl,
})

-- Or via lua api
vim.keymap.set("n", "<space>g", "<cmd>Neogit<cr>", { desc = "Open Neogit UI" })
