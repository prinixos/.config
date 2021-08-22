#   ___
#  |  _ \  _ __ (_) _ __  (_)__  __ ___   ___
#  | |_) || '__|| || '_ \ | |\ \/ // _ \ / __|
#  |  __/ | |   | || | | || | >  <| (_) |\__ \
#  |_|    |_|   |_||_| |_||_|/_/\_\\___/ |___/
#
#  Github :: https://github.com/prinixos

source ~/.zsh/zsh-snap/znap.zsh
# Basic stff
source ~/.config/zsh/.zprofile #.zshenv stuff
export TERM="xterm-256color"
export HISTFILE=~/.config/zsh/.zsh_history
export EDITOR='nvim'
export TERMINAL='alacritty'
export BROWSER='firefox'
export MANPAGER='nvim +Man!'
export PATH=~/.local/bin:$PATH

## App launchers
alias weather='clear && curl wttr.in'
alias kill='killall -q'

source ~/.config/shell/export
source ~/.config/shell/alias

eval "$(starship init zsh)"
