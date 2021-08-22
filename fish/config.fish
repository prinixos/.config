#   ___
#  |  _ \  _ __ (_) _ __  (_)__  __ ___   ___
#  | |_) || '__|| || '_ \ | |\ \/ // _ \ / __|
#  |  __/ | |   | || | | || | >  <| (_) |\__ \
#  |_|    |_|   |_||_| |_||_|/_/\_\\___/ |___/
#
#  Github :: https://github.com/prinixos

source ~/.config/shell/export
source ~/.config/shell/alias
set fish_greeting ""
set -x EDITOR nvim

#starship prompt
export STARSHIP_CONFIG=~/.starship/config.toml
starship init fish | source
