" =============================================================================
" Filename: autoload/lightline/colorscheme/darcula.vim
" Author: kkopec
" License: MIT License
" Last Change: 2017/02/11 21:18:54.
" =============================================================================

let s:base01 = [ '#4e4e31', 239 ]
let s:black = [ '#2b2b2b', 235 ]
let s:gray = [ '#323232', 236 ]
let s:white = [ '#d0d0d0', 252 ]
let s:blue = [ '#87afaf' , 109 ] 
let s:green = [ '#87af87', 108 ] 
let s:red = [ '#d68787', 204 ]
let s:yellow = [ '#d8af5f', 181 ]

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
" 两部分嘛，然后前景色和背景色
let s:p.normal.left = [ [ s:black, s:green ], [ s:white, s:base01 ] ]
let s:p.normal.right = [ [ s:black, s:green ], [ s:white, s:base01 ] ]
let s:p.inactive.left =  [ [ s:black, s:blue ], [ s:white, s:base01 ] ]
let s:p.inactive.right = [ [ s:black, s:blue ], [ s:white, s:base01 ] ]
let s:p.insert.left = [ [ s:black, s:blue ], [ s:white, s:base01 ] ] 
let s:p.insert.right = [ [ s:black, s:blue ], [ s:white, s:base01 ] ]
let s:p.replace.left = [ [ s:black, s:red ], [ s:white, s:base01 ] ]
let s:p.replace.right = [ [ s:black, s:red ], [ s:white, s:base01 ] ]
let s:p.visual.left = [ [ s:black, s:yellow ],  [ s:white, s:base01 ] ] 
let s:p.visual.right = [ [ s:black, s:yellow ],  [ s:white, s:base01 ] ] 
let s:p.normal.middle = [ [ s:white, s:gray ] ]
let s:p.inactive.middle = [ [ s:white, s:gray ] ]
let s:p.tabline.left = [ [ s:green, s:gray ] ]
let s:p.tabline.tabsel = [ [ s:black, s:green ] ]
let s:p.tabline.middle = [ [ s:green, s:gray ] ]
let s:p.tabline.right = [ [ s:black, s:green ] ]
let s:p.normal.error = [ [ s:red, s:black ] ]
let s:p.normal.warning = [ [ s:yellow, s:black ] ]

let g:lightline#colorscheme#darcula#palette = lightline#colorscheme#flatten(s:p)
