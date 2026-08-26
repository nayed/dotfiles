local colors = require('nayed.plugins.ui.shared').colors

local function set_statusline_hl()
  vim.api.nvim_set_hl(0, 'MiniStatuslineModeNormal', { fg = colors.white, bg = colors.dark_cyan, bold = true })
  vim.api.nvim_set_hl(0, 'MiniStatuslineModeInsert', { fg = colors.bg_subtle, bg = colors.red, bold = true })
  vim.api.nvim_set_hl(0, 'MiniStatuslineModeVisual', { fg = colors.bg_subtle, bg = colors.yellow, bold = true })
  vim.api.nvim_set_hl(0, 'MiniStatuslineModeReplace', { fg = colors.bg_subtle, bg = colors.green, bold = true })
  vim.api.nvim_set_hl(0, 'MiniStatuslineModeCommand', { fg = colors.white, bg = colors.dark_cyan, bold = true })
  vim.api.nvim_set_hl(0, 'MiniStatuslineModeOther', { fg = colors.white, bg = colors.dark_cyan, bold = true })

  vim.api.nvim_set_hl(0, 'MiniStatuslineDevinfo', { fg = colors.white, bg = colors.cyan })
  vim.api.nvim_set_hl(0, 'MiniStatuslineFilename', { fg = colors.white, bg = colors.lighter_cyan1 })
  vim.api.nvim_set_hl(0, 'MiniStatuslineFileinfo', { fg = colors.white, bg = colors.lighter_cyan1 })
  vim.api.nvim_set_hl(0, 'MiniStatuslineInactive', { fg = colors.dark_asphalt, bg = colors.bg_subtle })
end

----------------------- StatusLine ---------------------------------
local statusline = require('mini.statusline')

local function diagnostics_status()
  local icons = { ERROR = '❌ ', WARN = '⚠️  ', HINT = '💬 ', INFO = '🔎 ' }
  local parts = {}
  for severity, icon in pairs(icons) do
    local n = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity[severity] })
    if n > 0 then table.insert(parts, icon .. n) end
  end
  return #parts > 0 and table.concat(parts, ' ') or '✓'
end

local function filepath()
  return vim.fn.pathshorten(vim.fn.expand('%:f'))
end

local function sep(from_hl, to_hl, char)
  local from = vim.api.nvim_get_hl(0, { name = from_hl, link = false })
  local to = vim.api.nvim_get_hl(0, { name = to_hl, link = false })
  local group = 'NayedSep_' .. from_hl .. '_' .. to_hl
  vim.api.nvim_set_hl(0, group, { fg = from.bg, bg = to.bg })
  return '%#' .. group .. '#' .. char
end

statusline.setup({
  content = {
    active = function()
      local mode, mode_hl = statusline.section_mode({ trunc_width = 120 })
      local git           = statusline.section_git({ trunc_width = 75 })
      local diff          = MiniStatusline.section_diff({ trunc_width = 75 })
      local fname         = filepath()
      local modified      = vim.bo.modified and '[+]' or ''
      local fileformat    = (vim.bo.fileencoding ~= '' and vim.bo.fileencoding or vim.o.encoding)
          .. '[' .. vim.bo.fileformat .. ']'
      local filetype      = vim.bo.filetype ~= '' and vim.bo.filetype or 'no ft'
      local percent       = '%2p%%'
      local lineinfo      = '\u{f124} %3l:%-2c'
      local totallines    = '%3LL'
      local diagnostics   = diagnostics_status()

      local left          = table.concat({
        '%#' .. mode_hl .. '# ' .. mode .. ' ',
        sep(mode_hl, 'MiniStatuslineDevinfo', '\u{e0b8}'),
        '%#MiniStatuslineDevinfo# ' .. git .. ' ' .. diff .. ' ',
        sep('MiniStatuslineDevinfo', 'MiniStatuslineFilename', '\u{e0b8}'),
        '%#MiniStatuslineFilename# ' .. fname .. modified .. ' ',
        sep('MiniStatuslineFilename', 'MiniStatuslineInactive', '\u{e0b8}'),
      })

      local right         = table.concat({
        fileformat .. ' ',
        sep('MiniStatuslineInactive', 'MiniStatuslineFilename', '\u{e0bc}'),
        -- sep('MiniStatuslineFileinfo', 'MiniStatuslineFilename', '\u{e0bc}'),
        '%#MiniStatuslineFilename# ' .. filetype .. ' ',
        sep('MiniStatuslineFilename', 'MiniStatuslineDevinfo', '\u{e0bc}'),
        '%#MiniStatuslineDevinfo# ' .. percent .. ' ' .. lineinfo .. ' ' .. totallines .. ' ',
        sep('MiniStatuslineDevinfo', mode_hl, '\u{e0bc}'),
        '%#' .. mode_hl .. '# ' .. diagnostics .. ' ',
      })

      return left .. '%=' .. right
    end,
  },
})

set_statusline_hl()
vim.api.nvim_create_autocmd('ColorScheme', {
  pattern = 'gruvbox',
  callback = set_statusline_hl,
})
