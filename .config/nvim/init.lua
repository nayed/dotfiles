vim.cmd.source("$HOME/.vim/basic.vim")

-- Set , as the leader key
-- See `:h mapleader`
-- NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ','

require('vim._core.ui2').enable({
  enable = true,
  msg = {
    target = 'cmd',
    pager = { height = 0.5 },
    dialog = { height = 0.5 },
    cmd = { height = 0.5 },
    msg = { height = 0.5, timeout = 4500 },
  },
})


require('nayed.options')     -- vim.o.* settings
require('nayed.keymaps')     -- non-LSP keymaps (window nav, etc.)
require('nayed.autocmds')    -- TextYankPost, PackChanged, etc.
require('nayed.commands')    -- user commands (GitBlameLine, etc.)
require('nayed.pack')        -- vim.pack.add({...}) plugin list
require('nayed.colorscheme') -- gruvbox setup + your custom hl overrides
require('nayed.floaterminal')

require('nayed.plugins.fzf-lua')
require('nayed.plugins.gitsigns')
require('nayed.plugins.mini')
require('nayed.plugins.neotree')
require('nayed.plugins.quicker')
require('nayed.plugins.mason')
require('nayed.plugins.mason-tool-installer')
require('nayed.plugins.treesitter')
require('nayed.plugins.lsp')
require('nayed.plugins.indentline')
require('nayed.plugins.aerial')
require('nayed.plugins.neogit')
require('nayed.plugins.codediff')
require('nayed.plugins.vimwiki')
-- Must be lasts to be loaded
require('nayed.plugins.ui.statusline')
require('nayed.plugins.ui.tabline')

-- PLUGINS
--
-- See `:h :packadd`, `:h vim.pack`

-- Add the "nohlsearch" package to automatically disable search highlighting after
-- 'updatetime' and when going to insert mode.
vim.cmd('packadd! nohlsearch')
