" ===
" === FZF
" ===

" 查找文件
nmap <C-s> :FZF<CR>
" 查找文件内容
nmap <C-f> :Ag<CR>
" 历史打开的文件
nmap <C-m> :MRU<CR>
" 缓冲区
" nmap <C-b> :Buffers<CR>
" 命令
nmap <C-p> :Commands<CR>
" 历史命令
nmap <C-q> :History:<CR>

noremap <CR> <nop>

autocmd! Filetype fzf
autocmd  Filetype fzf set laststatus=0 noruler
      \| autocmd BufLeave <buffer> set laststatus=2 ruler
command! -bang -nargs=* Buffers
      \ call fzf#vim#buffers(
      \       '',
      \       <bang>0 ? fzf#vim#with_preview('up:60%')
      \                       : fzf#vim#with_preview('right:0%', '?'),
      \       <bang>0)
command! -bang -nargs=* LinesWithPreview
      \ call fzf#vim#grep(
      \       'rg --with-filename --column --line-number --no-heading --color=always --smart-case . '.fnameescape(expand('%')), 1,
      \       fzf#vim#with_preview({}, 'up:50%', '?'),
      \       1)
command! -bang -nargs=* Ag
      \ call fzf#vim#ag(
      \       '',
      \       <bang>0 ? fzf#vim#with_preview('up:60%')
      \                       : fzf#vim#with_preview('right:50%', '?'),
      \       <bang>0)

command! -bang -nargs=* MRU call fzf#vim#history(fzf#vim#with_preview())

" ===
" === coc
" ===
let g:coc_global_extensions = [
      \ 'coc-actions',
      \ 'coc-css',
      \ 'coc-sh',
      \ 'coc-clangd',
      \ 'coc-gitignore',
      \ 'coc-html',
      \ 'coc-json',
      \ 'coc-python',
      \ 'coc-snippets',
      \ 'coc-stylelint',
      \ 'coc-syntax',
      \ 'coc-tsserver',
      \ 'coc-vimlsp',
      \ 'coc-go',
      \ 'coc-emmet',
      \ 'coc-yaml',
      \ 'coc-rls']

" 相同单词高亮显示
autocmd CursorHold * silent call CocActionAsync('highlight')

" 查询按键绑定 verbose map <key>
 

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
let g:coc_snippet_next = '<tab>'

" tab 键选中
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" pumvisible() 表示有代码提示的时候
inoremap <expr><C-K> pumvisible() ? "\<C-p>" : "\<up>"
inoremap <expr><C-J> pumvisible() ? "\<C-n>" : "\<down>"
inoremap <expr><C-H> pumvisible() ? "\<Esc>" : "\<left>"
inoremap <expr><C-L> pumvisible() ? (complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>") : "<right>"

" inoremap <silent><expr> <c-o> coc#refresh()
nnoremap <silent><nowait> <LEADER>d :CocList diagnostics<cr>
nmap <silent> <LEADER>- <Plug>(coc-diagnostic-prev)
nmap <silent> <LEADER>= <Plug>(coc-diagnostic-next)
nnoremap <c-c> :CocCommand<CR>

" 变量重命名
nmap <leader>rn <Plug>(coc-rename)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)

" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@

" ===
" === Ranger.vim
" ===
noremap tt :Ranger<CR>
let g:ranger_map_keys = 0


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
" == Lightline
" ==
set laststatus=2
set showtabline=2
let g:lightline = {
      \ 'colorscheme': 'darcula',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \   'readonly': 'LightlineReadonly',
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ 'tabline': {
      \   'left': [['buffers']], 'right': []
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers'
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel'
      \ }
      \ }

function! LightlineFilename()
  let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
  let modified = &modified ? ' +' : ''
  return filename . modified
endfunction

function! LightlineReadonly()
  return &readonly && &filetype !=# 'help' ? 'RO' : ''
endfunction

" 低于两个buffer时不显示
let g:lightline#bufferline#min_buffer_count = 2
let g:lightline#bufferline#show_number  = 2
let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#unicode_symbols = 1
let g:lightline#bufferline#unnamed      = '[No Name]'
let g:lightline#bufferline#filename_modifier = ':t'

" ==
" == Bufferline
" ==
" let g:bufferline_show_bufnr = 0


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
" == Rainbow
" ==
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
let g:rainbow_conf = {
      \   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
      \   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
      \   'operators': '_,_',
      \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
      \   'separately': {
      \       '*': {},
      \       'tex': {
      \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
      \       },
      \       'lisp': {
      \           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
      \       },
      \       'vim': {
      \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
      \       },
      \       'html': {
      \           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
      \       },
      \       'css': 0,
      \   }
      \}

