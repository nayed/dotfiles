Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'Raimondi/delimitMate'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Yggdroot/indentLine'
Plug 'itchyny/lightline.vim'
Plug 'taohexxx/lightline-buffer'
Plug 'sainnhe/lightline_foobar.vim'
Plug 'niklaas/lightline-gitdiff'
Plug 'Valloric/MatchTagAlways'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'majutsushi/tagbar'
Plug 'mbbill/undotree'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'qpkorr/vim-bufkill'
Plug 'ryanoasis/vim-devicons'
Plug 'rbong/vim-flog'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'terryma/vim-multiple-cursors'
Plug 'powerman/vim-plugin-AnsiEsc'
Plug 'tpope/vim-surround'
Plug 'wesQ3/vim-windowswap'


" =========================== Custom Settings ===========================

" =============================== COC ==================================
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use Ctrl+c n and Ctrl+c p to navigate diagnostics
map <C-c>n <Plug>(coc-diagnostic-next)
map <C-c>p <Plug>(coc-diagnostic-prev)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)


" if you want to disable auto detect, comment out those two lines
"let g:airline#extensions#disable_rtp_load = 1
"let g:airline_extensions = ['branch', 'hunks', 'coc']

let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'


" ========================= EASY MOTION ==========================
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
map <Leader><Leader>s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
map <Leader><Leader>s <Plug>(easymotion-overwin-f2)

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)


" =============================== FZF ============================
let $FZF_DEFAULT_OPTS = '--reverse'

" ,s to start global search
nnoremap <Leader>se :Ag<CR>
nnoremap <Leader>SE :Ag!

" ,f to start files search
nnoremap <Leader>f :Files<CR>

" Command for git grep
" - fzf#vim#grep(command, with_column, [options], [fullscreen])
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   { 'dir': systemlist('git rev-parse --show-toplevel')[0] }, <bang>0)

" Override Colors command. You can safely do this in your .vimrc as fzf.vim
" will not override existing commands.
command! -bang Colors
  \ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 30%,0'}, <bang>0)

" Augmenting Ag command using fzf#vim#with_preview function
"   * fzf#vim#with_preview([[options], [preview window], [toggle keys...]])
"     * For syntax-highlighting, Ruby and any of the following tools are required:
"       - Bat: https://github.com/sharkdp/bat
"       - Highlight: http://www.andre-simon.de/doku/highlight/en/highlight.php
"       - CodeRay: http://coderay.rubychan.de/
"       - Rouge: https://github.com/jneen/rouge
"
"   :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
"   :Ag! - Start fzf in fullscreen and display the preview window above
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" Likewise, Files command with preview window
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)


" ============================= INDENTLINE =============================
let g:vim_markdown_conceal_code_blocks = 0

" ============================= LIGHTLINE ==============================
function! FileNameWithIcon() abort
  return winwidth(0) > 70  ? " " . WebDevIconsGetFileTypeSymbol() . ' ' . expand('%:t') : ''
endfunction

function! FileNameWithParent(f) abort
  if expand('%:t') ==# ''
    return expand('%:p:h:t')
  else
    return expand('%:p:h:t') . "/" . expand("%:t")
  endif
endfunction

function! Line_num() abort
  return string(line('.'))
endfunction

function! Active_tab_num(n) abort
  return " " . a:n . " \ue0bb"
endfunction

function! Inactive_tab_num(n) abort
  return " " . a:n . " \ue0bb "
endfunction

function! Line_percent() abort
  return string((100*line('.'))/line('$'))
endfunction

function! Col_num() abort
  return string(getcurpos()[2])
endfunction

function! Git_branch() abort
  if fugitive#head() !=# ''
    return fugitive#head() .  " " . "\ue702"
  else
    return "\uf468"
  endif
endfunction

function! StatusDiagnostic() abort
  let info = get(b:, 'coc_diagnostic_info', {})

  if get(info, 'error', 0)
    return "\uf46f"
  endif

  if get(info, 'warning', 0)
    return info['warning'] . "\uf421"
  endif

  return "\uf42e"
endfunction

function! Devicons_Filetype()
  " return winwidth(0) > 70 ? (strlen(&filetype) ? WebDevIconsGetFileTypeSymbol() . ' ' . &filetype : 'no ft') : ''
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

let g:lightline = {}
let g:lightline.colorscheme = 'challenger_deep'
" let g:lightline.active = {
"       \ 'left': [ ['mode', 'readonly'], ['filename_with_icon', 'modified' ] ],
"       \ 'right': [ ['lineinfo'], ['testing_status', 'status_diagnostic'] ]
"       \ }
let g:lightline.active = {
        \ 'left': [ [ 'mode', 'paste' ],
        \           [ 'readonly', 'relativepath', 'modified', 'fileformat', 'devicons_filetype' ] ],
        \ 'right': [ ['lineinfo'], ['testing_status', 'status_diagnostic'] ]
        \ }
