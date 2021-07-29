" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" source ~/.vimrc.before if it exists.
if filereadable(expand("~/.vimrc.before"))
source ~/.vimrc.before
endif

set rtp+=~/.vim

" Specify a directory for plugins
" - For Vim: ~/.vim/plugged
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

set clipboard+=unnamedplus

source $HOME/.vim/basic.vim
source $HOME/.vim/full.vim

" Languages stuff
Plug 'sheerun/vim-polyglot'
source $HOME/.vim/languages/go.vim
source $HOME/.vim/languages/javascript.vim

" Color Scheme
Plug 'lifepillar/vim-gruvbox8'

" Initialize plugin system
call plug#end()

"turn on syntax highlighting
syntax on

" Enable true color
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

colorscheme gruvbox8
" colorscheme yoru

set t_Co=256
set background=light

let term0 = ""
let term1 = ""
let term2 = ""
let term3 = ""
let term4 = ""
let term5 = ""
let term6 = ""
let term7 = ""
let term8 = ""
let term9 = ""
let term10 = ""
let term11 = ""
let term12 = ""
let term13 = ""
let term14 = ""
let term15 = ""

if exists("g:terminal_color_0")
  let term0 = g:terminal_color_0
  let term1 = g:terminal_color_1
  let term2 = g:terminal_color_2
  let term3 = g:terminal_color_3
  let term4 = g:terminal_color_4
  let term5 = g:terminal_color_5
  let term6 = g:terminal_color_6
  let term7 = g:terminal_color_7
  let term8 = g:terminal_color_8
  let term9 = g:terminal_color_9
  let term10 = g:terminal_color_10
  let term11 = g:terminal_color_11
  let term12 = g:terminal_color_12
  let term13 = g:terminal_color_13
  let term14 = g:terminal_color_14
  let term15 = g:terminal_color_15
endif

hi NormalFloat guibg=#f2e5bc
execute "hi CocWarningSign " . " guifg=" . term11
execute "hi CocInfoSign " . " guifg=" . term13
hi SignColumn guibg=NONE
execute "hi Search" . " guifg=" . term6
execute "hi IncSearch" . " guifg=" . term14
hi Normal guibg=NONE

execute "hi VimwikiHeader1" . " guifg=" . term0 . " guibg=" . term9
execute "hi VimwikiHeader2" . " guifg=" . term0 . " guibg=" . term3
execute "hi VimwikiHeader3" . " guifg=" . term0 . " guibg=" . term15

nmap <F5> :source ~/.config/nvim/init.vim<cr>

" ============================ TREE SITTER ============================
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = {}, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = {},  -- list of language that will be disabled
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF
