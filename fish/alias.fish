alias chmox='chmod +x'
alias ls='eza'
alias ll='eza -lahF --git' # --header, maybe lsd is alternative(with icon)
alias mv='mv -iv' # ask when override
alias cp='cp -iv' # ask when override
alias df='df -h' # human readable disk
alias cat='bat'
alias top='btm'
alias htop='btm'
alias rm='trash'
alias grep='rg'
alias du='dust' # disk usage
alias find='fd'
alias icloud="cd ~/Library/Mobile\ documents/com~apple~CloudDocs"
alias myip="curl https://ipinfo.io/json"
alias msupdate-disable='sudo chmod 000 /Library/Application\ Support/Microsoft/MAU2.0/Microsoft\ AutoUpdate.app'
alias msupdate-enable='sudo chmod 007 /Library/Application\ Support/Microsoft/MAU2.0/Microsoft\ AutoUpdate.app && open /Library/Application\ Support/Microsoft/MAU2.0/Microsoft\ AutoUpdate.app'
alias cwd='pwd | pbcopy'

abbr -a s "sudo"
abbr -a g "git"
abbr -a gst "git status"
abbr -a gc "git commit"
abbr -a gaa 'git add --all .; git status -s'

# !!
function last_history_item
    echo $history[1]
end
abbr -a !! --position anywhere --function last_history_item
