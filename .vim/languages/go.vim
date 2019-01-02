Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

autocmd Filetype go setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4

let g:go_fmt_command = "goimports"