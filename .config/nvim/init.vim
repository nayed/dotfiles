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

hi NormalFloat guibg=#f2e5bc
hi CocWarningSign guifg=#d65d0e
hi CocInfoSign guifg=#076678

nmap <F5> :source ~/.config/nvim/init.vim<cr>
