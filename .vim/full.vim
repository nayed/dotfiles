Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'Raimondi/delimitMate'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'Yggdroot/indentLine'
Plug 'itchyny/lightline.vim'
Plug 'taohexxx/lightline-buffer'
Plug 'niklaas/lightline-gitdiff'
Plug 'Valloric/MatchTagAlways'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'majutsushi/tagbar'
Plug 'mbbill/undotree'
Plug 'ryanoasis/vim-devicons'
Plug 'easymotion/vim-easymotion'
Plug 'rbong/vim-flog'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'terryma/vim-multiple-cursors'
Plug 'powerman/vim-plugin-AnsiEsc'
Plug 'tpope/vim-surround'
Plug 'dstein64/vim-win'


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

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Show all diagnostics.
nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>


" ========================= EASY MOTION ==========================
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with two key binding.
map <Leader><Leader>s <Plug>(easymotion-overwin-f2)

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)


" =============================== FZF ============================
" fix weird display bug on preview window on nvim 0.4
autocmd! FileType fzf tnoremap <buffer> <esc> <c-c>

let $FZF_DEFAULT_OPTS = '--reverse'

" Files with preview window
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" Command for git grep
" - fzf#vim#grep(command, with_column, [options], [fullscreen])
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   { 'dir': systemlist('git rev-parse --show-toplevel')[0] }, <bang>0)

" search with Ripgrep
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
nnoremap <Leader>rg :RG<CR>
nnoremap <Leader>RG :RG!<CR>

" Pop up window
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

" match fzf color with vim colorscheme instead of terminal colorscheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" some FZF mapping

" display opened buffers
nnoremap <Leader>bu :Buffers<CR>

" display all vim :commands
nnoremap <Leader>c :Commands<CR>

" display and search documentations
nnoremap <M-h> :Helptags<CR>

" ,f to start files search
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>F :Files!<CR>

" git commit history
nnoremap <Leader>co :Commits<CR>
" git status
nnoremap <Leader>gst :GFiles?<CR>

" history previous open file
nnoremap <Leader>h :History<CR>

" display all key maps
nnoremap <Leader>m :Maps<CR>

" display and search a line from opened buffers
nnoremap <Leader>l :Lines<CR>
" display and search a line in current buffer
nnoremap <Leader>bl :BLines<CR>

" display tags in current file
nnoremap <Leader>t :BTags<CR>


" ============================= INDENTLINE =============================
let g:vim_markdown_conceal_code_blocks = 0
let g:indentLine_char = '┊'
let g:indentLine_color_term = 243
let g:indentLine_color_gui = '#a9a9a9'


" ============================= LIGHTLINE ==============================
function! Line_num() abort
  return string(line('.'))
endfunction

function! Line_percent() abort
  return string((100*line('.'))/line('$'))
endfunction

function! Col_num() abort
  return string(getcurpos()[2])
endfunction

function! Total_Line() abort
  return string(line('$')) . 'L'
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
  let s:error_sign = get(g:, 'coc_status_error_sign', has('mac') ? '❌ ' : 'E')
  let s:warning_sign = get(g:, 'coc_status_warning_sign', has('mac') ? '⚠️  ' : 'W')
  let s:info_sign = has('mac') ? '🔍 ' : 'I'
  let s:hint_sign = 'ⓘ '
  let s:ok_sign = '✓'

  if empty(info) | return s:ok_sign | endif

  let msgs = []

  if info.error == 0 && info.warning == 0 && info.information == 0 && info.hint == 0
    call add(msgs, s:ok_sign)
  endif
  if get(info, 'error', 0)
    call add(msgs, s:error_sign . info['error'])
  endif
  if get(info, 'warning', 0)
    call add(msgs, s:warning_sign . info['warning'])
  endif
  if get(info, 'information', 0)
    call add(msgs, s:info_sign . info['information'])
  endif
  if get(info, 'hint', 0)
    call add(msgs, s:hint_sign. info['hint'])
  endif
  return join(msgs, ' ')
endfunction

function! Devicons_Filetype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! FilePath()
  return pathshorten(expand('%:f'))
endfunction

let g:lightline = {}
let g:lightline.colorscheme = 'mlc'
let g:lightline.active = {
        \ 'left': [ [ 'mode', 'paste' ],
        \           [ 'readonly', 'filepath', 'modified', 'fileformat', 'devicons_filetype' ] ],
        \ 'right': [ ['lineinfo'], ['testing_status', 'status_diagnostic'] ]
        \ }
let g:lightline.separator = { 'left': "\ue0b8 ", 'right': "\ue0ba " }
let g:lightline.subseparator = { 'left': "\ue0b9 ", 'right': "\ue0bb " }
" let g:lightline.tabline_separator = { 'left': "\ue0b8 ", 'right': "\ue0ba " }
" let g:lightline.tabline_subseparator = { 'left': "\ue0bb ", 'right': "\ue0bb" }
" let g:lightline.tabline_separator = { 'left': "▓▒░", 'right': "░▒▓" }
let g:lightline.tabline_separator = { 'left': "▓▒░", 'right': "" }
let g:lightline.tabline_subseparator = { 'left': "▒", 'right': " " }
let g:lightline#gitdiff#indicator_added = "\uf055 "
let g:lightline#gitdiff#indicator_deleted = "\uf057 "
let g:lightline#gitdiff#indicator_modified = "\uf056 "

let g:lightline.tabline = {
        \ 'left': [ [ 'bufferinfo' ], [ 'bufferbefore', 'buffercurrent', 'bufferafter' ], ],
        \ 'right': [ [ 'git_branch' ], [ 'gitdiff' ], ]
        \ }

let g:lightline.tab_component = {}
let g:lightline.tab_component_function = {
        \ 'modified': 'lightline#tab#modified',
        \ 'readonly': 'lightline#tab#readonly',
        \ }

let g:lightline.component = {
        \ 'fileformat': '%{&fenc!=#""?&fenc:&enc}[%{&ff}]',
        \ 'git_branch': '%{Git_branch()}',
        \ 'lineinfo': "%2{Line_percent()}\uf295 %3{Line_num()}:%-2{Col_num()} %2{Total_Line()}",
        \ 'paste': '%{&paste?"PASTE":""}',
        \ 'status_diagnostic': '%{StatusDiagnostic()}',
        \ 'filepath': "%{FilePath()}",
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

" close neovim if nerdtree is the only window left open (1/1)
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Display hidden files in NERDTree
let NERDTreeShowHidden=1

nnoremap <silent> <space>n :NERDTreeToggle<cr>

" let g:NERDTreeHighlightFolders = 1
let g:NERDTreeHighlightFoldersFullName = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1 " enable folder glyph flag
let g:DevIconsEnableFoldersOpenClose = 1
let g:DevIconsEnableFolderExtensionPatternMatching = 1
let g:webdevicons_conceal_nerdtree_brackets = 1

" Basically disable nerdtree markers
let g:NERDTreeDirArrowExpandable = ' '
let g:NERDTreeDirArrowCollapsible = ' '

let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = ' '
let g:DevIconsDefaultFolderOpenSymbol = ' '


" ============================ TAGBAR ===============================
nmap <F8> :TagbarToggle<CR>


" ============================= UNDOTREE ============================
nnoremap <F6> :UndotreeToggle<cr>
