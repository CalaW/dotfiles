# https://github.com/paulirish/dotfiles/blob/main/fish/functions/cdf.fish
function cdf
    if [ -x /usr/bin/osascript ]
    set -l target (osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of ((target of Finder window 1) as alias)')
        if [ "$target" != "" ]
            cd "$target"; pwd
        else
            echo "No Finder window found" >&2
        end
    end
end