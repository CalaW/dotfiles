function __finder_frontmost_path_for_abbr
    set -l target (__finder_frontmost_path)

    if test -n "$target"
        string escape -- "$target"
    else
        echo fdf
    end
end