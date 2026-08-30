vim.opt_local.shiftwidth = 4
vim.opt_local.softtabstop = 4
vim.opt_local.tabstop = 4

-- Hide standalone '=' characters...
vim.fn.matchadd('Conceal', '=', 9, -1, { conceal = '' })
-- ...but reveal them again when part of ' = ' (spaced equals)
vim.fn.matchadd('Normal', ' = ', 10, -1, { conceal = ' = ' })


-- Give VimWiki its own "paper" background
vim.wo.winhighlight = 'Normal:VimwikiNormal'
