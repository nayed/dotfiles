Plug 'mxw/vim-jsx'
Plug 'prettier/vim-prettier', { 
  \ 'do': 'npm install', 
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql'] } 
Plug 'ternjs/tern_for_vim', { 'do': 'npm i'}

" prettier js
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.json,*.css,*.scss,*.less,*.graphql Prettier
let g:prettier#config#semi = 'false'
let g:prettier#config#trailing_comma = 'none'

" vim-jsx
let g:jsx_ext_required = 0

" tern
nnoremap <Leader>J :TernDocBrowse<CR>

" Console log from insert mode; Puts focus inside parentheses
imap cll console.log()<Esc>==f(a
" Console log from normal mode, inserted on next line with word your on inside parentheses
nmap cll yiwocll<Esc>p

" Console table from insert mode; Puts focus inside parentheses
imap clt console.table()<Esc>==f(a
" Console table from normal mode, inserted on next line with word your on inside parentheses
nmap clt yiwoclt<Esc>p