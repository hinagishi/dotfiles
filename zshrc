export LANG=ja_JP.UTF-8
bindkey -v
autoload colors
colors
setopt auto_cd
setopt auto_pushd
setopt correct
setopt list_packed
setopt nolistbeep

# 補完設定
autoload -U compinit
compinit

# 先方予測
#autoload predict-on
#predict-on

# コマンド履歴
HISTFILE=~/.zsh_history
HISTSIZE=100
SAVEHIST=100
# ignore duplication command history list
setopt hist_ignore_dups
# share command history data
setopt share_history

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end



###############プロンプトの設定###############
case ${UID} in
0)
  PROMPT="%B%{${fg[red]}%}%/#%/%n{${reset_color}%}%b "
  PROMPT2="%B%{${fg[red]}%}%_#%{${reset_color}%}%b "
  SPROMPT="%B%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
  [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
    PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"
  ;;
*)
  PROMPT="%{${fg[red]}%}[ %n%% ]%{${reset_color}%} "
  PROMPT2="%{${fg[red]}%}%_%%%{${reset_color}%} "
  RPROMPT="%B%{${fg[white]}%}[ %~%% ]%{${reset_color}%}%b "
  SPROMPT="%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "
  [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
    PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"
  ;;
esac

# Windowタイトル設定
case "${TERM}" in
kterm*|xterm*)
        precmd() {
                printf "\e]0;${USER}@${HOST%%.*}:${PWD}\a"
        }
        ;;
screen*|ansi*)
        preexec() {
                #printf "\eP\e]0;!${1%% *}\a\e\\"  #screen使用時にもxtermのタイトルを変更できる。下記のコメントアウトされたprintfも同様。ウィンドウ間の移動をするとコマンドを実行するかEnterを押すまで実際の状態と食い違ってしまうので注意。
                printf "\ek!$1\e\\"
        }
        precmd() {
                #printf "\eP\e]0;~$(basename $(pwd))\a\e\\"
                printf "\ek~$(basename $(pwd))\e\\"
        }
    ;;
esac

###############他の設定ファイルを読み込む###############

#文字コード、$PATH,$MANPATH,その他のエイリアスは分離

[ -f ~/.zshrc.mine ] && source ~/.zshrc.mine
if [[ -s $HOME/.rvm/scripts/rvm ]] ; then source $HOME/.rvm/scripts/rvm ; fi

fpath=($HOME/.zsh_completions/src $fpath)

###############色の設定##################
LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:bd=40;33;01:cd=40;33;01:ex=01;30;32:*.tar.gz=01;31;33:*.tgz=01;31;33:*.tar.bz2=01;31;33:*.zip=01;31;33:*.rar=01;31;33'
export LS_COLORS

export LSCOLORS=exfxcxdxbxegedabagacad

export TERM=xterm-256color

if [ -f /usr/local/bin/vim ]
then
	alias vim="/usr/local/bin/vim"
fi

if [ `uname` = "Linux" ];
then
    alias ls="ls --color=always"
fi


if [ `uname` = "Darwin" ];
then
    alias mplayer='open -a "/Applications/MPlayerX.app"'
    alias firefox='open -a "/Applications/Firefox.app"'
    alias preview='open -a "/Applications/Preview.app"'
    alias -s {pdf}=preview
    alias ls="ls -G"
fi

alias -s {mp4,avi,wmv,flv,mkv}=mplayer
alias -s {html,htm}=firefox

alias memo="vim `date '+%Y%m%d'.txt`"

export PATH=$PATH:/opt/apache-ant/bin
export ANT_HOME=/opt/apache-ant

if which pyenv &> /dev/null; then eval "$(pyenv init -)"; fi
export PYENV_ROOT=$HOME/.pyenv

if [ -e $HOME/.zshrc.misc ]
then
    source $HOME/.zshrc.misc
fi