let g:lightline.separator = { 'left': "\ue0b8 ", 'right': "\ue0ba " }
let g:lightline.subseparator = { 'left': "\ue0b9 ", 'right': "\ue0bb " }
let g:lightline.tabline_separator = { 'left': "\ue0b8 ", 'right': "\ue0ba " }
let g:lightline.tabline_subseparator = { 'left': "\ue0bb ", 'right': "\ue0bb" }
let g:lightline#gitdiff#indicator_added = "\uf055 "
let g:lightline#gitdiff#indicator_deleted = "\uf057 "
let g:lightline#gitdiff#indicator_modified = "\uf056 "

let g:lightline.tabline = {
        \ 'left': [ [ 'vim_logo' ], [ 'bufferinfo' ], [ 'separator' ],
        \             [ 'bufferbefore', 'buffercurrent', 'bufferafter' ], ],
        \ 'right': [ [ 'git_branch' ], [ 'gitdiff' ]]
        \ }
let g:lightline.tab = {
        \ 'active': ['activetabnum', 'filename_with_parent'],
        \ 'inactive': ['inactivetabnum', 'filename']
        \ }

let g:lightline.tab_component = {}
let g:lightline.tab_component_function = {
        \ 'activetabnum': 'Active_tab_num',
        \ 'filename': 'lightline#tab#filename',
        \ 'filename_with_parent': 'FileNameWithParent',
        \ 'inactivetabnum': 'Inactive_tab_num',
        \ 'modified': 'lightline#tab#modified',
        \ 'readonly': 'lightline#tab#readonly',
        \ 'relativepath': '%f',
        \ 'tabnum': 'lightline#tab#tabnum',
        \ }

let g:lightline.component = {
        \ 'fileformat': '%{&fenc!=#""?&fenc:&enc}[%{&ff}]',
        \ 'filename_with_icon': '%{FileNameWithIcon()}',
        \ 'filename_with_parent': '%t',
        \ 'git_branch': '%{Git_branch()}',
        \ 'lineinfo': "%2{Line_percent()}\uf295 %3{Line_num()}:%-2{Col_num()}",
        \ 'paste': '%{&paste?"PASTE":""}',
        \ 'separator': '',
        \ 'status_diagnostic': '%{StatusDiagnostic()}',
        \ 'vim_logo': "\ue7c5",
        \ }

let g:lightline.component_expand = {
        \ 'bufferafter': 'lightline#buffer#bufferafter',
        \ 'bufferbefore': 'lightline#buffer#bufferbefore',
        \ 'buffercurrent': 'lightline#buffer#buffercurrent',
        \ 'gitdiff': 'lightline#gitdiff#get',
        \ }

let g:lightline.component_type = {
        \ 'bufferafter': 'raw',
        \ 'bufferbefore': 'raw',
        \ 'buffercurrent': 'tabsel',
        \ }

let g:lightline.component_function = {
        \ 'bufferinfo': 'lightline#buffer#bufferinfo',
        \ 'devicons_filetype': 'Devicons_Filetype',
        \ }

" hide buffer number
let g:lightline_buffer_show_bufnr = 0


" ========================== MATCH TAG ALWAYS ==========================
let g:mta_filetypes = {
    \'javascript.jsx': 1,
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \}


" =========================== NERDCOMMENTER =============================
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1


" ============================ NERDTREE =================================
" open NERDTee if no file is specified when neovim is called
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Now we can:
" - hit tab to :find by partial match
" - use * to make it fuzzy
" Things to consider:
" - :b lets you autocomplete any open buffer

" Display hidden files in NERDTree
let NERDTreeShowHidden=1

nnoremap <F7> :NERDTreeToggle<cr>


" ============================ TAGBAR ===============================
nmap <F8> :TagbarToggle<CR>


" ============================= UNDOTREE ============================
nnoremap <F6> :UndotreeToggle<cr>


" =========================== VIM AIRLINE ============================
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#left_sep = ''
" let g:airline#extensions#tabline#left_alt_sep = ''
"
" if !exists('g:airline_symbols')
"   let g:airline_symbols = {}
" endif
"
" let g:airline_powerline_fonts = 1
" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''
" let g:airline_symbols.branch = ''
" let g:airline_symbols.readonly = ''
" let g:airline_symbols.linenr = ''
"
" let g:tmuxline_preset = {
"       \'a'    : '#S',
"       \'c'    : ['#(whoami)'],
"       \'win'  : ['#I', '#W'],
"       \'cwin' : ['#I', '#W', '#F'],
"       \'x'    : '#(date)',
"       \'z'    : '#H'}
"
" let g:airline_theme='challenger_deep'
