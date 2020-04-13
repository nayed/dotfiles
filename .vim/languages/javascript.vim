command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Console log from insert mode; Puts focus inside parentheses
imap cll console.log()<Esc>==f(a
" Console log from normal mode, inserted on next line with word your on inside parentheses
nmap cll yiwocll<Esc>p

" Console table from insert mode; Puts focus inside parentheses
imap clt console.table()<Esc>==f(a
" Console table from normal mode, inserted on next line with word your on inside parentheses
nmap clt yiwoclt<Esc>p
