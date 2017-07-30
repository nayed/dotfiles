Plug 'mxw/vim-jsx'
Plug 'ternjs/tern_for_vim', { 'do': 'npm i'}

" prettier js
autocmd FileType javascript.jsx,javascript setlocal formatprg=prettier\ --stdin\ --no-semi
autocmd BufWritePre *.js exe 'normal! gggqG\<C-o>\<C-o>'

" vim-jsx
let g:jsx_ext_required = 0