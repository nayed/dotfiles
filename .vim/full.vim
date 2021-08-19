Plug 'pechorin/any-jump.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
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
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'majutsushi/tagbar'
Plug 'Ron89/thesaurus_query.vim'
Plug 'mbbill/undotree'
Plug 'ThePrimeagen/vim-be-good'
Plug 'ryanoasis/vim-devicons'
Plug 'rbong/vim-flog'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Yilin-Yang/vim-markbar'
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/vim-peekaboo'
Plug 'powerman/vim-plugin-AnsiEsc'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-surround'
Plug 'dstein64/vim-win'
Plug 'vimwiki/vimwiki', {'branch': 'dev'}


" =========================== Custom Settings ===========================

" ============================ ANY JUMP ================================
" Auto group results by filename
let g:any_jump_grouping_enabled = 1

hi AnyJumpResultText guifg=#1d2021

let g:any_jump_colors = {
      \"group_name":         "Structure",
      \"preview":            "Comment",
      \"preview_keyword":    "Statement",
      \"result_text":        "AnyJumpResultText",
      \}


" =============================== COC ==================================
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
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

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use cn and cp to navigate diagnostics
nmap <silent> cn <Plug>(coc-diagnostic-next)
nmap <silent> cp <Plug>(coc-diagnostic-prev)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Display signature
inoremap <silent> <M-K> <C-r>=CocActionAsync('showSignatureHelp')<CR>

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" " Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-z> <Plug>(coc-range-select)
xmap <silent> <C-z> <Plug>(coc-range-select)
nmap <silent> <M-z> <Plug>(coc-range-select-backward)
xmap <silent> <M-z> <Plug>(coc-range-select-backward)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <M-c>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <M-c>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <M-c>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <M-c>s  :<C-u>CocList -I symbols<cr>
" Search marketplace.
nnoremap <silent> <M-c>m  :<C-u>CocList marketplace<cr>
" Do default action for next item.
nnoremap <silent> <leader>cj  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <leader>ck  :<C-u>CocPrev<CR>

" Search all instances of word under cursor
" Allow to rename that word in all the projec with
" :%s/<word>/<newWord>/g
nnoremap <leader>prn :CocSearch <C-R>=expand("<cword>")<CR><CR>

let g:coc_global_extensions = [
  \ 'coc-css',
  \ 'coc-emmet',
  \ 'coc-elixir',
  \ 'coc-eslint',
  \ 'coc-fish',
  \ 'coc-go',
  \ 'coc-highlight',
  \ 'coc-json',
  \ 'coc-marketplace',
  \ 'coc-prettier',
  \ 'coc-sh',
  \ 'coc-snippets',
  \ 'coc-solargraph',
  \ 'coc-sql',
  \ 'coc-tsserver',
  \ 'coc-vimlsp',
  \ 'coc-yaml'
  \ ]

" Coc float window with rounded border
let g:coc_borderchars = ['─', '│', '─', '│', '╭', '╮', '╯', '╰']


" ======================== FUGITIVE =============================
nnoremap <silent> <space>g :0G<cr>
nnoremap <silent> <space>gd :tab G d<cr>
nnoremap <silent> <space>gs :tab G ds<cr>
nnoremap <silent> <space>gl :tab G lg<cr>
nnoremap <silent> <space>gp :tab G log -p<cr>

" git diff vertical
command! Gv tabnew % | exe "normal \<C-O>" | Gvdiffsplit | windo set wrap | wincmd l
nnoremap <silent> gv :Gv<cr>

" git diff horizontal
command! Gs tabnew % | exe "normal \<C-O>" | Gdiffsplit | windo set wrap | wincmd j
nnoremap <silent> gs :Gs<cr>

" 3-way git diff vertical for merge conflict
command! GV tabnew % | Gvdiffsplit! | exe "normal \<C-O>" | windo set wrap | wincmd h
nnoremap <silent> gV :GV<cr>

" 3-way git diff horizontal for merge conflict
command! GS tabnew % | Gdiffsplit! | exe "normal \<C-O>" | windo set wrap | wincmd k
nnoremap <silent> gS :GS<cr>

autocmd FileType fugitive nnoremap <buffer> <space>g :bd<cr>
autocmd FileType fugitive nnoremap <buffer> cc :tab Git commit<cr>
nnoremap <silent> <space>gc :tab Git commit<cr>


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
nnoremap <M-s> :RG<CR>
nnoremap <M-S> :RG!<CR>

nmap <F6>     :RG <C-R>=expand("<cword>")<CR><CR>
vnoremap <F6> :<C-U>execute 'RG ' . GetSelectedText()<CR>

" Adding preview window to some fzf command
function! s:p(bang, ...)
  let preview_window = get(g:, 'fzf_preview_window')
  if len(preview_window)
    return call('fzf#vim#with_preview', a:000 + [preview_window, '?'])
  endif
  return {}
endfunction

" locate unix command
command! -bang -nargs=+ -complete=dir FZFLocate
            \ call fzf#vim#locate(<q-args>,
            \     s:p(<bang>0),
            \     <bang>0)
" the empty space at the end of :FZFLocate is needed
nnoremap <Leader>fl :FZFLocate 

" display and search a line in current buffer
command! -bang -nargs=* FZFBLines
            \ call fzf#vim#buffer_lines(<q-args>,
            \     s:p(<bang>0, {'placeholder': expand('%') . ':{1}'}),
            \     <bang>0)
nnoremap <Leader>fb :FZFBLines<CR>

