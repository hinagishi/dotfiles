export CLICOLOR=1
export LANG=ja_JP.UTF-8

test -s ~/.alias && . ~/.alias || true
export PATH=/opt/bin:$PATH

alias tmux='tmux -2 -u'

if [ -e $HOME/.bashrc.local ]
then
    source $HOME/.bashrc.local
fi

if [ $TERM = "screen" ] || [ $TERM = "screen-256color" ];
then
    which zsh >& /dev/null
    if [ $? = 0 ];
    then
	    zsh
    fi
fi

if [ $TERM = "xterm" ] || [ $TERM = "xterm-256color" ];
then
    which tmux >& /dev/null
    if [ $? = 0 ];
    then
        tmux
    fi
fi

