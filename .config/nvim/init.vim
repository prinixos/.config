"   ___
"  |  _ \  _ __ (_) _ __  (_)__  __ ___   ___
"  | |_) || '__|| || '_ \ | |\ \/ // _ \ / __|
"  |  __/ | |   | || | | || | >  <| (_) |\__ \
"  |_|    |_|   |_||_| |_||_|/_/\_\\___/ |___/
"
"  Github :: https://github.com/prinixos

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
Plug 'junegunn/goyo.vim'
Plug 'neoclide/coc.nvim'
Plug 'mattn/emmet-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'gruvbox-community/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'Yggdroot/indentLine'
Plug 'sbdchd/neoformat'
Plug 'godlygeek/tabular'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'jceb/vim-orgmode'
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'vigoux/LanguageTool.nvim'
Plug 'mcchrish/nnn.vim'
Plug 'vimwiki/vimwiki'
Plug 'ap/vim-css-color'
call plug#end()

source ~/.config/nvim/extensions/indentLine.vim
source ~/.config/nvim/extensions/md.vim
source ~/.config/nvim/extensions/fzf.vim
source ~/.config/nvim/extensions/terminal-settings.vim
source ~/.config/nvim/extensions/remaps.vim
source ~/.config/nvim/extensions/colorsheme.vim
source ~/.config/nvim/extensions/autocommand.vim
source ~/.config/nvim/extensions/status.vim
source ~/.config/nvim/extensions/ranger.vim
source ~/.config/nvim/extensions/vimwiki.vim
