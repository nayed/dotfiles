" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" source ~/.vimrc.before if it exists.
if filereadable(expand("~/.vimrc.before"))
source ~/.vimrc.before
endif

set clipboard+=unnamedplus
set noesckeys

" Needed because :Man is not enabled by default in Vim
runtime ftplugin/man.vim

source $HOME/.vim/basic.vim

"turn on syntax highlighting
syntax on

" Enable true color
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

colorscheme retrobox
set background=light
hi Constant term=underline ctermfg=1 guifg=#087354
hi SpecialKey term=bold ctermfg=4 guifg=Grey
hi Type term=underline ctermfg=2 gui=bold guifg=#f28f3b
hi LineNr term=underline ctermfg=3 guifg=#0a2463
hi Special term=bold ctermfg=5 guifg=#0a2463
hi Directory term=bold ctermfg=4 guifg=SeaGreen
hi StatusLine term=bold,reverse cterm=bold,reverse gui=bold guifg=SeaGreen guibg=White
hi NonText term=bold cterm=bold ctermfg=4 gui=bold guifg=Grey

" Some colorscheme have weird background color at the bottom of the buffer
" where there is no text. This should fixes it
autocmd colorscheme * highlight EndOfBuffer          ctermbg=NONE guibg=NONE


set t_Co=256

set statusline=\ %f%m%r%h%w\ %=%({%{&ff}\|%{(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\")}%k\|%Y}%)\ %([%l,%v][%p%%]\ %)

" Tabline
function! SpawnBufferLine()
  let s = ''

  " Get the list of buffers. Use bufexists() to include hidden buffers
  let bufferNums = filter(range(1, bufnr('$')), 'buflisted(v:val)')
  " Making a buffer list on the left side
  for i in bufferNums
    " Highlight with yellow if it's the current buffer
    let s .= (i == bufnr()) ? ('%#TabLineSel#') : ('%#TabLine#')
    let s .= ' ' . i . ' '  " Append the buffer number
    if bufname(i) == ''
      let s .= '[NEW]'  " Give a name to a new buffer
    endif
    if getbufvar(i, "&modifiable")
      let s .= fnamemodify(bufname(i), ':t')  " Append the file name
      " let s .= pathshorten(bufname(i))  " Use this if you want a trimmed path
      " If the buffer is modified, add + and separator. Else, add separator
      let s .= (getbufvar(i, "&modified")) ? (' [+] |') : (' |')
    else
      let s .= fnamemodify(bufname(i), ':t') . ' [RO] |'  " Add read only flag
    endif
  endfor
  let s .= '%#TabLineFill#%T'  " Reset highlight

  let s .= '%=' " Spacer

  " Making a tab list on the right side
  for i in range(1, tabpagenr('$'))  " Loop through the number of tabs
    " Highlight with yellow if it's the current tab
    let s .= (i == tabpagenr()) ? ('%#TabLineSel#') : ('%#TabLine#')
    let s .= '%' . i . 'T '  " set the tab page number (for mouse clicks)
    let s .= i . ''          " set page number string
  endfor
  let s .= '%#TabLineFill#%T'  " Reset highlight

  " Close button on the right if there are multiple tabs
  if tabpagenr('$') > 1
    let s .= '%999X X'
  endif
  return s
endfunction

set tabline=%!SpawnBufferLine()  " Assign the tabline

" Highlight netrw marked files and directories
hi link netrwMarkFile Search

let g:netrw_liststyle = 3
let g:netrw_browse_split = 0
let g:netrw_altv = 1
let g:netrw_winsize = 20
let g:netrw_banner = 0
"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * if argc() == 0 | Lexplore | endif
"augroup END
nmap <silent> <space>n :Lexplore<cr>

nmap <F5> :source ~/.vimrc<cr>
