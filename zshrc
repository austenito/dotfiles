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
plugins=(git tmux tmuxinator nyan rails zeus)

source $ZSH/oh-my-zsh.sh

export EDITOR=vim
export EC2_HOME="/Users/austenito/lib/ec2-api-tools-1.6.12.2"
export JAVA_HOME="/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home"

# Customize to your needs...
<<<<<<< HEAD
export PATH=/Users/austenito/.rvm/gems/ruby-1.9.3-p194@voucher_search_service/bin:/Users/austenito/.rvm/gems/ruby-1.9.3-p194@global/bin:/Users/austenito/.rvm/rubies/ruby-1.9.3-p194/bin:/Users/austenito/.rvm/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/Library/PostgreSQL/9.1/bin:/usr/local/share/python:$EC2_HOME/bin
=======
export PATH=/Users/austenito/.rvm/gems/ruby-1.9.3-p194@voucher_search_service/bin:/Users/austenito/.rvm/gems/ruby-1.9.3-p194@global/bin:/Users/austenito/.rvm/rubies/ruby-1.9.3-p194/bin:/Users/austenito/.rvm/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/Library/PostgreSQL/9.1/bin:/usr/local/share/python:$EC2_HOME/bin:/usr/local/go/bin
>>>>>>> 1b1d68c41c28a254f2ed54e01b7bd25d30811952

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

gog() {
  cd $(bundle show $1)
}

# chruby settings
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh

[[ -r ~/.zshrc.private ]] && . ~/.zshrc.private

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:/Applications/Postgres93.app/Contents/MacOS/bin:$PATH"

export PARALLEL_TEST_PROCESSORS=4

export PATH=$HOME/bin:$PATH

eval "$(hub alias -s)"
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
source zshrc.private
