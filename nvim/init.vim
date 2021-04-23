"   ___
"  |  _ \  _ __ (_) _ __  (_)__  __ ___   ___
"  | |_) || '__|| || '_ \ | |\ \/ // _ \ / __|
"  |  __/ | |   | || | | || | >  <| (_) |\__ \
"  |_|    |_|   |_||_| |_||_|/_/\_\\___/ |___/

syntax on
filetype plugin indent on
set encoding=UTF-8
set exrc
set guicursor=n-v-c:block-Cursor
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set nowritebackup
set shortmess+=c
set cmdheight=1
set undodir=~/.vim/undodir
set updatetime=300
set undofile
set incsearch
set termguicolors
set scrolloff=8
set noshowmode
set completeopt=menuone,noinsert,noselect
set signcolumn=yes
set updatetime=50
set shortmess+=c
set colorcolumn=80
set splitbelow splitright

call plug#begin('~/.vim/plugged')
Plug 'gruvbox-community/gruvbox'
Plug 'Yggdroot/indentLine'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': 'yarn install', 'for': ['json', 'lua', 'vim', 'html','css']}
Plug 'ycm-core/YouCompleteMe'
Plug 'mattn/emmet-vim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'sbdchd/neoformat'
Plug 'neovim/nvim-lspconfig'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
call plug#end()

nmap <leader>g<right> :diffget //3<CR>
nmap <leader>g<left> :diffget //2<CR>
nmap <leader>g<space> :G<CR>
nmap <leader>g<down> :Git commit<CR>
nmap <leader>g<up> :Git push<CR>

source ~/.config/nvim/extensions/indentLine.nvim
source ~/.config/nvim/extensions/md.nvim
source ~/.config/nvim/extensions/ycm.nvim
source ~/.config/nvim/extensions/terminal-settings.nvim
source ~/.config/nvim/extensions/remaps.nvim
source ~/.config/nvim/extensions/colorsheme.nvim

"Run the following command on fresh installation
"sudo python3 -m pip install --user --upgrade pynvim
"sudo python2 -m pip install --user --upgrade pynvim
"sudo npm install -g neovim
"sudo npm install -g browser-sync
" Add the following line in alacritty.yml config for commenting mapping <C-/>
" - { key: Slash,    mods: Control,       chars: "gc"              }
"LIVE SERVER :
"FOR LINUX ONLY ~/.bashrc CONFIGURATION:
"# browser-sync config
"# Get the current local IP address
"export SERVER_IP=`hostname -I`
"# The command alias to start the browser-sync server
"alias serve="browser-sync start --server --files . --no-notify --host $SERVER_IP --port 9000"
"START LIVESERVER COMMAND
" browser-sync start --server --files .
