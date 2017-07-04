Plug 'racer-rust/vim-racer'
Plug 'rhysd/rust-doc.vim'

" let g:syntastic_rust_checkers = ['rustc', 'cargo']
let g:rust_bang_comment_leader = 1

" Rustfmt on save
let g:rustfmt_autosave = 1

let g:racer_cmd = "/home/nayed/.cargo/bin/racer"
let g:racer_experimental_completer = 1
let g:ycm_rust_src_path = '/home/nayed/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src' " type echo $RUST_SRC_PATH in terminal 
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)
let g:rust_doc#downloaded_rust_doc_dir = '~/Documents/rust-docs'

nnoremap <C-c><C-o> :!cargo run<CR>
map <C-c><C-b> :!cargo build<CR>