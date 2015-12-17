export CLICOLOR=1
export LANG=ja_JP.UTF-8

test -s ~/.alias && . ~/.alias || true
export PATH=/opt/bin:$PATH
export XDG_CONFIG_HOME=$HOME/.config

alias tmux='tmux -2 -u'

if [ -e $HOME/.bashrc.local ]
then
    source $HOME/.bashrc.local
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

which zsh &> /dev/null
if [ $? = 0 ];
then
    if [ $TERM = "xterm" ] || [ $TERM = "xterm-256color" ] || [ $TERM = "screen" ] || [ $TERM = "screen-256color" ];
    then
        zsh
    fi
fi

