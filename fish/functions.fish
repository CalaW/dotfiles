function pwdf
    echo "\
tell application \"Finder\"
    if (count of Finder windows) is 0 then
        set dir to (home as alias)
    else
        set dir to ((target of Finder window 1) as alias)
    end if
    return POSIX path of dir
end tell" | osascript
end

alias cdf='cd "$(pwdf)"'
