let g:airline_powerline_fonts = 0

"" ===
"" === NERDTree
"" ===
noremap tt :NERDTreeToggle<CR>
"let NERDTreeMapOpenExpl = ""
"let NERDTreeMapUpdir = "N"
"let NERDTreeMapUpdirKeepOpen = "n"
"let NERDTreeMapOpenSplit = ""
"let NERDTreeMapOpenVSplit = "I"
"let NERDTreeMapActivateNode = "i"
"let NERDTreeMapOpenInTab = "o"
"let NERDTreeMapOpenInTabSilent = "O"
"let NERDTreeMapPreview = ""
"let NERDTreeMapCloseDir = ""
"let NERDTreeMapChangeRoot = "l"
let NERDTreeMapMenu = ","
let NERDTreeMapToggleHidden = "zh"

" ===
" === FZF
" ===
noremap <C-p> :FZF<CR>
" you can search text from all file, please install the_silver_searcher
noremap <C-f> :Ag<CR>
noremap <C-h> :MRU<CR>
noremap <C-t> :BTags<CR>
noremap <C-l> :LinesWithPreview<CR>
" noremap <C-w> :Buffers<CR>
noremap q; :History:<CR>

autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noruler
\| autocmd BufLeave <buffer> set laststatus=2 ruler

command! -bang -nargs=* Buffers
\ call fzf#vim#buffers(
\   '',
\   <bang>0 ? fzf#vim#with_preview('up:60%')
\           : fzf#vim#with_preview('right:0%', '?'),
\   <bang>0)


command! -bang -nargs=* LinesWithPreview
    \ call fzf#vim#grep(
    \   'rg --with-filename --column --line-number --no-heading --color=always --smart-case . '.fnameescape(expand('%')), 1,
    \   fzf#vim#with_preview({}, 'up:50%', '?'),
    \   1)

command! -bang -nargs=* Ag
\ call fzf#vim#ag(
\   '',
\   <bang>0 ? fzf#vim#with_preview('up:60%')
\           : fzf#vim#with_preview('right:50%', '?'),
\   <bang>0)

" ===
" === coc
" ===
" fix the most annoying bug that coc has
silent! au BufEnter,BufRead,BufNewFile * silent! unmap if
let g:coc_global_extensions = ['coc-python', 'coc-vimlsp', 'coc-html', 'coc-json', 'coc-css', 'coc-tsserver', 'coc-yank', 'coc-lists', 'coc-gitignore', 'coc-vimlsp', 'coc-tailwindcss', 'coc-stylelint']
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]	=~ '\s'
endfunction
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')
let g:LanguageClient_serverCommands = {
    \ 'sh': ['bash-language-server', 'start']
    \ }
inoremap <silent><expr> <Tab>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<Tab>" :
			\ coc#refresh()
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent><expr> <c-space> coc#refresh()
" Useful commands
nnoremap <silent> <space>y :<C-u>CocList -A --normal yank<cr>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)

" ===
" === Undotree
" ===
noremap L :UndotreeToggle<CR>
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
let g:undotree_WindowLayout = 2
let g:undotree_DiffpanelHeight = 8
let g:undotree_SplitWidth = 24
function g:Undotree_CustomMap()
	nmap <buffer> u <plug>UndotreeNextState
	nmap <buffer> e <plug>UndotreePreviousState
	nmap <buffer> U 5<plug>UndotreeNextState
	nmap <buffer> E 5<plug>UndotreePreviousState
endfunc

" ===
" === Ranger.vim
" ===
nnoremap R :Ranger<CR>
let g:ranger_map_keys = 0

" ===
" === vim-map-leader
" ===
let g:leaderMenu = {'name':  "Shortcut Menu",
\'SPC f':  ['Advanced find'],
\'SPC rc': ['Edit nvim config'],
\'SPC Enter':  ['Clear search'],
\'SPC dw':  ['Remove adj. dup. words'],
\'SPC tt':  ['spc to tabs'],
\'SPC o':  ['Open folds'],
\'SPC q':  ['Close win below'],
\'SPC /':  ['Open terminal'],
\'SPC <SPC>':  ['Find <++>'],
\'SPC sc':  ['Toggle spell-check'],
\'SPC gf':  ['Fold unchanged'],
\'SPC g-':  ['Previous hunk'],
\'SPC g=':  ['Next Hunk'],
\'SPC rn':  ['Rename variable'],
\'SPC tm':  ['Toggle table-mode'],
\'SPC a':  ['Calculate equation'],
\'SPC gi':  ['New .gitignore'],
\'SPC gy':  ['Toggle focus mode'],
\}
nnoremap <silent> ? :call leaderMapper#start() "<Space>"<CR>
let g:leaderMapperWidth = 50

" ===
" === fastfold
" ===
nmap zuz <Plug>(FastFoldUpdate)
let g:fastfold_savehook = 1
let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
let g:fastfold_fold_movement_commands = [']z', '[z', 'ze', 'zu']

let g:markdown_folding = 1
let g:tex_fold_enabled = 1
let g:vimsyn_folding = 'af'
let g:xml_syntax_folding = 1
let g:javaScript_fold = 1
let g:sh_fold_enabled= 7
let g:ruby_fold = 1
let g:perl_fold = 1
let g:perl_fold_blocks = 1
let g:r_syntax_folding = 1
let g:rust_fold = 1
let g:php_folding = 1

" ===
" === Codelf
" ===
inoremap <silent> <F9> <C-R>=codelf#start()<CR>
nnoremap <silent> <F9> :call codelf#start()<CR>

" ==
" == vim-multiple-cursor
" ==
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_start_word_key = '<c-k>'
let g:multi_cursor_select_all_word_key = '<a-k>'
let g:multi_cursor_start_key = 'g<c-k>'
let g:multi_cursor_select_all_key = 'g<a-k>'
let g:multi_cursor_next_key = '<c-k>'
let g:multi_cursor_prev_key = '<c-p>'
let g:multi_cursor_skip_key = '<C-s>'
let g:multi_cursor_quit_key = '<Esc>'