" display markers
command! -bar -bang FZFMarks
            \ call fzf#vim#marks({
            \     'options': '--preview-window=' . (<bang>0 ? 'up:60%' : '50%:hidden') .
            \                ' --preview "
            \                     tail -n +{2} $([ -r {4} ] && echo {4} || echo ' . expand('%') . ') |
            \                     head -n $(tput lines)"' .
            \                 (<bang>0 ? '' : ' --bind "?:toggle-preview"') . ' -m'
            \ }, <bang>0)
nnoremap <Leader>fm :FZFMarks<CR>

" Pop up window
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

" match fzf color with vim colorscheme instead of terminal colorscheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'FzfNormalFloat'],
  \ 'bg':      ['bg', 'FzfNormalFloat'],
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
nnoremap <M-b> :Buffers<CR>

" display all vim :commands
nnoremap <M-c> :Commands<CR>

" display and search documentations
nnoremap <M-h> :Helptags<CR>

" ,f to start files search
nnoremap <M-f> :Files<CR>
nnoremap <M-F> :Files!<CR>

" git commit history
nnoremap <Leader>co :Commits<CR>
" git status
nnoremap <Leader>gs :GFiles?<CR>

" history previous open file
nnoremap <Leader>h :History<CR>

" display all key maps
nnoremap <Leader>m :Maps<CR>

" display and search a line from opened buffers
nnoremap <Leader>l :Lines<CR>

" display tags in current file
nnoremap <M-t> :BTags<CR>


" ============================= GIT GUTTER =============================
nmap <leader>hn <Plug>(GitGutterNextHunk)
nmap <leader>hb <Plug>(GitGutterPrevHunk)
command! Gqcf GitGutterQuickFixCurrentFile | copen
command! Gqf GitGutterQuickFix | copen

" display a quickfix of all modifs of the current file
nmap <leader>hf :Gqcf<CR>
" display a quickfix of all modifs of all tracked files in the project
nmap <leader>ha :Gqf<CR>


" ============================= INDENTLINE =============================
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" let g:indentLine_setColors = 0


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
  let s:info_sign = has('mac') ? '🔎 ' : 'ⓘ '
  let s:hint_sign = has('mac') ? '💬 ' : 'H'
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

function! CocCurrentFunction()
  let funcName = get(b:, 'coc_current_function', '')
  if funcName != ''
    let funcName = ' ' . funcName
  endif
  return funcName
endfunction

let g:lightline = {}
let g:lightline.colorscheme = 'mlc'
let g:lightline.active = {
        \ 'left': [ [ 'mode', 'paste' ],
        \           [ 'readonly', 'filepath', 'modified', 'fileformat', 'devicons_filetype' ], ['currentfunction', 'spell'] ],
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
        \ 'filepath': "%{FilePath()}",
        \ 'git_branch': '%{Git_branch()}',
        \ 'lineinfo': "%2{Line_percent()}\uf295 %3{Line_num()}:%-2{Col_num()} %2{Total_Line()}",
        \ 'paste': '%{&paste?"PASTE":""}',
        \ 'status_diagnostic': '%{StatusDiagnostic()}',
        \ 'spell': '%{&spell?&spelllang:""}',
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
        \ 'currentfunction': 'CocCurrentFunction',
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


" ============================== MARKBAR ================================
" only display alphabetic marks a-z
let alpha = 'abcdefghijklmnopqrstuvwxyz'
let g:markbar_marks_to_display = alpha
let g:markbar_peekaboo_marks_to_display = alpha

" open a 'backtick-like' peekaboo markbar with <leader>'
let g:markbar_peekaboo_backtick_mapping = "<leader>'"


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
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

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


" =========================== PEEKABOO ==============================
" It's not working (yet) in visual mode
" function! CreateCenteredFloatingWindow()
"   let width = float2nr(&columns * 0.6)
"   let height = float2nr(&lines * 0.6)
"   let top = ((&lines - height) / 2) - 1
"   let left = (&columns - width) / 2
"   let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}
"
"   let top = "╭" . repeat("─", width - 2) . "╮"
"   let mid = "│" . repeat(" ", width - 2) . "│"
"   let bot = "╰" . repeat("─", width - 2) . "╯"
"   let lines = [top] + repeat([mid], height - 2) + [bot]
"   let s:buf = nvim_create_buf(v:false, v:true)
"   call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
"   call nvim_open_win(s:buf, v:true, opts)
"   set winhl=Normal:FzfNormalFloat
"   let opts.row += 1
"   let opts.height -= 2
"   let opts.col += 2
"   let opts.width -= 4
"   call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
"   au BufWipeout <buffer> exe 'bw '.s:buf
" endfunction
"
" let g:peekaboo_window="call CreateCenteredFloatingWindow()"


" ============================ TAGBAR ===============================
nnoremap <silent> <space>t :TagbarToggle<cr>


" =========================== THESAURUS =============================
let g:tq_map_keys = 0 " disable default thesaurus keymap
nnoremap <silent>th :ThesaurusQueryReplaceCurrentWord<CR>

" ============================= UNDOTREE ============================
nnoremap <silent> <space>u :UndotreeToggle<cr>

" ============================= VIMWIKI =============================
let g:vimwiki_list = [{'path': '~/Codes/Misc/til'}]
let g:vimwiki_global_ext = 0
autocmd FileType vimwiki setlocal shiftwidth=4 softtabstop=4 tabstop=4

" Hide =
autocmd FileType vimwiki call matchadd('Conceal','=',9,-1,{'conceal': ''})
autocmd FileType vimwiki call matchadd('Normal',' = ',10,-1,{'conceal': ' = '})
