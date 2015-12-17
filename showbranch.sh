#!/bin/bash

cd `tmux display-message -p -F "#{pane_current_path}"`
git rev-parse --is-inside-work-tree &> /dev/null
if [ $? = 0 ]
then
    branch=`git branch | grep \* | awk '{print $2}'`
    echo "#[fg=colour33,bg=colour16,nobold,noitalics,nounderscore]#[fg=colour15,bg=colour33,nobold,noitalics,nounderscore]  $branch #[fg=colour236,bg=colour33,nobold,noitalics,nounderscore]"
fi


