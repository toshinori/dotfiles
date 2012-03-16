PS1="[\u@\h \W]\$ "

alias ls='ls --color=auto'
alias vi='vim'
alias sudo='sudo '
alias tmux='tmux -2'	# -2を付けないとVimが256にならない

export RSENSE_HOME=/opt/rsense-0.3

# rvmの設定 
# http://d.hatena.ne.jp/hrsth/20100609/1276047000
if [[ -e  $HOME/.rvm/scripts/rvm ]] ; then
  source $HOME/.rvm/scripts/rvm;
fi

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting


#if [ -z "$PS1" ]; then return ; fi

#if [ -z $TMUX ] ; then
#    if [ -z `tmux ls` ] ; then
#        tmux
#    else
#        tmux attach
#    fi
#fi
