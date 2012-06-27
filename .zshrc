## Macとそれ以外の環境でaliasを分ける
## http://news.mynavi.jp/column/zsh/022/index.html
case "${OSTYPE}" in
darwin*)
	# Macの場合はMacVimを使用する
	export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
	alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
	alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
  alias ls="ls -lG"
  alias ll="ls -lG"
	;;
linux*)
	alias vi='/usr/local/vim/bin/vim'
	alias vim='/usr/local/vim/bin/vim'
        alias ls="ls -l --color"
        alias ll="ls -l --color"
	;;
esac

# rbenv
# eval "$(rbenv init -)"

PATH=$HOME/bin:$PATH
alias sudo='sudo '
# alias tmux='tmux -2'	# -2を付けないとVimが256にならない
alias cp='cp -r'
alias gst='git status -s'

## Rsense
export RSENSE_HOME=/opt/rsense-0.3

## rvm
# http://d.hatena.ne.jp/hrsth/20100609/1276047000
if [[ -e  $HOME/.rvm/scripts/rvm ]] ; then
  source $HOME/.rvm/scripts/rvm;
fi
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting


## emacs風キーバインド
bindkey -e

## http://blog.blueblack.net/item_208
## プロンプトの設定
autoload colors
colors
PROMPT="%{${fg[green]}%}[%n@%m] %(!.#.$) %{${reset_color}%}"
PROMPT2="%{${fg[green]}%}%_> %{${reset_color}%}"
SPROMPT="%{${fg[red]}%}correct: %R -> %r [nyae]? %{${reset_color}%}"
RPROMPT="%{${fg[green]}%}[%~]%{${reset_color}%}"

## 色を使う
setopt prompt_subst

## ビープを鳴らさない
setopt nobeep

## 履歴関連
## zsh の開始, 終了時刻をヒストリファイルに書き込む
setopt extended_history

## 直前と同じコマンドならヒストリに追加しない
setopt hist_ignore_dups

## 履歴の保存場所と件数
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

## 履歴検索
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

## 履歴ファイルを共有
set share_history

## 補完関連
## 補完候補一覧でファイルの種別をマーク表示
setopt list_types

## 補完機能の強化
autoload -U compinit
compinit

## 補完候補を一覧表示
setopt auto_list

## TAB で順に補完候補を切り替える
setopt auto_menu

## 補完候補のカーソル選択を有効に
zstyle ':completion:*:default' menu select=1

## 補完候補を詰めて表示
setopt list_packed

## 補完候補の色づけ
# eval `dircolors`
# export ZLS_COLORS=$LS_COLORS
# zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
# http://d.hatena.ne.jp/j7400157/20080723/1216827182
export LSCOLORS=ExFxCxdxBxegedabagacad
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
export ZLS_COLORS=$LS_COLORS
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

## コマンドの自動修正機能を使用
setopt correct

## 各種操作
## ディレクトリ名だけで cd
setopt auto_cd

## cd 時に自動で push
setopt auto_pushd

## 同じディレクトリを pushd しない
setopt pushd_ignore_dups


