Plug 'neoclide/coc-eslint', {'do': 'npm install --frozen-lockfile'}
Plug 'neoclide/coc-json', {'do': 'npm install --frozen-lockfile'}
Plug 'neoclide/coc-prettier', {'do': 'npm install --frozen-lockfile'}
Plug 'neoclide/coc-tsserver', {'do': 'npm install --frozen-lockfile'}

" :Prettier command 
command! -nargs=0 Prettier :CocCommand prettier.formatFile


" Console log from insert mode; Puts focus inside parentheses
imap cll console.log()<Esc>==f(a
" Console log from normal mode, inserted on next line with word your on inside parentheses
nmap cll yiwocll<Esc>p

" Console table from insert mode; Puts focus inside parentheses
imap clt console.table()<Esc>==f(a
" Console table from normal mode, inserted on next line with word your on inside parentheses
nmap clt yiwoclt<Esc>p