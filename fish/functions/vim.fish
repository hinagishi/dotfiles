function vim
    if test $COLUMNS -ge 120
        tmux split-window -h -p 80 /usr/local/bin/vim $argv
    else
        /usr/local/bin/vim $argv
    end
end

