" Colors
let s:white = { "gui": "#F3F3F3", "cterm": "15", "cterm16" : "15" }

let s:asphalt_subtle = { "gui": "#100E23", "cterm": "232", "cterm16": "8" }
let s:dark_asphalt = { "gui": "#565575", "cterm": "236", "cterm16": "0" }

let s:red = { "gui": "#ff8080", "cterm": "204", "cterm16": "1" }
let s:dark_red = { "gui": "#ff5458", "cterm": "203", "cterm16": "9" }

let s:green = { "gui": "#95ffa4", "cterm": "120", "cterm16": "2" }
let s:dark_green = { "gui": "#62d196", "cterm": "119", "cterm16": "10" }

let s:yellow = { "gui": "#ffe9aa", "cterm": "228", "cterm16": "3" }
let s:dark_yellow = { "gui": "#ffb378", "cterm": "215", "cterm16": "11" }

let s:cyan = { "gui": "#008080", "cterm": "6", "cterm16": "14" }
let s:dark_cyan = { "gui": "#005f5f", "cterm": "23", "cterm16": "6" }
let s:void = { "gui": "#021b1b", "cterm": "23", "cterm16": "6" }

let s:bg_subtle       = s:asphalt_subtle
let s:bg_dark         = s:dark_asphalt
let s:visual          = s:bg_dark

" lightline my lightline colors:
let s:lfc = {
      \'white': [ s:white.gui, s:white.cterm16],
      \'asphalt_subtle': [s:asphalt_subtle.gui, s:asphalt_subtle.cterm16],
      \'dark_asphalt' : [s:dark_asphalt.gui, s:dark_asphalt.cterm16],
      \'red' : [s:red.gui, s:red.cterm16],
      \'dark_red' : [s:dark_red.gui, s:dark_red.cterm16],
      \'green' : [s:green.gui, s:green.cterm16],
      \'dark_green' : [s:dark_green.gui, s:dark_green.cterm16],
      \'yellow' : [s:yellow.gui, s:yellow.cterm16],
      \'dark_yellow' : [s:dark_yellow.gui, s:dark_yellow.cterm16],
      \'cyan' : [s:cyan.gui, s:cyan.cterm16],
      \'dark_cyan' : [s:dark_cyan.gui, s:dark_cyan.cterm16],
      \'void' : [s:void.gui, s:void.cterm16],
      \'bg_subtle': [s:bg_subtle.gui, s:bg_subtle.cterm16],
      \'bg_dark': [s:bg_dark.gui, s:bg_dark.cterm16],
      \}

let s:p = { 'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {} }

" Tabline
let s:p.tabline.left    = [ [ s:lfc.white, s:lfc.void] ]
let s:p.tabline.tabsel  = [ [ s:lfc.white, s:lfc.cyan] ]
let s:p.tabline.middle  = [ [ s:lfc.white, s:lfc.void] ]
let s:p.tabline.right   = [ [ s:lfc.white, s:lfc.dark_cyan],  [ s:lfc.white, s:lfc.cyan ] ]

" Normal mode
let s:p.normal.left     = [ [ s:lfc.white, s:lfc.dark_cyan],  [ s:lfc.white, s:lfc.cyan ] ]
let s:p.normal.middle   = [ [ s:lfc.white, s:lfc.void] ]
let s:p.normal.right    = [ [ s:lfc.white, s:lfc.dark_cyan],  [ s:lfc.white, s:lfc.cyan] ]
let s:p.normal.error    = [ [ s:lfc.red, s:lfc.bg_subtle ] ]
let s:p.normal.warning  = [ [ s:lfc.yellow, s:lfc.bg_subtle ] ]

" Visual mode
let s:p.visual.left     = [ [ s:lfc.bg_subtle, s:lfc.yellow ],  [ s:lfc.bg_subtle, s:lfc.dark_yellow ] ]
let s:p.visual.right    = [ [ s:lfc.bg_subtle, s:lfc.yellow ],  [ s:lfc.bg_subtle, s:lfc.dark_yellow ] ]

" Replace mode
let s:p.replace.left    = [ [ s:lfc.bg_subtle, s:lfc.green ],  [ s:lfc.bg_subtle, s:lfc.dark_green ] ]
let s:p.replace.right   = [ [ s:lfc.bg_subtle, s:lfc.green ],  [ s:lfc.bg_subtle, s:lfc.dark_green ] ]

" Insert mode
let s:p.insert.left     = [ [ s:lfc.bg_subtle, s:lfc.red ],  [ s:lfc.bg_subtle, s:lfc.dark_red ] ]
let s:p.insert.right    = [ [ s:lfc.bg_subtle, s:lfc.red ],  [ s:lfc.bg_subtle, s:lfc.dark_red ] ]

" Inactive split
let s:p.inactive.left   = [ [ s:lfc.dark_asphalt, s:lfc.bg_subtle ], [ s:lfc.dark_asphalt, s:lfc.bg_subtle ] ]
let s:p.inactive.middle = [ [ s:lfc.dark_asphalt, s:lfc.bg_subtle ] ]
let s:p.inactive.right  = [ [ s:lfc.dark_asphalt, s:lfc.bg_subtle ], [ s:lfc.dark_asphalt, s:lfc.bg_subtle ] ]

let g:lightline#colorscheme#mlc#palette = lightline#colorscheme#flatten(s:p)
