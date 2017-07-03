Plug 'danchoi/ri.vim'

" ===== Seeing Is Believing =====
" Assumes you have a Ruby with SiB available in the PATH
" If it doesn't work, you may need to `gem install seeing_is_believing -v
" 3.0.0.beta.6`
" ...yeah, current release is a beta, which won't auto-install
"
" Annotate every line
"
nmap <leader>b :%!seeing_is_believing --timeout 12 --line-length 500 --number-of-captures 300 --alignment-strategy chunk<CR>;
"
" Annotate marked lines
"
nmap <leader>n :%.!seeing_is_believing --timeout 12 --line-length 500 --number-of-captures 300 --alignment-strategy chunk --xmpfilter-style<CR>;
"
" Remove annotations
"
nmap <leader>c :%.!seeing_is_believing --clean<CR>;
"
" Mark the current line for annotation
"
nmap <leader>m A # => <Esc>
"
" Mark the highlighted lines for annotation
"
vmap <leader>m :norm A # => <Esc>


let g:syntastic_ruby_checkers = ['rubocop', 'mri']