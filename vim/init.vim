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

source $HOME/.vim/basic.vim
source $HOME/.vim/full.vim

" Languages stuff
Plug 'sheerun/vim-polyglot'
source $HOME/.vim/languages/elixir.vim
source $HOME/.vim/languages/html-css.vim
source $HOME/.vim/languages/javascript.vim
source $HOME/.vim/languages/ruby.vim
" source $HOME/.vim/languages/rust.vim

" Color Scheme
Plug 'ayu-theme/ayu-vim'
Plug 'lifepillar/vim-solarized8'
Plug 'nyomaszto/crayon'
Plug 'w0ng/vim-hybrid'
Plug 'whatyouhide/vim-gotham'
" Initialize plugin system
call plug#end()

"turn on syntax highlighting
syntax on

set termguicolors "Term colors

" Color scheme
" let ayucolor="dark"
" let ayucolor="mirage"
" colorscheme ayu

" colorscheme crayon

" colorscheme solarized8_light_flat

" colorscheme gotham

colorscheme hybrid

set t_Co=256
set background=dark

