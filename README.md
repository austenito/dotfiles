# Inspiration

* The symlinking idea was borrowed from https://github.com/michaeljsmalley/dotfiles
* My vim configs are based on https://github.com/ryankanno/vim-config

# Requirements

* Ruby 1.9+

# Usage

## Configuration

* Set an ENV variable `DOTFILES_DIR` pointing to the directory where you cloned
  this repo.

Environment specific settings are found in `config.yml`.

* `private_dir` - the directory containing files local to your system. For example, I include a `zshrc.private` 
file in my zshrc config to store private information. 
* `backup_dir` - The directory where your existing dotfiles are stored.
* `files` - The dotfiles to copy
* `private_files` - The private dotfiles to copy
* `plugins` - The list of vim plugins

## Installing

```
git clone git@github.com:austenito/dotfiles.git
cd dotfiles
rake install
```

## Tasks
* `rake install` - This tasks creates a backup of your files in `~/dotfiles_bak`
* `rake update_vim_plugins` - Updates all vim plugins

# Contribution

1. Fork it
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create new Pull Request
