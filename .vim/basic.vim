" ================ General Config ====================

set laststatus=2
set showtabline=2

set number relativenumber       "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode  showcmd  cmdheight=2                     "Show current mode down the bottom
" set gcr=a:blinkon0              "Disable cursor blink
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
set timeout timeoutlen=300

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

" ================ Spell Cheking ========================

augroup SpellConfig
  autocmd!
  autocmd FileType markdown,tex,latex,plaintex,text setlocal spell
      \ spelllang=en_us
      \ spellfile=$HOME/.vim/spell/en.utf-8.add
      \ complete+=kspell " Auto complete word from vim dictionary with ctrl+n and ctrl+p

  function! LanguageToggle() abort
    if &l:spelllang == "en_us"
      " Switch to French
      setlocal spelllang=fr
      setlocal spellfile=$HOME/.vim/spell/fr.utf-8.add
      echom "Vim utilise le dico Français"
    else
      " Switch to English
      setlocal spelllang=en_us
      setlocal spellfile=$HOME/.vim/spell/en.utf-8.add
      echom "Vim's using English dictionary"
    endif
  endfunction

  " Switch Languages
  command! LanguageToggle call LanguageToggle()

  " Go to next and previous wrong word
  nnoremap <leader>sn ]s
  nnoremap <leader>sp [s

  " Show list of suggestion
  nnoremap Z= a<C-X><C-S>

  " Pick the 1st suggestion
  " (by default it's ctrl-x ctrl-s on insert mode)
  nmap <silent> <space>z 1z=
augroup END

" ================ Custom Settings ========================

" Finding files
" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit
set wildignore+=*.luac                           " Lua byte code
set wildignore+=go/pkg                           " Go static files
set wildignore+=go/bin                           " Go bin files
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.orig                           " Merge resolution files

" Kill buffer without killing a window with ctrl w
map <C-w>w :bp\|bd #<CR>

" Save file on ctrl s
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>
vmap <c-s> <Esc>:w<CR>gv

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
nmap <leader>sy :call <SID>SynStack()<CR>
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

" Move a line or block of line
nnoremap <M-k> :<C-u>move-2<CR>==
xnoremap <M-k> :move-2<CR>gv=gv
nnoremap <M-j> :<C-u>move+<CR>==
xnoremap <M-j> :move'>+<CR>gv=gv

" Open or switch to previous file with space space
nnoremap <silent> <space><space> <c-^>

" change vim default weird keymap
nnoremap <leader>n :cnext<CR>
nnoremap <leader>p :cprevious<CR>

function! ToggleQuickFix()
  if getqflist({'winid':0}).winid
    cclose
  else
    botright copen
  endif
endfunction

command! -nargs=0 -bar ToggleQuickFix call ToggleQuickFix()
nnoremap <leader>t :ToggleQuickFix<CR>

" Vim grep:
" Display search results with a window at the bottom
cnoreabbrev <expr> grep  (getcmdtype() ==# ':' && getcmdline() =~# '^grep')  ? 'silent grep'  : 'grep'
cnoreabbrev <expr> lgrep (getcmdtype() ==# ':' && getcmdline() =~# '^lgrep') ? 'silent lgrep' : 'lgrep'

" Display quickfix list at the bottom
augroup init_quickfix
  autocmd!
  autocmd QuickFixCmdPost [^l]* botright cwindow
  autocmd QuickFixCmdPost l* botright lwindow
augroup END

" Open new line below and above current line
nnoremap <leader>o o<esc>
nnoremap <leader>O O<esc>

" Quit all
nnoremap <leader>qa :qa<cr>

" Vimdiff: jump to next and previous diff
nnoremap <leader>dn ]c
nnoremap <leader>dp [c

" Vimdiff: diffget LOCAL, BASE or REMOTE
nnoremap <leader>dl :diffg LO<cr>
nnoremap <leader>db :diffg BA<cr>
nnoremap <leader>dr :diffg RE<cr>

nnoremap <leader>dj :diffg //2<cr>
nnoremap <leader>dk :diffg //3<cr>

" Close all buffers but this one
command! -nargs=0 Bonly :%bd|e#|bd#

if has('nvim')
  " Highlight yanked text
  augroup highlight_yank
    autocmd!
    au TextYankPost * lua vim.highlight.on_yank {higroup="IncSearch", timeout=200, on_visual=true}
  augroup END

  " See a live preview of substitution
  set inccommand=nosplit
endif

" Escape buffer after :te(rminal)
tnoremap <Esc> <C-\><C-n>


" Auto set quickfix window if result less than 10 rows
function! AdjustWindowHeight(minheight, maxheight)
  let l = 1
  let n_lines = 0
  let w_width = winwidth(0)
  while l <= line('$')
    " number to float for division
    let l_len = strlen(getline(l)) + 0.0
    let line_width = l_len/w_width
    let n_lines += float2nr(ceil(line_width))
    let l += 1
  endw
  exe max([min([n_lines, a:maxheight]), a:minheight]) . "wincmd _"
endfunction
au FileType qf call AdjustWindowHeight(3, 10)

" Open help page in a new tab
" Quit help page with 'q'
function! s:helptab()
  if &buftype == 'help'
    wincmd T
    nnoremap <buffer> q :q<cr>
  endif
endfunction

augroup HelpInNewTab
  autocmd!
  autocmd BufEnter *.txt call s:helptab()
augroup END

autocmd FileType gitcommit DiffGitCached | wincmd p | wincmd H

nnoremap <silent> tc :tabclose<cr>
