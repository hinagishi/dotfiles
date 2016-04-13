export LANG=ja_JP.UTF-8
bindkey -v
autoload colors
colors
setopt auto_cd
setopt auto_pushd
setopt correct
setopt list_packed
setopt nolistbeep

HISTFILE=~/.zsh_history
HISTSIZE=100
SAVEHIST=100
setopt hist_ignore_dups
setopt share_history

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end


test -s ~/.alias && . ~/.alias || true
test -s ~/.localrc && . ~/.localrc || true
test -f ~/.fzf.zsh && . ~/.fzf.zsh || true

###############プロンプトの設定###############
case ${UID} in
0)
  PROMPT=$'%{\e[48;5;31;38;5;255m%} ヽ（o・_・o）ノ %{\e[m%}%{\e[38;5;31m%}  %{\e[m%}% '
  PROMPT2="%B%{${fg[red]}%}%_#%{${reset_color}%}%b "
  SPROMPT="%B%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
  [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
    PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"
  ;;
*)
  PROMPT=$'%{\e[48;5;31;38;5;255m%} ヽ（o・_・o）ノ %{\e[m%}%{\e[38;5;31m%}  %{\e[m%}% '
  PROMPT2=$'%{\e[48;5;31m%}%{\e[m%}%{\e[38;5;31m%}  %{\e[m%}% '
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




function peco-src () {
    local selected_dir=$(ghq list --full-path | peco --query "$LBUFFER")
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-src
bindkey "^N" peco-src
alias -g B='`git branch | peco | sed -e "s/^\*[ ]*//g"`'

function peco-select-history() {
    typeset tac
    if which tac > /dev/null; then
        tac=tac
    else
        tac='tail -r'
    fi
    BUFFER=$(fc -l -n 1 | eval $tac | peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle redisplay
}
zle -N peco-select-history
bindkey '^r' peco-select-history

function peco-find-file() {
    if git rev-parse 2> /dev/null; then
        source_files=$(git ls-files)
    else
        source_files=$(find . -type f)
    fi
    selected_files=$(echo $source_files | peco --prompt "[find file]")

    BUFFER="${BUFFER}`echo $selected_files | tr '\n' ' '`"
    CURSOR=$#BUFFER
    zle redisplay
}
zle -N peco-find-file
bindkey '^f' peco-find-file

tmux has-session &> /dev/null
if [ $? = 1 ];
then
    tmux -2 -u
fi

