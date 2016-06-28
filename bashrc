export CLICOLOR=1
export LANG=ja_JP.UTF-8
export XDG_CONFIG_HOME=$HOME/.config
LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:bd=40;33;01:cd=40;33;01:ex=01;30;32:*.tar.gz=01;31;33:*.tgz=01;31;33:*.tar.bz2=01;31;33:*.zip=01;31;33:*.rar=01;31;33'
export LS_COLORS
export LSCOLORS=exfxcxdxbxegedabagacad
export DICTIONARY=en_US
export DICPATH=$HOME/.hunspell_dic

test -s ~/.proxyrc && . ~/.proxyrc || true
test -f ~/.fzf.bash && . ~/.fzf.bash || true

which zsh &> /dev/null
if [ $? = 0 ];
then
    if [ $TERM = "xterm" ] || [ $TERM = "xterm-256color" ] || [ $TERM = "screen" ] || [ $TERM = "screen-256color" ];
    then
        zsh
    fi
fi


# Setting PATH for Python 3.5
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
export PATH
