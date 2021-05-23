#exec tclock
set fish_greeting ""
set -x EDITOR vim
alias todo="calcurse"
alias podcast="castero"
alias animemusic="~/Applications/animemusic.AppImage"
alias c="clear"
alias r="ranger"
alias ls="exa --oneline"
alias l="exa --all"
alias la="exa -la"
alias tree="exa --tree"
alias x="exit"
alias nano="nvim"
alias n="cd && clear"
alias cat="bat"
alias grep="rg"
#sleep service stop
alias unsl="alacritty -e sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target"
#sleep service start
alias sl="alacritty -e sudo systemctl unmask sleep.target suspend.target hibernate.target hybrid-sleep.target"
#liveserver in a folder
alias serve="browser-sync start --server --files . --no-notify --host $SERVER_IP --port 3000"


#Anilist export
alias mal="python ~/prinix/git/ALExport/AniListExport.py"
#tclock
alias t="~/.config/tclock/tock -c"
#launch brave in incogneto mode
alias incognito="brave --incognito"

alias youtube-local='python ~/.config/youtube-local/server.py'

#starship prompt
starship init fish | source
