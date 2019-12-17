bindkey -e
bindkey "^[[3~" delete-char  # fn + del
setopt histignorealldups
setopt auto_pushd
setopt pushd_ignore_dups
setopt nonomatch
setopt ignoreeof

# completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
[ -f ~/.zsh/plugin/incr*.zsh ] && source ~/.zsh/plugin/incr*.zsh

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups
setopt share_history
export HISTTIMEFORMAT='%F %T '

# tmux
if [[ ! -d ~/.tmux/plugins/tpm ]];then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

if [[ ! -d ~/.zsh/zsh-syntax-highlighting ]];then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
fi
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

if [[ ! -d ~/.zsh/kptool ]];then
    git clone https://github.com/shirou/kptool.git ~/.zsh/kptool/
fi

# prompt
setopt promptsubst
autoload -Uz vcs_info
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{red}"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}"
zstyle ':vcs_info:*' formats "%F{blue}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
setopt prompt_subst
precmd () {
    vcs_info
}
local p_mark="%(?,%F{green},%F{red})%#%f"
PROMPT=" %F{white}%C%f"'${vcs_info_msg_0_}'" $p_mark "

# ls color
eval "$(gdircolors ~/.dircolors-solarized)"
alias ls='gls --color=auto'

# aliases
## convenience
alias ll='ls -l --color=auto'
alias nr='npm run'
alias k='kubectl'
alias dc='docker-compose'
alias be='bundle exec'
alias bi='bundle install -j4 --path vendor/bundle'
alias vi='/usr/local/bin/vim'
alias vim='/usr/local/bin/vim'
alias ip='curl httpbin.org/ip'
alias ssh=~/.zsh/plugin/ssh-customize
function re () {
    repo=$(ghq list -p | peco)
    if [ -n "$repo" ]; then cd $repo;fi
}
function peco-git-delete-branch() {
    local selected_branch=$(git for-each-ref --format='%(refname)' --sort=-committerdate refs/heads | \
        perl -pne 's{^refs/heads/}{}' | \
        peco)
    if [ -n "$selected_branch" ] && [ "release" != "$selected_branch" ]; then
        BUFFER="git branch -D ${selected_branch}"
        CURSOR=$#BUFFER
        zle reset-prompt
    fi
}
zle -N peco-git-delete-branch
bindkey '^d' peco-git-delete-branch

## git
alias gl='git pull'
alias gp='git push'
alias gb='git branch'
alias gm='git merge'
alias gf='git fetch'
alias gc='git commit'
alias gbreset="gf -p && gb --merged | grep -vE '^\\*|master$|develop$|release$' | xargs -I % git branch -d %"
alias git=hub
alias gs='hub browse'
alias gph='git push heroku master'
function gco () {
    git checkout "$@"
    if [ "master" = "$1" ]; then gbreset; fi
    if [ "release" = "$1" ]; then gbreset; fi
}
alias master='gco master && gl && gbreset'

# function aliases
function gfp() { git push && git ftp push -s "$1" }
function vu() { vagrant up "$1" }
function vs() { vagrant ssh "$1" }
function vr() { vagrant reload "$1" --provision }

# peco
function peco-git-recent-branches () {
    local selected_branch=$(git for-each-ref --format='%(refname)' --sort=-committerdate refs/heads | \
        perl -pne 's{^refs/heads/}{}' | \
        peco)
    if [ -n "$selected_branch" ]; then
        BUFFER="gco ${selected_branch}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-git-recent-branches
bindkey "^b" peco-git-recent-branches

function peco-history-selection() {
    BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco --query "$LBUFFER"`
    CURSOR=$#BUFFER
    zle reset-prompt
}
zle -N peco-history-selection
bindkey '^r' peco-history-selection

## phpbrew
export PATH=/usr/local/opt/bzip2/bin:$PATH
export PATH=/usr/local/opt/curl/bin:$PATH
export PATH=/usr/local/opt/icu4c/bin:$PATH
export PATH=/usr/local/opt/icu4c/sbin:$PATH
## composer
export PATH=$HOME/.composer/vendor/bin:$PATH
## golang settings
export GOPATH=$HOME/.go
export PATH=$HOME/.go/bin:$PATH
## postgresql
export PGDATA=/usr/local/var/postgres

# other
export EDITOR='vim'
# 日本語対応
export PATH="/usr/local/opt/libxml2/bin:$PATH"
export PATH="$HOME/.yarn/bin:$PATH"
# homebrew openssl
export PATH=/usr/local/opt/openssl/bin:$PATH

if [ -f ~/.zshrc-work ]; then
    source ~/.zshrc-work
fi

# added by travis gem
[ -f /Users/hiromikimura/.travis/travis.sh ] && source /Users/hiromikimura/.travis/travis.sh

# vscode
function code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args "." }

# anyenv
eval "$(anyenv init -)"

export NVM_DIR="/Users/kimura.hiromi/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
