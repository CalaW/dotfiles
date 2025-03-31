set -q MY_ABBRS_INITIALIZED; and return

# Alias
abbr -a cat bat
abbr -a df duf
abbr -a du dust
abbr -a find fd
abbr -a grep rg
abbr -a ping gping
abbr -a ps procs
abbr -a top btm
abbr -a vim nvim


abbr -a -- s sudo
abbr -a -- g git
abbr -a -- gst 'git status'
abbr -a -- gc 'git commit'
abbr -a -- gaa 'git add --all .; git status -s'
abbr -a -- gup 'git pull --rebase --autostash --all'
abbr -a --set-cursor='%' -- ghcs 'gh copilot suggest "%"'
abbr -a -- chmox 'chmod +x'
abbr -a -- cwd 'pwd | pbcopy'
abbr -a -- nv nvim
abbr -a -- rm trash
abbr -a -- mv 'mv -iv' # ask when override
abbr -a -- cp 'cp -iv' # ask when override
abbr -a -- icloud 'cd ~/Library/Mobile\ documents/com~apple~CloudDocs'
abbr -a -- myip 'curl https://ipinfo.io/json'
abbr -a -- msupdate-disable 'sudo chmod 000 /Library/Application\ Support/Microsoft/MAU2.0/Microsoft\ AutoUpdate.app'
abbr -a -- msupdate-enable 'sudo chmod 007 /Library/Application\ Support/Microsoft/MAU2.0/Microsoft\ AutoUpdate.app && open /Library/Application\ Support/Microsoft/MAU2.0/Microsoft\ AutoUpdate.app'

# use alt-s instead
function last_history_item
    echo "$history[1]  # use alt-s instead"
end
abbr -a !! --position anywhere --function last_history_item

set -g MY_ABBRS_INITIALIZED true