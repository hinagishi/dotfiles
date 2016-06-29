if not test $TMUX
    if test (uname) = "Darwin"
        set -x PATH $PATH $HOME/Library/Python/2.7/bin
        set -x POWERLINE $HOME/Library/Python/2.7/lib/python/site-packages/powerline/bindings/tmux
    else if test (uname) = "Linux"
        set -x POWERLINE $HOME/.local/lib/python2.7/site-packages/powerline/bindings/tmux
        set -x PATH $PATH $HOME/.local/bin
    end

    tmux -2
end

fish_vi_key_bindings

if test (uname) = "Darwin"
    set -x GOROOT /usr/local/go
else if test (uname) = "Linux"
    set -x GOROOT /opt/go
end
set -x GOPATH $HOME/repos
set -x PATH $PATH $GOPATH/bin

function fish_user_key_bindings
    bind \cn peco_src
    bind \cr peco_history
end

