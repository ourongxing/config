call plug#begin('~/.config/nvim/plug')
" theme
Plug 'ryanoasis/vim-devicons'
"Plug 'morhetz/gruvbox'

" file tree
Plug 'scrooloose/nerdtree'
" code change tree
Plug 'mbbill/undotree'

" git plug
Plug 'tpope/vim-fugitive'

" auto change fcitx
Plug 'lilydjwg/fcitx.vim'

" Auto Complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" vim tartup screen
Plug 'mhinz/vim-startify'

" FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" leader tips
Plug 'theniceboy/vim-leader-mapper' 

" ranger
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'

" Bracket completion
Plug 'tpope/vim-surround'

" code fold
Plug 'Konfekt/FastFold'

" code named
Plug 'voldikss/vim-codelf'

" multiple cursor
Plug 'terryma/vim-multiple-cursors'

" autoformat
Plug 'Chiel92/vim-autoformat'

" HTML, CSS, JavaScript, PHP, JSON, etc.
Plug 'elzr/vim-json'
Plug 'hail2u/vim-css3-syntax', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'spf13/PIV', { 'for' :['php', 'vim-plug'] }
Plug 'pangloss/vim-javascript', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'yuezk/vim-js', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'MaxMEllon/vim-jsx-pretty', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'jelera/vim-javascript-syntax', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'jaxbot/browserlink.vim'

" Go
Plug 'fatih/vim-go' , { 'for': ['go', 'vim-plug'], 'tag': '*' }

" Python
Plug 'tmhedberg/SimpylFold', { 'for' :['python', 'vim-plug'] }
Plug 'Vimjas/vim-python-pep8-indent', { 'for' :['python', 'vim-plug'] }
"Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins', 'for' :['python', 'vim-plug'] }
Plug 'tweekmonster/braceless.vim'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
Plug 'theniceboy/bullets.vim'
call plug#end()
