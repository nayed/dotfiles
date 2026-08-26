local map = vim.keymap.set

-- Launch FZF picker
map('n', '<Leader>fz', ':FzfLua<CR>')

-- File picker
map('n', '<M-f>', ':FzfLua files<CR>')

-- FZF search
map('n', '<M-s>', function() require('fzf-lua').live_grep() end, { desc = 'Live grep' })

-- FZF search in hidden folders
-- map('n', '<M-S>', function()
--   require('fzf-lua').live_grep({
--     rg_opts = "--hidden --glob '!.git' --column --line-number --no-heading --color=always --smart-case",
--   })
-- end, { desc = 'Live grep (hidden files)' })

-- Search in the current buffer
map('n', '<leader>fl', ':FzfLua blines<CR>')
-- Search in all opened buffer
map('n', '<leader>l', ':FzfLua lines<CR>')

-- Display marks
map('n', '<leader>fm', ':FzfLua marks<CR>')

-- Display (neo)vim helptags
map('n', '<M-h>', ':FzfLua helptags<CR>')

-- Display all keymaps
map('n', '<leader>fk', ':FzfLua keymaps<CR>')

-- Picker that shows previous opened files
map('n', '<leader>h', ':FzfLua history<CR>')

-- Display oppened buffers
map('n', '<leader>fb', ':FzfLua buffers<CR>')


local actions = require("fzf-lua").actions

-- Auto enter the first file of the quickfix list
local function file_sel_to_qf_and_open(selected, opts)
  actions.file_sel_to_qf(selected, opts)
  vim.cmd("cfirst")
end

require("fzf-lua").setup({
  fzf_colors = {
    bg      = { "bg", "FzfLuaNormal" },
    ["bg+"] = { "bg", "FzfLuaNormal" },
    fg      = { "fg", "FzfLuaNormal" },
    ["fg+"] = { "fg", "FzfLuaCursorLine" },
    ["hl+"] = { "fg", "FzfLuaCursorLine" },
  },

  actions = {
    files = {
      true,
      ["ctrl-q"] = {
        fn = file_sel_to_qf_and_open,
        prefix = "select-all",
      },
    },
  },
})

require("fzf-lua").register_ui_select()
