function which --description 'better `which`'
    if abbr --query $argv
        echo "$argv is an abbreviation with definition:"
        abbr --show | command grep "abbr -a -- $argv "
        echo
        type --all $argv 2>/dev/null
        return 0
    else
        type --all $argv
    end
end