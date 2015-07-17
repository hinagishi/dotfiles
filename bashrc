export CLICOLOR=1
export LANG=ja_JP.UTF-8

test -s ~/.alias && . ~/.alias || true
export PATH=/opt/bin:$PATH

alias tmux='tmux -2 -u'

if [ -e $HOME/.bashrc.local ]
then
    source $HOME/.bashrc.local
fi

if [ $TERM = "screen" ];
then
    which zsh >& /dev/null
    if [ $? = 0 ];
    then
	    export TERM=xterm-256color
	    zsh
    fi
fi

if [ $TERM = "xterm" ];
then
    which tmux >& /dev/null
    if [ $? = 0 ];
    then
	    export TERM=xterm-256color
        tmux
    fi
fi


