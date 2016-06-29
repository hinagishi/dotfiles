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

if not test $TMUX
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

