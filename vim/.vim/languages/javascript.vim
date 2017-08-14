Plug 'mxw/vim-jsx'
Plug 'prettier/vim-prettier', { 
  \ 'do': 'npm install', 
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql'] } 
Plug 'ternjs/tern_for_vim', { 'do': 'npm i'}

" prettier js
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.json,*.css,*.scss,*.less,*.graphql Prettier
let g:prettier#config#semi = 'false'

" vim-jsx
let g:jsx_ext_required = 0