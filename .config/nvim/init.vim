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
" source $HOME/.vim/languages/go.vim
source $HOME/.vim/languages/javascript.vim

" Color Scheme
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'lifepillar/vim-gruvbox8'
Plug 'lifepillar/vim-solarized8'


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

" colorscheme challenger_deep
" colorscheme solarized8_flat

colorscheme gruvbox8

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
hi CocWarningSign guifg=#d65d0e
hi CocInfoSign guifg=#076678
hi SignColumn guibg=#fbf1c7

execute "hi VimwikiHeader1" . " guifg=" . term0 . " guibg=" . term9
execute "hi VimwikiHeader2" . " guifg=" . term0 . " guibg=" . term3
execute "hi VimwikiHeader3" . " guifg=" . term0 . " guibg=" . term15

nmap <F5> :source ~/.config/nvim/init.vim<cr>
