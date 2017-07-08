# Inspiration

* vim.local is used with [Case Commons Vim Config](https://github.com/Casecommons/vim-config)

# Requirements

* [Powerline][5]
* [Powerline patched fonts][1]
* [Consolas patched font][2] - This is the for the pretty git branch font
* [Zsh][3]
* [oh-my-zsh][4]

## Installing

* Install zsh and oh-my-zsh
* Symlink the `powerline.zsh-theme` to `~/.oh-my-zsh/themes`
* Follow powerline install instructions here: https://powerline.readthedocs.io/en/latest/installation/osx.html

```
ln -s dotfiles/vim .vim
ln -s dotfiles/vim/vimrc ~/.vimrc
ln -s dotfiles/zshrc ~/.zshrc
ln -s dotfiles/zshrc.private .zshrc.private

mkdir autoload
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

 cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer --gocode-completer --tern-completer
```

### Vim Setup

* `:PlugInstall`
* `:GoInstallBinaries` 

* Profit

# Contribution

1. Fork it
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create new Pull Request

[1]: https://github.com/Lokaltog/powerline-fonts
[2]: https://github.com/eugeneching/consolas-powerline-vim/blob/master/CONSOLA-Powerline.ttf
[3]: http://www.zsh.org/
[4]: https://github.com/robbyrussell/oh-my-zsh
[5]: https://powerline.readthedocs.org/en/latest/installation/osx.html#installation-osx
