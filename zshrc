# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

setopt NO_CASE_GLOB         #case-insensitive globbing
setopt AUTO_CD              #cd when directly enter path
setopt SHARE_HISTORY        #share history across multiple sessions
setopt INC_APPEND_HISTORY       #immediately append to history
setopt HIST_EXPIRE_DUPS_FIRST   #expire duplicate commands first 
setopt HIST_IGNORE_ALL_DUPS #ignore all dups
setopt HIST_FIND_NO_DUPS    #ignore dups when searching
setopt HIST_REDUCE_BLANKS   #remove blank lines in history
setopt HIST_IGNORE_SPACE    #ignore command start with space
setopt HIST_VERIFY          #verify before execute the command(!!)
setopt CORRECT_ALL          #enable auto-correct with command and argument
#setopt CORRECT              #enable auto-correct with command

bindkey -v #vim like shell

export HISTSIZE=65535
export SAVEHIST=$HISTSIZE

export LANG="zh_CN.UTF-8"
export LC_ALL="en_US.UTF-8"

export CPLUS_INCLUDE_PATH=/opt/homebrew/include/eigen3 #eigen library

export EDITOR='nvim'
export PAGER='bat'
# export TERM=xtrem-256color

# export HOMEBREW_NO_AUTO_UPDATE=1
export NEOVIDE_FRAME='none'
export PATH="/Users/calaw/.local/bin:$PATH"
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

# themes
test -r ~/.dir_colors && eval $(gdircolors ~/.dir_colors)
export BAT_THEME="Nord"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

alias bathelp='bat --plain --language=help'
help() {
    "$@" --help 2>&1 | bathelp
}
alias ls='exa'
alias ll='exa -lahF --git' # --header, maybe lsd is alternative(with icon)
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

function manpdf () {
    man -t "$1" | open -fa Skim.app
}

# prints the path of the front Finder window. Enter Home if no window open
function pwdf () {
    osascript <<EOS
        tell application "Finder"
            if (count of Finder windows) is 0 then
                set dir to (home as alias)
            else
                set dir to ((target of Finder window 1) as alias)
            end if
            return POSIX path of dir
        end tell
EOS
}
# changes directory to frontmost Finder window
alias cdf='cd "$(pwdf)"'

source /opt/homebrew/opt/powerlevel10k/powerlevel10k.zsh-theme
# source /opt/homebrew/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_STRATEGY=(history)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
# source /opt/homebrew/opt/zsh-fast-syntax-highlighting/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
    #autoload -Uz compinit
    #compinit
fi

source /opt/homebrew/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
# ZVM_CURSOR_STYLE_ENABLED=false
ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
zvm_after_init_commands+=('[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh') # load fzf after zvm to resolve key binding conflict

source /opt/homebrew/share/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export FZF_DEFAULT_COMMAND='fd --type file --hidden --no-ignore --exclude={.git,.idea,.vscode,.sass-cache,node_modules,build}'
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
    --color=fg:#e5e9f0,bg:#3b4252,hl:#81a1c1
    --color=fg+:#e5e9f0,bg+:#3b4252,hl+:#81a1c1
    --color=info:#eacb8a,prompt:#bf6069,pointer:#b48dac
    --color=marker:#a3be8b,spinner:#b48dac,header:#a3be8b'
# export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
#     --color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9
#     --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9
#     --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6
#     --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4'

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval $(thefuck --alias)
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

fpath+=~/.func

# The following lines were added by compinstall

zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'
zstyle :compinstall filename '/Users/calaw/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# highlighters
#ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
# this line need to be placed at the end of zshrc
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
