# dotfiles

# .vimrc

## dein  
setup
```
$ mkdir -p ~/.vim/dein/repos/github.com/Shougo/dein.vim
$ git clone https://github.com/Shougo/dein.vim.git \
    ~/.vim/dein/repos/github.com/Shougo/dein.vim
```

install
```
:call dein#install()
```

# git

```
git config --global alias.ci "commit"
git config --global alias.st "status"
git config --global alias.co "checkout"
git config --global alias.b "branch"
git config --global user.name "hazumu"
git config --global user.email stellarfishing@gmail.com
git config --global color.ui auto
git config --global core.editor 'vim -c "set fenc=utf-8"'
```
