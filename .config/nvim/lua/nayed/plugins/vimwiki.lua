vim.g.vimwiki_list = { { path = '~/Codes/Misc/til' } }
vim.g.vimwiki_global_ext = 1

local function set_vimwiki_hl()
  vim.api.nvim_set_hl(0, 'VimwikiNormal', { bg = '#f2e5bc' })

  -- Headings
  vim.api.nvim_set_hl(0, 'VimwikiHeader1', { bg = '#6d071a', fg = '#ffe9aa' })
  vim.api.nvim_set_hl(0, 'VimwikiHeader2', { bg = '#F4D35E', fg = '#457B9D' })
  vim.api.nvim_set_hl(0, 'VimwikiHeader3', { bg = '#005f5f', fg = '#ffe9aa' })

  -- Softer links
  vim.api.nvim_set_hl(0, 'VimwikiLink', { fg = '#458588', underline = true })
  vim.api.nvim_set_hl(0, 'VimwikiWikiLink', { fg = '#458588', underline = true })
  vim.api.nvim_set_hl(0, 'VimwikiLink1', { fg = '#458588', underline = true })

  -- Bold / italic
  vim.api.nvim_set_hl(0, 'VimwikiBold', { bold = true })
  vim.api.nvim_set_hl(0, 'VimwikiItalic', { italic = true })

  -- Code block
  vim.api.nvim_set_hl(0, 'VimwikiPre', { bg = '#565575', fg = '#FFEBB8' })
  -- vim.api.nvim_set_hl(0, 'VimwikiCode', { bg = '#BD5579', fg = '#FFEBB8' })
end

set_vimwiki_hl()
vim.api.nvim_create_autocmd({ 'ColorScheme', 'FileType' }, {
  pattern = { 'gruvbox', 'vimwiki' },
  callback = set_vimwiki_hl,
})
