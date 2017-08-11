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
alias dm='docker-machine'

gog() {
  cd $(bundle show $1)
}

# chruby settings
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh

[[ -r ~/.zshrc.private ]] && . ~/.zshrc.private

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export PATH=$HOME/bin:$PATH

eval "$(hub alias -s)"
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
source ~/.zshrc.private

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
