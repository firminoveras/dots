set -g fish_greeting
set -gx TERMCMD 'kitty -T "terminal filechooser"'

if status is-interactive
  starship init fish | source
end

# Added by LM Studio CLI (lms)
set -gx PATH $PATH /home/firmino/.lmstudio/bin
# End of LM Studio CLI section

# Added by Antigravity CLI installer
set -gx PATH "/home/firmino/.local/bin" $PATH

# Default Editors for Terminal & CLI
set -gx EDITOR nvim
set -gx VISUAL nvim
