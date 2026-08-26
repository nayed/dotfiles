------------------------ COMPLETIONS ------------------------------------
-- Use <Tab> in autocomplete
local imap_expr = function(lhs, rhs)
  vim.keymap.set('i', lhs, rhs, { expr = true })
end
imap_expr('<Tab>', [[pumvisible() ? "\<C-n>" : "\<Tab>"]])
imap_expr('<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]])

-- To get more consistent behavior of `<CR>`, you can use this template in
-- your `init.lua` to make customized mapping: >lua

_G.cr_action = function()
  -- If there is selected item in popup, accept it with <C-y>
  if vim.fn.complete_info()['selected'] ~= -1 then return '\25' end
  -- Fall back to plain `<CR>`. You might want to customize according
  -- to other plugins. For example if 'mini.pairs' is set up, replace
  -- next line with `return MiniPairs.cr()`
  return MiniPairs.cr() -- ALWAYS call mini-pairs BEFORE to have access to MiniPairs var
end

vim.keymap.set('i', '<CR>', 'v:lua.cr_action()', { expr = true })

require('mini.completion').setup {}

------------------------ ICONS ----------------------------------------
require('mini.icons').setup {}
MiniIcons.mock_nvim_web_devicons()

------------------------ JUMP2D ----------------------------------------
require('mini.jump2d').setup {
  mappings = {
    start_jumping = '', -- disables the built-in <CR> binding entirely
  },
}
vim.keymap.set({ 'n', 'x', 'o' }, '<leader><leader>', function()
  MiniJump2d.start(MiniJump2d.builtin_opts.single_character)
end)

------------------------ NOTIFY ----------------------------------------
require('mini.notify').setup {}

------------------------ PAIRS ------------------------------------------
require('mini.pairs').setup {}

------------------------ SNIPPETS ----------------------------------------
-- require('mini.snippets').setup {}
-- local gen_loader = require('mini.snippets').gen_loader
-- require('mini.snippets').setup({
--   snippets = {
--     -- Load custom file with global snippets first (adjust for Windows)
--     gen_loader.from_file('~/.config/nvim/snippets/global.json'),
--
--     -- Load snippets based on current language by reading files from
--     -- "snippets/" subdirectories from 'runtimepath' directories.
--     gen_loader.from_lang(),
--   },
-- })
-- MiniSnippets.start_lsp_server()

local snippets = require('mini.snippets')
snippets.setup({
  snippets = {
    snippets.gen_loader.from_lang(), -- also loads friendly-snippets-format files by filetype, if you ever add any
  },
})
MiniSnippets.start_lsp_server()
