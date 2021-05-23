"   ___
"  |  _ \  _ __ (_) _ __  (_)__  __ ___   ___
"  | |_) || '__|| || '_ \ | |\ \/ // _ \ / __|
"  |  __/ | |   | || | | || | >  <| (_) |\__ \
"  |_|    |_|   |_||_| |_||_|/_/\_\\___/ |___/
"
"  Github :: https://github.com/prinixos

"Terminal Remaps
nmap <C-t> :terminal<CR>
tnoremap <Esc> <C-\><C-n>
tnoremap <C-w><C-w> <C-\><C-n><C-w><C-w>
tnoremap <C-w><C-q> <C-\><C-n> :q<CR>

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

"Auto insert if its a terminal
if has('nvim')
    autocmd TermOpen term://* startinsert
endif
