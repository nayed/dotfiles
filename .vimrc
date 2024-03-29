" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" source ~/.vimrc.before if it exists.
if filereadable(expand("~/.vimrc.before"))
source ~/.vimrc.before
endif

set clipboard+=unnamedplus
set noesckeys

source $HOME/.vim/basic.vim

"turn on syntax highlighting
syntax on

" Enable true color
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

colorscheme peachpuff
hi Normal guibg=#fffad4 guifg=Black
hi Constant term=underline ctermfg=1 guifg=#087354
hi SpecialKey term=bold ctermfg=4 guifg=Grey
hi Type term=underline ctermfg=2 gui=bold guifg=#f28f3b
hi LineNr term=underline ctermfg=3 guifg=#0a2463
hi Special term=bold ctermfg=5 guifg=#0a2463
hi Directory term=bold ctermfg=4 guifg=SeaGreen
hi StatusLine term=bold,reverse cterm=bold,reverse gui=bold guifg=SeaGreen guibg=White
hi StatusLineNC term=reverse cterm=reverse gui=bold guifg=#fffad4 guibg=Gray45
hi VertSplit term=reverse cterm=reverse gui=bold guifg=#fffad4 guibg=Gray45
hi NonText term=bold cterm=bold ctermfg=4 gui=bold guifg=Grey

" This is needed because vim loses color when reloading a session
autocmd ColorScheme * hi Normal guibg=#fffad4

" Some colorscheme have weird background color at the bottom of the buffer
" where there is no text. This should fixes it
autocmd colorscheme * highlight EndOfBuffer          ctermbg=NONE guibg=NONE

" colorscheme desert
" hi Normal guibg=#301B3F
" " This is needed because vim loses color when reloading a session
" autocmd ColorScheme * hi Normal guibg=#301B3F

set t_Co=256

set statusline=\ %f%m%r%h%w\ %=%({%{&ff}\|%{(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\")}%k\|%Y}%)\ %([%l,%v][%p%%]\ %)

" Highlight netrw marked files and directories
hi link netrwMarkFile Search

let g:netrw_liststyle = 3
let g:netrw_browse_split = 0
let g:netrw_altv = 1
let g:netrw_winsize = 20
let g:netrw_banner = 0
" augroup ProjectDrawer
"   autocmd!
"   autocmd VimEnter * :Lexplore
" augroup END

nmap <F5> :source ~/.vimrc<cr>
