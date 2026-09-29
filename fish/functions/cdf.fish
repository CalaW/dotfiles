# https://github.com/paulirish/dotfiles/blob/main/fish/functions/cdf.fish
function cdf
    set -l target (__finder_frontmost_path)
    if test -n "$target"
        cd "$target"
        pwd
    else
        echo "No Finder window found" >&2
        return 1
    end
end