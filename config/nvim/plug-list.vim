call plug#begin('~/.config/nvim/plug')

" Theme
Plug 'ryanoasis/vim-devicons'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Tpope is so powerful
" ====================== 
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-abolish'
" =======================

" File tree
Plug 'scrooloose/nerdtree'

" Code change tree
Plug 'mbbill/undotree'

" Auto toggle fcitx
Plug 'lilydjwg/fcitx.vim'

" Auto Complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Vim tartup screen
Plug 'mhinz/vim-startify'

" FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" vim-multiple-cursors
Plug 'terryma/vim-multiple-cursors'

" Ranger
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'

" Auto to format
Plug 'Chiel92/vim-autoformat'

" Rainbow bracket
Plug 'luochen1990/rainbow'

" Remember last edit
Plug 'farmergreg/vim-lastplace'

" Chinese vimdoc
Plug 'yianwillis/vimcdoc'

" EasyMOtion
Plug 'Lokaltog/vim-easymotion'

" Cpp
Plug 'octol/vim-cpp-enhanced-highlight' 

" 
Plug 'honza/vim-snippets'

" HTML, CSS, JavaScript, PHP, JSON, etc.
Plug 'elzr/vim-json'
Plug 'iloginow/vim-stylus', { 'for': ['vim-plug', 'stylus'] }
Plug 'hail2u/vim-css3-syntax', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css','less', 'stylus'] }
Plug 'pangloss/vim-javascript', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'yuezk/vim-js', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'MaxMEllon/vim-jsx-pretty', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'jelera/vim-javascript-syntax', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'jaxbot/browserlink.vim'
Plug 'digitaltoad/vim-pug', { 'for' :['pug', 'vim-plug'] }
Plug 'stephpy/vim-yaml'

" Go
Plug 'fatih/vim-go' , { 'for': ['go', 'vim-plug'], 'tag': '*' }

" Python
Plug 'tmhedberg/SimpylFold', { 'for' :['python', 'vim-plug'] }
Plug 'Vimjas/vim-python-pep8-indent', { 'for' :['python', 'vim-plug'] }
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins', 'for' :['python', 'vim-plug'] }
Plug 'tweekmonster/braceless.vim'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for' :['markdown', 'vim-plug'] }
Plug 'dkarter/bullets.vim'

" colorize all rgb text
Plug 'lilydjwg/colorizer'

call plug#end()
