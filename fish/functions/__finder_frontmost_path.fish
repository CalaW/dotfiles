function __finder_frontmost_path
    if not test -x /usr/bin/osascript
        return 1
    end

    osascript -e '
        tell application "Finder"
            if (count of Finder windows) > 0 then
                get POSIX path of ((target of Finder window 1) as alias)
            end if
        end tell
    '
end