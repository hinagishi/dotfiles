export CLICOLOR=1
test -s ~/.alias && . ~/.alias || true
export PATH=/opt/bin:$PATH


if [ $TERM = "screen" ];
then
	export TERM=xterm-256color
	zsh
fi

if [ $TERM = "xterm" ];
then
	export TERM=xterm-256color
	tmux
fi
