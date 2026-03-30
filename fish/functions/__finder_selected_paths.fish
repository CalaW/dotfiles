function __finder_selected_paths --description "Print POSIX paths of Finder selection"
    test -x /usr/bin/osascript; or return

    /usr/bin/osascript -e '
tell application "Finder"
    set sel to selection as alias list
    if sel is {} then return ""

    set oldTids to AppleScript'\''s text item delimiters
    set AppleScript'\''s text item delimiters to linefeed

    set out to {}
    repeat with x in sel
        set end of out to POSIX path of x
    end repeat

    set resultText to out as text
    set AppleScript'\''s text item delimiters to oldTids
    return resultText
end tell'
end