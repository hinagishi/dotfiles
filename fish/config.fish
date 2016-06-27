if not test $TMUX
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

