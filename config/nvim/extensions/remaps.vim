"Leader Key
let mapleader = " "
"BUFFERS
nmap <Leader>x :bd!<CR>
nmap <C-S-Right> :bn<CR>
nmap <C-S-Left> :bp<CR>
"Plugins
nmap <leader>pi :PlugInstall<CR>
nmap <leader>pc :PlugClean<CR>
"FILE MANAGER
nmap <C-e> :Ranger<CR>
"NVIM
nmap <C-S> :source /home/admin/.config/nvim/init.vim<CR>
nmap <Leader>c :e /home/admin/.config/nvim/init.vim<CR>
nmap <leader>o o<Esc>
"PRETTIER
nmap <M-f> :Neoformat<CR>
"Git
nmap <leader>g<right> :diffget //3<CR>
nmap <leader>g<left> :diffget //2<CR>
nmap <leader>g<space> :G<CR>
nmap <leader>g<down> :Git commit<CR>
nmap <leader>g<up> :Git push<CR>
nmap <leader>gl :Git log --oneline<CR>
"FZF
nmap <leader><space> :Files<CR>
nmap <leader>. :Files ~/<CR>
nmap <leader>cs :Colors<CR>
nmap <leader>gb :GBranches<CR>
nmap <C-f> :Rg<CR>
nmap <C-p> :Buffers<CR>
nmap <leader>l :Files ~/.config/<CR>
"Arrow keys
nmap <left> :echo "use h instead"<CR>
nmap <up> :echo "use j instead"<CR>
nmap <down> :echo "use k instead"<CR>
nmap <right> :echo "use l instead"<CR>
" Markdown Remaps
nmap <C-m> :MarkdownPreviewToggle<CR>
