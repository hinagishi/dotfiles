if not test $TMUX
    if test (uname) = "Darwin"
        set -x PATH $PATH $HOME/Library/Python/2.7/bin
        set -x POWERLINE $HOME/Library/Python/2.7/lib/python/site-packages/powerline/bindings/tmux
    end

    tmux -2
end

fish_vi_key_bindings

set -x GOROOT /usr/local/go
set -x GOPATH $HOME/repos
set -x PATH $PATH $GOPATH/bin

function fish_user_key_bindings
    bind \cn peco_src
    bind \cr peco_history
end