" ==
" == cpp
" ==
let g:cpp_no_function_highlight           = 0
let g:cpp_class_scope_highlight           = 1
let g:cpp_member_variable_highlight       = 1
let g:cpp_class_decl_highlight            = 1
let g:cpp_experimental_template_highlight = 1
let c_no_curly_error                      = 1

" ==
" == EasyMotion
" ==
let g:EasyMotion_smartcase = 1
"let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
nmap <silent> <Leader><leader>h <Plug>(easymotion-linebackward)
nmap <silent> <Leader><Leader>j <Plug>(easymotion-j)
nmap <silent> <Leader><Leader>k <Plug>(easymotion-k)
nmap <silent> <Leader><leader>l <Plug>(easymotion-lineforward)
" 重复上一次操作, 类似repeat插件, 很强大
nmap <silent> <Leader><leader>. <Plug>(easymotion-repeat)

" ==
" == nerdcommenter
" ==
nmap <silent> gcc <Plug>NERDCommenterToggle<cr>
vmap <silent> gc <Plug>NERDCommenterToggle<cr>

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let g:NERDCustomDelimiters = { 'stylus': { 'left': '//'} }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

" Set local options based on subtype
function! OnChangeVueSubtype(subtype)
  " echom 'subtype is '.a:subtype
  if a:subtype == 'html'
    setlocal commentstring=<!--%s-->
    setlocal comments=s:<!--,m:\ \ \ \ ,e:-->
  elseif a:subtype =~ 'css'
    setlocal comments=s1:/*,mb:*,ex:*/ commentstring&
  else
    setlocal commentstring=//%s
    setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,://
  endif
endfunction

" ==
" == Scroll
" ==
" 滚动平滑，交换半屏和全屏滚动
let g:scroll_no_mappings = 1
nmap <silent> <C-d> <Plug>scroll_page_down
nmap <silent> <C-u> <Plug>scroll_page_up
nmap <silent> <C-b> :Buffers<CR>
nmap <silent> <C-f> :Ag<CR>
nmap <silent> zz <Plug>scroll_center
nmap <silent> zt <Plug>scroll_top

" ==
" == Visual Multi
" ==
" 这个插件增加了一个多光标模式，看似是visual，其实是normal，在这个模式下，大部分快捷键与normal相同
" 在这个模式下，又出现了一个 leader 键，默认是\\
" 有两类快捷键，一类是在visual/normal中生效的，二是在多光标下模式下生效
" let g:VM_maps                       = {}
" let g:VM_maps['Find Operator']      = ""
" let g:VM_maps['Find Under']         = 'M'
" let g:VM_maps['Find Subword Under'] = 'M'


" ==
" == highlight
" ==
" 包括相同单词高亮和颜色高亮
hi illuminatedWord cterm=underline gui=underline
let g:Hexokinase_highlighters = ['backgroundfull']
let g:Illuminate_ftblacklist = ['python']


" ==
" == vim-json
" ==
let g:vim_json_warnings = 1
let g:vim_json_syntax_conceal = 0  " json不省略冒号

" ==
" == vim-go
" ==
let g:go_gopls_enabled = 0

" Javascript
autocmd bufnewfile,bufread *.tsx set filetype=typescript.tsx
autocmd bufnewfile,bufread *.jsx set filetype=javascript.jsx
augroup filetype javascript syntax=javascript

" ==
" == vimspector
" ==
let g:vimspector_enable_mappings = 'HUMAN'
function! s:read_template_into_buffer(template)
    " has to be a function to avoid the extra space fzf#run insers otherwise
    execute '0r ~/.config/nvim/vimspector_json/'.a:template
endfunction
command! -bang -nargs=* LoadVimSpectorJsonTemplate call fzf#run({
            \   'source': 'ls -1 ~/.config/nvim/vimspector_json',
            \   'down': 20,
            \   'sink': function('<sid>read_template_into_buffer')
            \ })
noremap <leader>vs :tabe .vimspector.json<CR>:LoadVimSpectorJsonTemplate<CR>
sign define vimspectorBP         text=\ ● texthl=WarningMsg
sign define vimspectorBPCond     text=\ ◆ texthl=WarningMsg
sign define vimspectorBPDisabled text=\ ● texthl=LineNr
sign define vimspectorPC         text=\ ▶ texthl=MatchParen linehl=CursorLine
sign define vimspectorPCBP       text=●▶  texthl=MatchParen linehl=CursorLine
let g:vimspector_sign_priority = {
  \    'vimspectorBP':         999,
  \    'vimspectorBPCond':     998,
  \    'vimspectorBPDisabled': 997,
  \    'vimspectorPC':         1999,
  \    'vimspectorPCBP':       1999,
  \ }

" ==
" == gitblame
" ==
nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>

" ==
" == autopair
" ==
let g:AutoPairsMapCh = 0 "关闭<c-h>的默认的默认映射
" let g:AutoPairsMapBS = 0 "关闭删除键自动删除成对的符号
