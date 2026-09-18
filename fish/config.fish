set -g fish_greeting
set -gx TERMCMD 'kitty -T "terminal filechooser"'
if status is-interactive
  starship init fish | source
end

# Added by LM Studio CLI (lms)
set -gx PATH $PATH /home/firmino/.lmstudio/bin
# End of LM Studio CLI section

