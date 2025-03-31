function ll --wraps=eza --description 'alias ll=eza -lahF --git'
    eza --long --all --group-directories-first --header --icons --grid --git --no-user --time-style iso --octal-permissions --no-permissions $argv
end