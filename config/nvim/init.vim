"  ___  _   _ _ __ ___  _ __   __ ___  _(_)_ __   __ _
" / _ \| | | | '__/ _ \| '_ \ / _` \ \/ / | '_ \ / _` |
"| (_) | |_| | | | (_) | | | | (_| |>  <| | | | | (_| |
" \___/ \__,_|_|  \___/|_| |_|\__, /_/\_\_|_| |_|\__, |
"                             |___/              |___/
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
set noexpandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set go=
set helplang=cn
set list
set listchars=tab:\|\ ,trail:▫
set scrolloff=4
set ttimeoutlen=0
set notimeout
set viewoptions=cursor,folds,slash,unix
set wrap "自动换行
set linebreak "整字换行
set tw=0
set indentexpr=
set foldmethod=indent
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
" =================================
" ======== Basic Mappings =========
" =================================
" Compile function
source ~/.config/nvim/code-compile.vim

" Set <LEADER> as <SPACE>, ; as :
let mapleader=" "
noremap ; :

" Open Startify
noremap <LEADER>st :Startify<CR>

" Open the vimrc file anytime
noremap <LEADER>rc :e ~/.config/nvim/init.vim<CR>

" Press space twice to jump to the next '<++>' and edit it
noremap <silent> <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

" Open up lazygit
noremap <c-g> :term lazygit<CR>

" Remove search highlighting
noremap <silent> <LEADER><CR> :nohlsearch<CR>


" ===
" === Window management
" ===
" Use <space> + new arrow keys for moving the cursor around windows
noremap <LEADER>w <C-w>w
noremap <LEADER>k <C-w>k
noremap <LEADER>j <C-w>j
noremap <LEADER>h <C-w>h
noremap <LEADER>l <C-w>l

" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
noremap zh :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap zj :set splitbelow<CR>:split<CR>
noremap zk :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap zl :set splitright<CR>:vsplit<CR>

" Resize splits with arrow keys
noremap <LEADER><up> :res +5<CR>
noremap <LEADER><down> :res -5<CR>
noremap <LEADER><left> :vertical resize-5<CR>
noremap <LEADER><right> :vertical resize+5<CR>

" Place the two screens up and down
noremap zh <C-w>t<C-w>K
" Place the two screens side by side
noremap zv <C-w>t<C-w>H

" Rotate screens
noremap zrh <C-w>b<C-w>K
noremap zrv <C-w>b<C-w>H


" Press <SPACE> + q to close the window below the current window
noremap <LEADER>q <C-w>j:q<CR>

" markdown snippets
source ~/.config/nvim/md-snippets.vim

" clipboard
vnoremap y "+y

" C/C++ ';'  at the end
autocmd filetype c inoremap ,; <Esc>A;<CR>
autocmd filetype cpp inoremap ,; <Esc>A;<CR>

" save when you did't use sudo
cnoremap sw w !sudo tee >/dev/null %

" inner termial esc
" tnoremap <Esc> <C-\><C-n>

inoremap <C-S-k> <Up>
inoremap <C-S-j> <Down>
inoremap <C-S-h> <Left>
inoremap <C-S-l> <Right>

noremap H ^
noremap L $

" =================================
" = Install Plugins with Vim-Plug =
" =================================
source ~/.config/nvim/plug-list.vim
colorscheme gruvbox

" ===============================
" ======== Plug Setup ===========
" ===============================
source ~/.config/nvim/plug-setting.vim


