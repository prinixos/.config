"Run the following command on fresh installation

"sudo python3 -m pip install --user --upgrade pynvim
"sudo python2 -m pip install --user --upgrade pynvim
"sudo npm install -g neovim
"sudo npm install -g browser-sync

"LIVE SERVER :
"FOR LINUX ONLY ~/.bashrc CONFIGURATION:
"# browser-sync config
"# Get the current local IP address
"export SERVER_IP=`hostname -I`
"# The command alias to start the browser-sync server
"alias serve="browser-sync start --server --files . --no-notify --host $SERVER_IP --port 9000"
"
"START LIVESERVER COMMAND
"browser-sync start --server --files .

syntax on
filetype plugin indent on
set encoding=UTF-8
set exrc
"Cursor Setting
highlight Cursor guifg=white guibg=black
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
set cmdheight=1 "Default Was 2 
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
set splitbelow splitright




">>>>>>>>>>>>>>>PLUGINS MANAGMENT<<<<<<<<<<<<
call plug#begin('~/.vim/plugged')

"Ranger
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'

"MARKDOWN PREVIEW
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

"AutoComplete
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': 'yarn install', 'for': ['json', 'lua', 'vim', ]}
Plug 'ycm-core/YouCompleteMe'
Plug 'mattn/emmet-vim'
Plug 'jiangmiao/auto-pairs'

"Theme
Plug 'flazz/vim-colorschemes'
Plug 'rafi/awesome-vim-colorschemes'
"Airline 
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
call plug#end()



">>>>>>>>>>>>>>>>>>>>>>>>Personalization<<<<<<<<<<<<<<<<<
"Color Scheme
colorscheme hybrid
highlight LineNr guifg=#929292

"Airline (Bottom Status)
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'jsformatter'
let g:airline#airline_theme = 'default'

">>>>>>>>>>>>>>>>>>>>>>>>>LEADER KEY<<<<<<<<<<<<<<<<<<<<<
let mapleader = " "
">>>>>>>>>>>>>>>>>>>>>>>>WINDOW MANAGMENT<<<<<<<<<<<<<<<<
nmap <Leader>w :W<CR>
nmap <Leader>cs :Colors<CR>
nmap <Leader>x :bd!<CR>
nmap <C-S-Right> :bn<CR>
nmap <C-S-Left> :bp<CR>
nmap <Leader>s :w<CR>

">>>>>>>>>>>>>>>>>>>>>>>NO ARROW REMAPS<<<<<<<<<<<<<<<<<<<<
nmap <Up> :res +1<Cr> 
nmap <Down> :res -1<Cr> 
nmap <Left> :vertical resize -1<Cr> 
nmap <Right> :vertical resize +1<Cr> 

">>>>>>>>>>>>>>>>>>>>>>FILE MANGMENT<<<<<<<<<<<<<<<<<<<<<<<<
nmap <C-n> :NERDTreeToggle<CR>
nmap <Leader>nr :NERDTreeRefreshRoot<CR>
nmap <C-e> :Ranger<CR>
nmap <Leader><Leader> :Files<CR>
nmap <Leader>. :Files ~<CR>
noremap <C-a> gg V G $
"NERD TREE CONFIG
let g:NERDTreeGitStatusWithFlags = 1

"RANGER
let g:NERDTreeHijackNetrw = 0 
let g:ranger_replace_netrw = 1 

"FIZ (:Files)
let g:fzf_layout = { 'window': { 'width': 1, 'height': 0.5, 'highlight': 'Comment','yoffset':1 } }
let g:fzf_colors =
            \ { 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
            \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'] }

">>>>>>>>>>>>>>>>>>>NVIM FILE CONFIGURATION<<<<<<<<<<<<<<<<<<
nmap <C-S> :source /home/admin/.config/nvim/init.vim<CR> 
nmap <Leader>c :e /home/admin/.config/nvim/init.vim<CR>

">>>>>>>>>>>>>>>>>TERMINAL MANGMENT<<<<<<<<<<<<<<<<<
"Terminal Remaps
nmap <C-t> :terminal<CR>
tnoremap <Esc> <C-\><C-n>
tnoremap <C-w><C-w> <C-\><C-n><C-w><C-w>
tnoremap <Leader>c <C-\><C-n><C-w><C-q>
tnoremap <C-a> <C-\><C-n>gg V G $

"Termianl Colors
let g:terminal_color_4 = '#5874A4'
let g:terminal_color_5 = '#ffffff'

"No number on terminal
autocmd TermOpen * setlocal nonumber norelativenumber

"Terminal Buffer Switching
let g:previous_window = -1
function SmartInsert()
    if &buftype == 'terminal'
        if g:previous_window != winnr()
            startinsert
        endif
        let g:previous_window = winnr()
    else
        let g:previous_window = -1
    endif
endfunction
au BufEnter * call SmartInsert()

if has('nvim')
    autocmd TermOpen term://* startinsert
endif

">>>>>>>>>>>>>>>>>>>>>>>>MARKDOWN PREVIEW<<<<<<<<<<<<<<
let g:mkdp_auto_start = 1
let g:mkdp_auto_close = 0
"Refresh markdown page in browser
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = 'firefox'
let g:mkdp_echo_preview_url = 1 
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
            \ 'mkit': {},
            \ 'katex': {},
            \ 'uml': {},
            \ 'maid': {},
            \ 'disable_sync_scroll': 0,
            \ 'sync_scroll_type': 'middle',
            \ 'hide_yaml_meta': 1,
            \ 'sequence_diagrams': {},
            \ 'flowchart_diagrams': {},
            \ 'content_editable': v:false,
            \ 'disable_filename': 1
            \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''
" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''
let g:mkdp_port = '1111'
let g:mkdp_page_title = '${name}.md'
let g:mkdp_filetypes = ['markdown']
