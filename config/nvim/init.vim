"                                        _
"  ___  _   _ _ __ ___  _ __   __ ___  _(_)_ __   __ _
" / _ \| | | | '__/ _ \| '_ \ / _` \ \/ / | '_ \ / _` |
"| (_) | |_| | | | (_) | | | | (_| |>  <| | | | | (_| |
" \___/ \__,_|_|  \___/|_| |_|\__, /_/\_\_|_| |_|\__, |
"                             |___/              |___/
"
" Author: @ourongxing & @theniceboy

" ===============================
" ======== Editor Setup =========
" ===============================
" ===
" === System
" ===

" set clipboard=unnamedplus
" set the <leader> = backspace
let &t_ut=''
set autochdir

" ===
" === Editor behavior
" ===
set number
set relativenumber
set cursorline
set tabstop=4
set noshowmode
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set autoread
set go=
set hidden
set helplang=cn
set list
set listchars=tab:\|\ ,trail:▫
set scrolloff=4
set ttimeoutlen=0
set notimeout
set viewoptions=cursor,folds,slash,unix
set wrap "自动换行
" set linebreak "整字换行
set tw=0
set indentexpr=
set foldmethod=manual
set foldlevel=99
set foldenable
set formatoptions-=tc
set splitright
set splitbelow
set showcmd
set wildmenu
set ignorecase
set smartcase
set shortmess+=c
set inccommand=split
set ttyfast "should make scrolling faster
set lazyredraw "same as above
set visualbell
"set colorcolumn=80
set updatetime=1000
let g:deoplete#enable_at_startup = 1

" when python
let python_highlight_all=1
autocmd Filetype python set tabstop=4
autocmd Filetype python set softtabstop=4
autocmd Filetype python set shiftwidth=4
autocmd Filetype python set textwidth=79
autocmd Filetype python set expandtab
autocmd Filetype python set autoindent
autocmd Filetype python set fileformat=unix
autocmd Filetype python set foldmethod=indent
autocmd Filetype python set foldlevel=99

" =================================
" ======== Basic Mappings =========
" =================================
"
let g:python_host_prog='/home/orongxing/miniconda3/envs/python27/bin/python'
let g:python3_host_prog='/home/orongxing/miniconda3/envs/python36/bin/python'
" markdown_preview
let g:mkdp_browser = 'surf'

" some functions
source ~/.config/nvim/custom-utils.vim

" snippets
source ~/.config/nvim/custom-snippets.vim

" Set <LEADER> as <SPACE>
let mapleader=" "

" Open Startify
nnoremap <silent> <LEADER>st :Startify<CR>

" Open the vimrc file anytime
nnoremap <silent> <LEADER>rc :e ~/.config/nvim/init.vim<CR>

" Open up lazygit
nnoremap <silent> <C-g> :term lazygit<CR>

" Remove search highlighting
nnoremap <silent> <LEADER><CR> :nohlsearch<CR>

inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" 保存和加载折叠
nnoremap <silent> zs :mkview<CR>
nnoremap <silent> zl :loadview<CR>

" 切换缓冲区
nnoremap <silent> <C-j> :bp<CR>
nnoremap <silent> <C-k> :bn<CR>
nnoremap <silent> <Leader>x :w<CR>:bd<CR>
nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)


" Press <SPACE> + q to close the window below the current window
nnoremap <LEADER>q :q<CR>
nnoremap <LEADER>z ZZ
nnoremap <LEADER>w :w<CR>

" Clipboard
nnoremap <LEADER>y "+y
nnoremap <LEADER>p "+p

" inner termidsdl esc
" tnoremap <Esc> <C-\><C-n>

nnoremap H ^
nnoremap L $

nmap U <C-r>

" nnoremap <LEADER><LEADER> <Esc>

" Press ` to change case (instead of ~)
" 快速切换首字母大小写
" ~的作用就是切换大小写
nnoremap ` b~

" ===
" === Window management
" ===
" Use <space> + new arrow keys for moving the cursor around windows
nnoremap cw  <C-w>w

" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
nnoremap ck :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
nnoremap cl :set nosplitright<CR>:vsplit<CR>:set splitright<CR>

" Resize splits with arrow keys
nnoremap cdj :res +5<CR>
nnoremap cdk :res -5<CR>
nnoremap cdl :vertical resize+5<CR>
nnoremap cdh :vertical resize-5<CR>

" Rotate screens
nnoremap crh <C-w>b<C-w>K
nnoremap crv <C-w>b<C-w>H

" figlet
nnoremap tx :r !figlet

nnoremap <C-r> :call CompileRunGcc()<CR>
nnoremap <silent> <leader>\ :Autoformat<CR>
autocmd Filetype markdown nnoremap <buffer> <silent> <leader>\ :call PanGuSpacing()<CR>

" =================================
" = Install Plugins with Vim-Plug =
" =================================
source ~/.config/nvim/plug-list.vim
colorscheme seoul256
" colorscheme gruvbox
let g:seoul256_background = 234
colo seoul256
set background=dark

" =================================
" ========== Plug Setup ===========
" =================================
source ~/.config/nvim/plug-setting.vim
