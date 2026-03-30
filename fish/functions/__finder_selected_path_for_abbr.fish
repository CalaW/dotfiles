function __finder_selected_path_for_abbr --description "Return Finder-selected path escaped for commandline insertion"
    set -l p (__finder_selected_paths | head -n 1)
    test -n "$p"; or return 1
    string escape -- $p
end