"" ===
"" === NERDTree
"" ===
noremap tt :NERDTreeToggle<CR>
"let NERDTreeMapOpenExpl = ""
"let NERDTreeMapUpdir = "N"
let NERDTreeMapUpdirKeepOpen = "h"
"let NERDTreeMapOpenSplit = ""
let NERDTreeMapOpenVSplit = "L"
let NERDTreeMapActivateNode = "l"
let NERDTreeMapChangeRoot = "l"
let NERDTreeMapMenu = ","
let NERDTreeMapToggleHidden = "<backspace>"

" ===
" === FZF
" ===
" 查找文件
noremap <C-p> :FZF<CR>
" 查找文件内容
noremap <C-f> :Ag<CR>
" 历史打开的文件
noremap <C-s> :MRU<CR>
" 查找tag
noremap <C-t> :BTags<CR>
" 跳转打开的文件
noremap <C-b> :Buffers<CR>
" 预览每一行
" noremap <C-> :LinesWithPreview<CR>
" 历史命令
noremap <C-q> :History:<CR>

autocmd! Filetype fzf
autocmd  Filetype fzf set laststatus=0 noruler
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

command! -bang -nargs=* MRU call fzf#vim#history(fzf#vim#with_preview())

command! -bang BTags
			\ call fzf#vim#buffer_tags('', {
			\     'down': '40%',
			\     'options': '--with-nth 1
			\                 --reverse
			\                 --prompt "> "
			\                 --preview-window="70%"
			\                 --preview "
			\                     tail -n +\$(echo {3} | tr -d \";\\\"\") {2} |
			\                     head -n 16"'
			\ })

" ===
" === coc
" ===
" fix the most annoying bug that coc has
silent! au BufEnter,BufRead,BufNewFile * silent! unmap
let g:coc_global_extensions = ['coc-pairs', 'coc-tabnine', 'coc-snippets', 'coc-translator', 'coc-python', 'coc-vimlsp', 'coc-html', 'coc-json', 'coc-css', 'coc-tsserver', 'coc-yank', 'coc-stylelint']
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
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction
let g:coc_snippet_next = '<tab>'

inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent><expr> <c-space> coc#refresh()
" Useful commands
" 剪贴板
nnoremap <silent> <leader>y :<C-u>CocList -A --normal yank<cr>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
" 查看定义
nmap <silent> gr <Plug>(coc-references)
" 用于修改变量名字，超级好用
nmap <silent> <leader>rn <Plug>(coc-rename)
" 翻译
nmap <Leader>t <Plug>(coc-translator-p)

" ===
" === Undotree
" ===
noremap ty :UndotreeToggle<CR>
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
let g:undotree_WindowLayout = 2
let g:undotree_DiffpanelHeight = 8
let g:undotree_SplitWidth = 24
function g:Undotree_CustomMap()
	nmap <buffer> k <plug>UndotreeNextState
	nmap <buffer> j <plug>UndotreePreviousState
	nmap <buffer> K 5<plug>UndotreeNextState
	nmap <buffer> J 5<plug>UndotreePreviousState
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
			\'SPC gi':  ['New .gitignore'],
			\'SPC gy':  ['Toggle focus mode'],
			\}
nnoremap <silent> ? :call leaderMapper#start() "<Space>"<CR>
let g:leaderMapperWidth = 40


" ==
" == markdown preview
" ==
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
			\ 'mkit': {},
			\ 'katex': {},
			\ 'uml': {},
			\ 'maid': {},
			\ 'disable_sync_scroll': 0,
			\ 'sync_scroll_type': 'middle',
			\ 'hide_yaml_meta': 1
			\ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'

" ==
" == Airline
" ==
" let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='bubblegum'

" ==
" == Bullets
" ==
let g:bullets_enabled_file_types = [
			\ 'markdown',
			\ 'text',
			\ 'gitcommit',
			\ 'scratch'
			\]

" ==
" == Autformat
" ==
noremap <Leader>f :Autoformat<CR>
let g:autoformat_verbosemode=1

" ==
" == Multiple-cursors 
" ==
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-m>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

" ==
" == ale
" ==
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1
