# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="powerline"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git tmux tmuxinator)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/Users/austenito/.rvm/gems/ruby-1.9.3-p194@voucher_search_service/bin:/Users/austenito/.rvm/gems/ruby-1.9.3-p194@global/bin:/Users/austenito/.rvm/rubies/ruby-1.9.3-p194/bin:/Users/austenito/.rvm/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/Library/PostgreSQL/9.1/bin:/usr/local/share/python

[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh
export TERM="xterm-256color"

# Git aliases
alias glp="git log --pretty=format:'%C(yellow)%h%C(reset) %s %C(cyan)%cr%C(reset) %C(blue)%an%C(reset) %C(green)%d%C(reset)' --graph --date-order"
alias gs='git status'
alias gsync="git pull upstream master && git push origin master"

#tmux
alias tmn='tmux new -s'
alias tmk='tmux kill-session -t'
alias tma='tmux attach -t'
alias tm="tmuxinator"

alias fms='foreman start'
alias rs='rails server'
alias rc='rails console'
alias hi='history'
alias her="heroku"

alias sbash='source ~/.bash_profile'
alias jpp='python -mjson.tool'
alias rr='rake routes'

alias start_redis='redis-server /usr/local/etc/redis.conf'
alias be='bundle exec'
alias m="mvim"
alias v="vim"

gog() {
  cd $(bundle show $1)
}

source /usr/local/share/chruby/auto.sh
source /usr/local/share/chruby/chruby.sh
chruby ruby-2.0.0-p247

[[ -r ~/.zshrc.private ]] && . ~/.zshrc.private

# chruby settings
chruby ruby-2.0.0-p247
source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
