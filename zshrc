# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="powerline"

plugins=(git nyan rails zeus)

source $ZSH/oh-my-zsh.sh

export EDITOR=vim
export JAVA_HOME="/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home"

[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh
export TERM="xterm-256color"

# Git aliases
alias glp="git log --pretty=format:'%C(yellow)%h%C(reset) %s %C(cyan)%cr%C(reset) %C(blue)%an%C(reset) %C(green)%d%C(reset)' --graph --date-order"
alias gs='git status'
alias gsync="git pull upstream master && git push origin master"
alias gri='git rebase -i origin/master'
alias gpu='git push -u origin head'

#tmux
alias tmn='tmux new -s'
alias tmk='tmux kill-session -t'
alias tma='tmux attach -t'
alias tml='tmux list-sessions'
alias tm="tmuxinator"

alias fms='foreman start'
alias hi='history'
alias her="heroku"

alias sbash='source ~/.bash_profile'
alias jpp='python -mjson.tool'
alias rr='rake routes'

alias start_redis='redis-server /usr/local/etc/redis.conf'
alias be='nocorrect bundle exec'
alias m="mvim"
alias v="vim"

# docker
alias dc='docker-compose'
alias dcf='docker-compose -f **/docker-compose.yml([1])'
alias dm='docker-machine'
alias dstop="docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)"

gog() {
  cd $(bundle show $1)
}

# chruby settings
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh

[[ -r ~/.zshrc.private ]] && . ~/.zshrc.private

#fzf
export FZF_DEFAULT_COMMAND='fd --type f'

export PATH=$HOME/bin:$PATH

eval "$(hub alias -s)"
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
source ~/.zshrc.private

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
alias ev="eval $(docker-machine env)"

alias refresh='source ~/.zshrc'

function start_db {
  DOCKER_PORT="${PORT:-$(docker-compose -f **/docker-compose.yml([1]) port $1 3306 | awk -F: '{print $2}' 2>/dev/null)}"
  mysql -hlocaldev.internal.digitalocean.com -P$DOCKER_PORT -uroot -psekret -D$2
}
export PATH="/usr/local/opt/percona-server@5.6/bin:$PATH"
