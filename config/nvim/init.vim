" ___  _         _ _ __ ___  _ __               __ ___  _(_)_ __         __ _
" / _ \| | | | '__/ _ \| '_ \ / _` \ \/ / | '_ \ / _` |
" | (_) | |_| | | | (_) | | | | (_| |>  <| | | | | (_| |
" \___/ \__,_|_|        \___/|_| |_|\__, /_/\_\_|_| |_|\__, |
"                                                                                                                        |___/                                                  |___/
"
" Author: @ourongxing & @theniceboy
" ===
" === Auto load for first time uses
" ===
if empty(glob('~/.config/nvim/autoload/plug.vim'))
                silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                                                                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
                autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ===
" === Create a _machine_specific.vim file to adjust machine specific stuff, like python interpreter location
" ===
let has_machine_specific_file = 1
if empty(glob('~/.config/nvim/_machine_specific.vim'))
                let has_machine_specific_file = 0
                silent! exec "!cp ~/.config/nvim/default_configs/_machine_specific_default.vim ~/.config/nvim/_machine_specific.vim"
                silent! :e ~/.config/nvim/_machine_specific.vim
endif
source ~/.config/nvim/_machine_specific.vim

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
set noshowmode
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
" Compile function
source ~/.config/nvim/code-compile.vim

" Markdown snippets
source ~/.config/nvim/md-snippets.vim

" Set <LEADER> as <SPACE>
let mapleader=" "

" Open Startify
noremap <silent> <LEADER>st :Startify<CR>

" Open the vimrc file anytime
noremap <silent> <LEADER>rc :e ~/.config/nvim/init.vim<CR>

" Open up lazygit
noremap <silent> <c-g> :term lazygit<CR>

" Remove search highlighting
noremap <silent> <LEADER><CR> :nohlsearch<CR>

inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" 保存和加载折叠
noremap <silent> <Leader>zm :mkview<CR>
noremap <silent> <Leader>zl :loadview<CR>

" 切换缓冲区
noremap <silent> <C-j> :bp<CR>
noremap <silent> <C-k> :bn<CR>
noremap <silent> <C-Left> :bp<CR>
noremap <silent> <C-Right> :bn<CR>
noremap <silent> <Leader>x :bd<CR>
noremap <silent> <Leader>1 :1b<CR>

" Press <SPACE> + q to close the window below the current window
noremap <LEADER>q <C-w>j:q<CR>
noremap S <C-w>j:w<CR>

" Clipboard
vnoremap y "+y

" C/C++ ';'  at the end
autocmd filetype c inoremap ,; <Esc>A;<CR>
autocmd filetype cpp inoremap ,; <Esc>A;<CR>

" inner termidsdl esc
" tnoremap <Esc> <C-\><C-n>

noremap H ^
noremap L $

noremap U <C-r>

" noremap <LEADER><LEADER> <Esc>

" Press ` to change case (instead of ~)
" 快速切换首字母大小写
" ~的作用就是切换大小写
noremap ` b~

" ===
" === Window management
" ===
" Use <space> + new arrow keys for moving the cursor around windows
noremap zw <C-w>w
" noremap zgk <C-w>k
" noremap zgj <C-w>j
" noremap zgh <C-w>h
" noremap zgl <C-w>l

" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
noremap zh :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap zj :set splitbelow<CR>:split<CR>
noremap zk :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap zl :set splitright<CR>:vsplit<CR>

" Resize splits with arrow keys
noremap zzk :res +5<CR>
noremap zzj :res -5<CR>
noremap zzh :vertical resize+5<CR>
noremap zzl :vertical resize-5<CR>

" Place the two screens up and down
noremap zh <C-w>t<C-w>K
" Place the two screens side by side
noremap zv <C-w>t<C-w>H

" Rotate screens
noremap zrh <C-w>b<C-w>K
noremap zrv <C-w>b<C-w>H

" 将两个空格转化为四个空格
" noremap <silent> <leader>zz :set ts=2<CR>:set noexpandtab<CR>:%retab!<CR>:set ts=4<CR>:set expandtab<CR>:%retab!<CR>

" figlet
noremap tx :r !figlet
noremap mm bi <Esc>ea <Esc>
autocmd Filetype json inoremap <buffer> <silent> ,k %keyword%
autocmd Filetype json noremap <buffer> <silent> ,d T"dt"i

" =================================
" = Install Plugins with Vim-Plug =
" =================================
source ~/.config/nvim/plug-list.vim
colorscheme gruvbox
set background=dark

" =================================
" ========== Plug Setup ===========
" =================================
source ~/.config/nvim/plug-setting.vim
