"
"
"         \    /    _______      ______
"          \  /     |     |      |    |     |      |
"           \/      |     |      |____|     |      |
"           |       |     |      | \        |      |
"           |       |     |      |  \       |      |
"           |       |_____|      |   \      |______|
"
"
" by Nayed Saïd Ali
" https://github.com/nayed

hi clear
if exists('syntax_on')
  syntax reset
endif

set background=dark

let g:colors_name = "yoru"

let g:terminal_ansi_colors = ['#ebebeb', '#1a1a1a', '#707070', '#808080',
          \ '#19535f', '#732c2c', '#333333', '#8f8f8f', '#616161', '#b0b0b0',
          \ '#0a0a0a', '#262626', '#424242', '#9e9e9e', '#8dce91', '#525252']

let g:terminal_color_0 = g:terminal_ansi_colors[0]
let g:terminal_color_1 = g:terminal_ansi_colors[1]
let g:terminal_color_2 = g:terminal_ansi_colors[2]
let g:terminal_color_3 = g:terminal_ansi_colors[3]
let g:terminal_color_4 = g:terminal_ansi_colors[4]
let g:terminal_color_5 = g:terminal_ansi_colors[5]
let g:terminal_color_6 = g:terminal_ansi_colors[6]
let g:terminal_color_7 = g:terminal_ansi_colors[7]
let g:terminal_color_8 = g:terminal_ansi_colors[8]
let g:terminal_color_9 = g:terminal_ansi_colors[9]
let g:terminal_color_10 = g:terminal_ansi_colors[10]
let g:terminal_color_11 = g:terminal_ansi_colors[11]
let g:terminal_color_12 = g:terminal_ansi_colors[12]
let g:terminal_color_13 = g:terminal_ansi_colors[13]
let g:terminal_color_14 = g:terminal_ansi_colors[14]
let g:terminal_color_15 = g:terminal_ansi_colors[15]

" Basic vim color

