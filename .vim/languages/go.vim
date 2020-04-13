Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

autocmd Filetype go setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4

let g:go_def_mapping_enabled = 0

let g:go_doc_popup_window = 1

autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')
