# Install plugins

``` bash
export DIR_ZSH=$HOME/.config/zsh
export DIR_ZSH_PLUGIN=$DIR_ZSH/plugins

mkdir -p $DIR_ZSH_PLUGIN

git clone https://github.com/zsh-users/zsh-autosuggestions.git $DIR_ZSH_PLUGIN/zsh-autosuggestions
```



# Symlink

``` bash
ln -s $REPO/zsh/zshrc $HOME/.zshrc
ln -s $REPO/zsh/plugins.zsh $DIR_ZSH/plugins.zsh
```



# For the machine at hand

Create a `$HOME/.zshenv` file that stores local user scripts.
