#!/bin/fish
if tmux display
    alacritty -e tmux a
else
    alacritty -e fish
end
