function init_powerline
    if test (uname) = "Darwin"
        if test -e $HOME/Library/Python/2.7/lib/python/site-packages/powerline/bindings/tmux
            set -x POWERLINE $HOME/Library/Python/2.7/lib/python/site-packages/powerline/bindings/tmux
            set -x PATH $PATH $HOME/Library/Python/2.7/bin
        else if test -e $HOME/Library/Python/3.5/lib/python/site-packages/powerline/bindings/tmux
            set -x POWERLINE $HOME/Library/Python/3.5/lib/python/site-packages/powerline/bindings/tmux
            set -x PATH $PATH $HOME/Library/Python/3.5/bin
        end
    else if test (uname) = "Linux"
        echo "linux"
        if test -e $HOME/.local/lib/python2.7/site-packages/powerline/bindings/tmux
            echo "set val"
            set -x POWERLINE $HOME/.local/lib/python2.7/site-packages/powerline/bindings/tmux
            set -x PATH $PATH $HOME/.local/bin
        end
    end
end

