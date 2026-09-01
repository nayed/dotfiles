local colors = require('nayed.plugins.ui.shared').gruv_light

require('aerial').setup({
  layout = {
    default_direction = 'right',
    placement = 'edge',
    width = 30,
    min_width = 30,
    max_width = 30,
    resize_to_content = false,
    win_opts = {
      -- AerialNormal is a real group Aerial itself defines (see :h aerial-highlights);
      -- linking Normal/NormalNC/EndOfBuffer/WinBar to it means one color definition
      -- covers the whole window, no gaps.
      winhl =
      'Normal:AerialNormal,NormalNC:AerialNormal,EndOfBuffer:AerialNormal,WinBar:AerialNormal,WinBarNC:AerialNormal',
    },
  },
  attach_mode = 'global',
  show_guides = true,
  guides = {
    mid_item = '├─',
    last_item = '└─',
    nested_top = '│ ',
    whitespace = '  ',
  },
  highlight_mode = 'last',
  highlight_closest = true,
  filter_kind = false,
})

local function set_aerial_hl()
  vim.api.nvim_set_hl(0, 'AerialNormal', { bg = colors.lsp_bg, fg = colors.fg })
  vim.api.nvim_set_hl(0, 'AerialGuide', { fg = colors.grey })
  vim.api.nvim_set_hl(0, 'AerialLine', { bg = colors.grey, fg = colors.lsp_bg }) -- cursor-position row
end

set_aerial_hl()
vim.api.nvim_create_autocmd('ColorScheme', {
  pattern = 'gruvbox',
  callback = set_aerial_hl,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'aerial',
  callback = function(args)
    vim.api.nvim_set_option_value(
      'winbar',
      '  Document Symbol',
      { scope = 'local', win = vim.fn.bufwinid(args.buf) }
    )
  end,
})

vim.keymap.set('n', '<space>o', ':AerialToggle right<CR>', { desc = 'Toggle Aerial outline' })
