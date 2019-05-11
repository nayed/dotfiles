" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" source ~/.vimrc.before if it exists.
if filereadable(expand("~/.vimrc.before"))
source ~/.vimrc.before
endif

filetype off                  " required

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
" source $HOME/.vim/languages/elixir.vim
source $HOME/.vim/languages/go.vim
source $HOME/.vim/languages/html-css.vim
source $HOME/.vim/languages/javascript.vim
" source $HOME/.vim/languages/ruby.vim
" source $HOME/.vim/languages/rust.vim

" Color Scheme
Plug 'lifepillar/vim-solarized8'
Plug 'mhartington/oceanic-next'


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

colorscheme solarized8_flat

" colorscheme OceanicNext

set t_Co=256
set background=light
