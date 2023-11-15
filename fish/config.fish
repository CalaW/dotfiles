set -U fish_greeting
set fish_home ~/.config/fish
set SHELL "fish"
set -x EDITOR "nvim"
set -gx GPG_TTY (tty)
# Add HomeBrew's bin directory to path so you can use HomeBrew's binaries like `starship`
# Fish uses `fish_add_path` instead of `export PATH` modify $PATH.
fish_add_path /opt/homebrew/bin/
fish_add_path /opt/homebrew/sbin/
fish_add_path ~/.local/bin/
fish_add_path ~/.cargo/bin/
fish_add_path /opt/homebrew/opt/ruby/bin/
source ~/.config/fish/alias.fish
source ~/.config/fish/functions.fish
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

# homebrew mirror
set -x HOMEBREW_API_DOMAIN "https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles/api"
set -x HOMEBREW_BREW_GIT_REMOTE "https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
set -x HOMEBREW_BOTTLE_DOMAIN "https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles"

if status is-interactive
    # Commands to run in interactive sessions can go here

    # Emulates vim's cursor shape behavior
    # Set the normal and visual mode cursors to a block
    set fish_cursor_default block
    # Set the insert mode cursor to a line
    set fish_cursor_insert line
    # Set the replace mode cursor to an underscore
    set fish_cursor_replace_one underscore
    # The following variable can be used to configure cursor shape in
    # visual mode, but due to fish_cursor_default, is redundant here
    set fish_cursor_visual block
    function postexec_test --on-event fish_postexec
        echo
    end
end
starship init fish | source

