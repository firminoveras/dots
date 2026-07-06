function ls --wraps='eza -la --icons=always --group-directories-first' --wraps='eza -G --icons=always --color=always --group-directories-first' --wraps='eza -Ga --icons=always --color=always --group-directories-first' --description 'alias ls=eza -Ga --icons=always --color=always --group-directories-first'
    eza -Ga --icons=always --color=always --group-directories-first $argv
end
