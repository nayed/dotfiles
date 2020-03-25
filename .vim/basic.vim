" ================ General Config ====================

set laststatus=2
set showtabline=2

set number relativenumber       "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode  showcmd  cmdheight=2                     "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
au CursorHold * checktime
set mouse=a                     "Enable mouse support

" switch between buffers
nmap <F2> :bprevious<CR>
nmap <F3> :bnext<CR>

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
let mapleader=","
set timeout timeoutlen=1500

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb
set nowritebackup

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo') && !isdirectory(expand('~').'/.vim/backups')
silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile
endif

" ================ Folds ============================

set foldmethod=indent   " Fold based on indent
set foldlevel=99
set nofoldenable        " Don't fold by default

" Save folds on file save
" Neovim: ~/.local/share/nvim/view
" Vim: ~/.vim/view
autocmd BufWrite * mkview
autocmd BufRead * silent! loadview

" ================ Scrolling ========================

set scrolloff=8         " Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ================ Search ===========================

set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

filetype plugin on
set omnifunc=syntaxcomplete#Complete
filetype indent on

" ================ Custom Settings ========================

" Finding files
" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" Kill buffer without killing a window with ctrl w
map <C-w>w :bp\|bd #<CR>

" Save file on ctrl s
:nmap <c-s> :w<CR>
:imap <c-s> <Esc>:w<CR>

"during insert, kj escapes, `^ is so that the cursor doesn't move
inoremap kj <Esc>`^
"during insert, lkj escapes and saves
inoremap lkj <Esc>`^:w<CR>
"during insert, lkj escapes and saves and QUITS
inoremap ;lkj <Esc>:wq<CR>

" Disable conceal in markdown =>
" conceal : '[link text](link url)' will look 'link text'
let g:vim_markdown_conceal = 0

" copy and paste
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

" count number of occurences with ,*
map ,* *<C-O>:%s///gn<CR>

" Zoom
function! s:zoom()
  if winnr('$') > 1
    tab split
  elseif len(filter(map(range(tabpagenr('$')), 'tabpagebuflist(v:val + 1)'),
        \ 'index(v:val, '.bufnr('').') >= 0')) > 1
    tabclose
  endif
endfunction
nnoremap <silent> <leader>z :call <sid>zoom()<cr>

" sudo save with :w!!
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!


" Show indent line info for tabs
set list listchars=tab:\¦\ ,trail:-,extends:>,precedes:<,nbsp:+

set wrap       "Wrap lines
set linebreak    "Wrap lines at convenient points

" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Manage vim sessions
let g:sessions_dir = '~/.vim/sessions'
exec 'nnoremap <Leader>ss :mks! ' . g:sessions_dir . '/*.vim<C-D><BS><BS><BS><BS><BS>'
exec 'nnoremap <Leader>sr :so ' . g:sessions_dir. '/*.vim<C-D><BS><BS><BS><BS><BS>'

" deactivate modeline
set modelines=0
set nomodeline

" Highlight line in insert mode
autocmd InsertEnter,InsertLeave * set cul!

" On insert mode: change cursor block to bar and blink
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
		  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
		  \,sm:block-blinkwait175-blinkoff150-blinkon175

" Clear search highlight
nmap <c-l> :noh<CR>

" Create file's directory before saving, if it doesn't exist.
augroup BWCCreateDir
  autocmd!
  autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END
fun! s:MkNonExDir(file, buf)
  if empty(getbufvar(a:buf, '&buftype')) && a:file !~# '\v^\w+\:\/'
    call mkdir(fnamemodify(a:file, ':h'), 'p')
  endif
endfun

" Remove all trailing whitespace in the current file with ,x
nnoremap <silent> <Leader>x :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" Echo relative file path
nnoremap <F10> :echo expand('%:f')<CR>

" Move 
nnoremap <M-k> :<C-u>move-2<CR>==
xnoremap <M-k> :move-2<CR>gv=gv
nnoremap <M-j> :<C-u>move+<CR>==
xnoremap <M-j> :move'>+<CR>gv=gv
