command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Console log from insert mode; Puts focus inside parentheses
imap cll console.log()<Esc><S-f>(a
" Console log from normal mode, inserted on next line with word your on inside parentheses
nmap cll yiwocll<Esc>p
" from visual mode on next line, puts visual selection inside parentheses
vmap cll yocll<Esc>p

" Console table from insert mode; Puts focus inside parentheses
imap clt console.table()<Esc><S-f>(a
" Console table from normal mode, inserted on next line with word your on inside parentheses
nmap clt yiwoclt<Esc>p
" from visual mode on next line, puts visual selection inside parentheses
vmap clt yoclt<Esc>p
