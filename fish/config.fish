set -g fish_greeting
set -gx TERMCMD 'kitty -T "terminal filechooser"'
if status is-interactive
  starship init fish | source
end
