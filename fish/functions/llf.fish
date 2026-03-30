function llf --wraps=eza --description 'alias ll=eza -lahF --git'
    eza --long --all --group-directories-first --header --icons --git --context --mounts --extended --time-style long-iso $argv
end