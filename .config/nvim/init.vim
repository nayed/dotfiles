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
" Plug 'sheerun/vim-polyglot'
" source $HOME/.vim/languages/elixir.vim
source $HOME/.vim/languages/go.vim
source $HOME/.vim/languages/html-css.vim
source $HOME/.vim/languages/javascript.vim
source $HOME/.vim/languages/ruby.vim
" source $HOME/.vim/languages/rust.vim
source $HOME/.vim/languages/typescript.vim

" Color Scheme
Plug 'arcticicestudio/nord-vim'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'drewtempelmeyer/palenight.vim'
Plug 'hzchirs/vim-material'
Plug 'lifepillar/vim-solarized8'
Plug 'mhartington/oceanic-next'
Plug 'morhetz/gruvbox'
Plug 'w0ng/vim-hybrid'


" Initialize plugin system
call plug#end()

"turn on syntax highlighting
syntax on

set termguicolors "Term colors

" colorscheme solarized8_flat

" colorscheme challenger_deep

" colorscheme OceanicNext

" colorscheme nord

" colorscheme vim-material

" colorscheme gruvbox

colorscheme palenight


" set t_Co=256
set background=dark