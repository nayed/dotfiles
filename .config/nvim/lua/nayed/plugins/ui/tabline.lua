local colors = require('nayed.plugins.ui.shared').colors

local function set_tabline_hl()
  vim.api.nvim_set_hl(0, 'MiniTablineCurrent', { fg = colors.white, bg = colors.lighter_cyan1, bold = true })
  vim.api.nvim_set_hl(0, 'MiniTablineVisible', { fg = colors.white, bg = colors.dark_cyan })
  vim.api.nvim_set_hl(0, 'MiniTablineHidden', { fg = colors.dark_asphalt, bg = colors.void })
  vim.api.nvim_set_hl(0, 'MiniTablineModifiedCurrent', { fg = colors.yellow, bg = colors.cyan, bold = true })
  vim.api.nvim_set_hl(0, 'MiniTablineModifiedVisible', { fg = colors.yellow, bg = colors.void })
  vim.api.nvim_set_hl(0, 'MiniTablineModifiedHidden', { fg = colors.yellow, bg = colors.void })
  vim.api.nvim_set_hl(0, 'MiniTablineFill', { bg = colors.void })
end

require('mini.tabline').setup({
  show_icons = true, -- devicons-style filetype icon per buffer, matches your Devicons_Filetype usage
  format = function(buf, label)
    local suffix = vim.bo[buf].modified and '󰷫 ' or ''
    return " " .. MiniTabline.default_format(buf, label) .. suffix .. ' 󰇙'
  end
})

set_tabline_hl()
vim.api.nvim_create_autocmd('ColorScheme', {
  pattern = 'gruvbox',
  callback = set_tabline_hl,
})
