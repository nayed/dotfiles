autocmd Filetype go setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4

autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')