execute "hi Boolean gui=NONE guifg=" . g:terminal_color_0 . " guibg=NONE"
execute "hi ColorColumn gui=NONE guifg=NONE guibg=NONE guibg=" . g:terminal_color_1
execute "hi Comment gui=NONE guifg=" . g:terminal_color_2 . " guibg=NONE"
execute "hi Conceal gui=NONE guifg=" . g:terminal_color_3 . " guibg=NONE"
execute "hi Conditional gui=NONE guifg=" . g:terminal_color_0 . " guibg=NONE"
execute "hi Constant gui=NONE guifg=" . g:terminal_color_3 . " guibg=NONE"
hi Cursor gui=reverse guifg=NONE guibg=NONE
execute "hi CursorColumn gui=NONE guifg=NONE guibg=" . g:terminal_color_1
execute "hi CursorLine gui=NONE guifg=NONE guibg=" . g:terminal_color_1
execute "hi CursorLineNr gui=NONE guifg=" . g:terminal_color_2 . " guibg=NONE"
execute "hi DiffAdd gui=NONE guifg=NONE guibg=" . g:terminal_color_4
execute "hi DiffChange gui=NONE guifg=NONE guibg=" . g:terminal_color_1
execute "hi DiffDelete gui=NONE guifg=NONE guibg=" . g:terminal_color_5
execute "hi DiffText gui=NONE guifg=NONE guibg=" . g:terminal_color_6
execute "hi Directory gui=NONE guifg=" . g:terminal_color_7 . " guibg=NONE"
execute "hi Error gui=NONE guifg=NONE guibg=" . g:terminal_color_5
execute "hi ErrorMsg gui=NONE guifg=NONE guibg=" . g:terminal_color_5
execute "hi FoldColumn gui=NONE guifg=" . g:terminal_color_8 . " guibg=NONE"
execute "hi Folded gui=NONE guifg=" . g:terminal_color_2 . " guibg=NONE"
hi Ignore gui=NONE guifg=NONE guibg=NONE
execute "hi IncSearch gui=NONE guifg=" . g:terminal_color_1 . " guibg=" . g:terminal_color_14
execute "hi LineNr gui=NONE guifg=" . g:terminal_color_8 . " guibg=NONE"
execute "hi MatchParen gui=NONE guifg=NONE guibg=" . g:terminal_color_6
hi ModeMsg gui=NONE guifg=NONE guibg=NONE
hi MoreMsg gui=NONE guifg=NONE guibg=NONE
execute "hi NonText gui=NONE guifg=" . g:terminal_color_8 . " guibg=NONE"
execute "hi Normal gui=NONE guifg=" . g:terminal_color_9 . " guibg=" . g:terminal_color_10
execute "hi Number gui=NONE guifg=" . g:terminal_color_0 . " guibg=NONE"
execute "hi Pmenu gui=NONE guifg=NONE guibg=" . g:terminal_color_1
execute "hi PmenuSbar gui=NONE guifg=NONE guibg=" . g:terminal_color_11
execute "hi PmenuSel gui=NONE guifg=NONE guibg=" . g:terminal_color_6
execute "hi PmenuThumb gui=NONE guifg=NONE guibg=" . g:terminal_color_12
hi Question gui=NONE guifg=NONE guibg=NONE
execute "hi Search gui=NONE guifg=" . g:terminal_color_0 . " guibg=" . g:terminal_color_4
execute "hi SignColumn gui=NONE guifg=" . g:terminal_color_8 . " guibg=NONE"
execute "hi Special gui=NONE guifg=" . g:terminal_color_0 . " guibg=NONE"
execute "hi SpecialKey gui=NONE guifg=" . g:terminal_color_8 . " guibg=NONE"
execute "hi SpellBad gui=undercurl guisp=NONE guifg=NONE guibg=" . g:terminal_color_5
hi SpellCap gui=undercurl guisp=NONE guifg=NONE guibg=NONE
execute "hi SpellLocal gui=undercurl guisp=NONE guifg=NONE guibg=" . g:terminal_color_4
execute "hi SpellRare gui=undercurl guisp=NONE guifg=NONE guibg=" . g:terminal_color_11
execute "hi Statement gui=NONE guifg=" . g:terminal_color_0 . " guibg=NONE"
execute "hi StatusLine gui=NONE guifg=". g:terminal_color_13 . " guibg=" . g:terminal_color_11
execute "hi StatusLineNC gui=NONE guifg=". g:terminal_color_2 . " guibg=" . g:terminal_color_11
execute "hi StorageClass gui=NONE guifg=" . g:terminal_color_0 . " guibg=NONE"
execute "hi String gui=NONE guifg=" . g:terminal_color_14 . " guibg=NONE"
execute "hi TabLine gui=NONE guifg=". g:terminal_color_2 . " guibg=" . g:terminal_color_11
execute "hi TabLineFill gui=NONE guifg=NONE guibg=" . g:terminal_color_11
execute "hi TabLineSel gui=NONE guifg=". g:terminal_color_13 . " guibg=" . g:terminal_color_11
execute "hi Title gui=NONE guifg=" . g:terminal_color_3 . " guibg=NONE"
hi Todo gui=standout guifg=NONE guibg=NONE
execute "hi Type gui=NONE guifg=" . g:terminal_color_0 . " guibg=NONE"
hi Underlined gui=NONE guifg=NONE guibg=NONE
execute "hi VertSplit gui=NONE guifg=" . g:terminal_color_6 . " guibg=NONE"
execute "hi Visual gui=NONE guifg=NONE guibg=" . g:terminal_color_6
hi VisualNOS gui=NONE guifg=NONE guibg=NONE
execute "hi WarningMsg gui=NONE guifg=NONE guibg=" . g:terminal_color_5
execute "hi WildMenu gui=NONE guifg=NONE guibg=" . g:terminal_color_15
hi lCursor gui=NONE guifg=NONE guibg=NONE
hi Identifier gui=NONE guifg=NONE guibg=NONE
hi PreProc gui=NONE guifg=NONE guibg=NONE

execute "hi CocHighlightText gui=NONE guifg=NONE guibg=" . g:terminal_color_15
