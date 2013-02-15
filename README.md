# Inspiration

* The symlinking idea was borrowed from https://github.com/michaeljsmalley/dotfiles
* My vim configs are based on https://github.com/ryankanno/vim-config

# Requirements

* Ruby 1.9
* Rake `gem install rake`

# Usage

* Clone this repo `~/dotfiles`
* `rake install` - This tasks creates a backup of your files in `~/dotfiles_bak`
* `rake update_vim_plugins` - Updates all vim plugins

## Private zshrc variables

My current zshrc includes a `~/.zshrc.private` file, which is linked at the bottom of the `zshrc` file. This is where
private variables and tokens can live. The script expects private files to be in `~/dotfiles_private` directory.




