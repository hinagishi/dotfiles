init_powerline
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

