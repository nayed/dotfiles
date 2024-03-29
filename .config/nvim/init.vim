" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" source ~/.vimrc.before if it exists.
if filereadable(expand("~/.vimrc.before"))
source ~/.vimrc.before
endif

set rtp+=~/.vim

" Specify a directory for plugins
" - For Vim: ~/.vim/plugged
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

set clipboard+=unnamedplus

source $HOME/.vim/basic.vim
source $HOME/.vim/full.vim

" Languages stuff
Plug 'sheerun/vim-polyglot'
source $HOME/.vim/languages/go.vim
source $HOME/.vim/languages/javascript.vim

" Color Scheme
Plug 'lifepillar/vim-gruvbox8'

" Initialize plugin system
call plug#end()

"turn on syntax highlighting
syntax on

" Enable true color
set termguicolors

colorscheme gruvbox8
" colorscheme yoru

set background=light

if exists("g:terminal_color_0")
  let term0 = g:terminal_color_0
  let term1 = g:terminal_color_1
  let term2 = g:terminal_color_2
  let term3 = g:terminal_color_3
  let term4 = g:terminal_color_4
  let term5 = g:terminal_color_5
  let term6 = g:terminal_color_6
  let term7 = g:terminal_color_7
  let term8 = g:terminal_color_8
  let term9 = g:terminal_color_9
  let term10 = g:terminal_color_10
  let term11 = g:terminal_color_11
  let term12 = g:terminal_color_12
  let term13 = g:terminal_color_13
  let term14 = g:terminal_color_14
  let term15 = g:terminal_color_15

  execute "hi IncSearch guifg=" . term14
  hi Normal guibg=NONE
  execute "hi NormalFloat guibg=#f2e5bc guifg=" . term0
  execute "hi Search guifg=" . term6
  hi SignColumn guibg=NONE

  execute "hi CocFloatingBorder guifg=" . term13
  execute "hi CocInfoSign guifg=" . term13
  execute "hi CocWarningSign guifg=" . term11

  execute "hi FzfNormalFloat guibg=#fbf1c7 guifg=" . term0

  execute "hi HopNextKey gui=bold guifg=" . term1
  execute "hi HopNextKey1 gui=bold guifg=" . term1
  execute "hi HopNextKey2 gui=bold guifg=" . term9
  execute "hi HopUnmatched guifg=" . term7

  exe "hi markbarSectionBrackets guifg=" . term9
  hi link markbarSectionLowercaseMark markbarSectionBrackets
  hi link markbarSectionSpecialLocalMark markbarSectionBrackets
  execute "hi markbarContextMarkHighlight guibg=" . term1 . " guifg=" . term15

  execute "hi VimwikiHeader1 guifg=" . term15 . " guibg=" . term9
  execute "hi VimwikiHeader2 guifg=" . term15 . " guibg=" . term3
  execute "hi VimwikiHeader3 guifg=" . term15 . " guibg=" . term12

endif

nmap <F5> :source ~/.config/nvim/init.vim<cr>

" ============================ POLYGLOT ============================
" plasticboy/vim-markdown:
" Disable conceal in markdown =>
" conceal : '[link text](link url)' will look 'link text'
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0


" ============================ TREE SITTER ============================
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = {}, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = {},  -- list of language that will be disabled
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF
