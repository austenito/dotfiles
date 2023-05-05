# Path to your oh-my-zsh installation.
export ZSH="/Users/$(whoami)/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="random"
plugins=(git)
source $ZSH/oh-my-zsh.sh

export EDITOR=vim
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh
export TERM="xterm-256color"

# Git aliases
alias glp="git log --pretty=format:'%C(yellow)%h%C(reset) %s %C(cyan)%cr%C(reset) %C(blue)%an%C(reset) %C(green)%d%C(reset)' --graph --date-order"
alias gs='git status'
alias gsync="git pull upstream master && git push origin master"
alias gri='git rebase -i origin/master --autostash'
alias gpu='git push -u origin head'

# docker
alias dc='docker-compose'
alias dm='docker-machine'

[[ -r ~/.zshrc.private ]] && . ~/.zshrc.private

#fzf
export FZF_DEFAULT_COMMAND='fd --type f'
export PATH=$HOME/bin:$PATH
export NVM_DIR=~/.nvm
alias loadruby='source /opt/homebrew/opt/chruby/share/chruby/chruby.sh'
source ~/.zshrc.private
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias refresh='source ~/.zshrc'

. /opt/homebrew/etc/profile.d/z.sh
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

load_nvm() {
  export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
}

unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi
export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null

eval "$(starship init zsh)"
