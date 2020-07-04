"" ===
"" === NERDTree
"" ===
"noremap tt :NERDTreeToggle<CR>
""let NERDTreeMapOpenExpl = ""
""let NERDTreeMapUpdir = "N"
"let NERDTreeMapUpdirKeepOpen = "h"
"let NERDTreeMapOpenSplit = "a"
"let NERDTreeMapOpenVSplit = "L"
"let NERDTreeMapActivateNode = "l"
"let NERDTreeMapChangeRoot = "l"
"let NERDTreeMapMenu = ","
"let NERDTreeMapToggleHidden = "<backspace>"

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
command! -bang BTags
            \ call fzf#vim#buffer_tags('', {
            \       'down': '40%',
            \       'options': '--with-nth 1
            \                   --reverse
            \                   --prompt "> "
            \                   --preview-window="70%"
            \                   --preview "
            \                           tail -n +\$(echo {3} | tr -d \";\\\"\") {2} |
            \                           head -n 16"'
            \ })

" ===
" === coc
" ===
" fix the most annoying bug that coc has
            " \ 'coc-snippets',
silent! au BufEnter,BufRead,BufNewFile * silent! unmap
let g:coc_global_extensions = [
            \ 'coc-translator', 
            \ 'coc-python', 
            \ 'coc-vimlsp', 
            \ 'coc-html', 
            \ 'coc-json', 
            \ 'coc-css', 
            \ 'coc-vetur', 
            \ 'coc-tsserver', 
            \ 'coc-yank', 
            \ 'coc-stylelint', 
            \ 'coc-tabnine', 
            \ 'coc-html', 
            \ 'coc-gitignore'
            \ ]

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]    =~ '\s'
endfunction

autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')

let g:LanguageClient_serverCommands = {
            \ 'sh': ['bash-language-server', 'start']
            \ }

inoremap <silent><expr> <Tab>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<Tab>" :
            \ coc#refresh()

let g:coc_snippet_next = '<tab>'

" 解决coc.nvim大文件卡死状况
let g:trigger_size = 0.5 * 1048576
augroup hugefile
  autocmd!
  autocmd BufReadPre *
        \ let size = getfsize(expand('<afile>')) |
        \ if (size > g:trigger_size) || (size == -2) |
        \   echohl WarningMsg | echomsg 'WARNING: altering options for this huge file!' | echohl None |
        \   exec 'CocDisable' |
        \ else |
        \   exec 'CocEnable' |
        \ endif |
        \ unlet size
augroup END

" 延迟启动
let g:coc_start_at_startup=0
function! CocTimerStart(timer)
    exec "CocStart"
endfunction
call timer_start(500,'CocTimerStart',{'repeat':1})

" Useful Commands
" 剪贴板
nmap <silent> gp :<C-u>CocList --normal yank<cr>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
" 查看定义
nmap <silent> gr <Plug>(coc-references)
" 用于修改变量名字，超级好用
nmap <silent> gn <Plug>(coc-rename)
" 翻译
nmap <silent> gf <Plug>(coc-translator-p)


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
if has("persistent_undo")
    set undodir=$HOME/.cache/vim/undo
    set undofile
endif

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


let g:ft = ''
function! NERDCommenter_before()
  if &ft == 'vue'
    let g:ft = 'vue'
    let stack = synstack(line('.'), col('.'))
    if len(stack) > 0
      let syn = synIDattr((stack)[0], 'name')
      if len(syn) > 0
        exe 'setf ' . substitute(tolower(syn), '^vue_', '', '')
      endif
    endif
  endif
endfunction
function! NERDCommenter_after()
  if g:ft == 'vue'
    setf vue
    let g:ft = ''
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
"
" ==
" == Easy Align
" ==
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" ==
" == vim-vue
" ==
" vue中只高亮存在的文件格式
let g:vue_pre_processors = 'detect_on_enter'

" ==
" == vim-snippets
" ==
let g:UltiSnipsSnippetDirectories=["UltiSnips","~/Github/snippets"]
