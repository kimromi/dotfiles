# oh-my-zsh
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
plugins=(git)
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
source $ZSH/oh-my-zsh.sh

# rbenv setting
export RBENV_ROOT="/Users/PMAC243S/.rbenv"
PATH="$RBENV_ROOT/shims:$PATH"
if which rbenv > /dev/null; then
   eval "$(rbenv init -)";
fi

# Emacs ライクな操作を有効にする（文字入力中に Ctrl-F,B でカーソル移動など）
bindkey -e

# Vim Filerのエイリアス
alias vf='vim +VimFiler'

# git add,commit,pushをワンライナーで
function gacp() {
   git add .
   git commit -m "$1"
   git push $2 $3
}

# ls color
eval "$(gdircolors ~/.dircolors-solarized)"
alias ls='gls --color=auto'

# GO PATH
export GOPATH=$HOME/.go
export PATH=$HOME/.go/bin:$PATH

# alias
alias re='cd $(ghq list -p | grep repos | peco)'
alias be='bundle exec'

function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(\history -n 1 | \
        eval $tac | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

# Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
