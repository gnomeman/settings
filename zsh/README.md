# Install plugins

``` bash
export ZSH=$HOME/.config/zsh
export ZSH_PLUGIN_DIR=$ZSH/plugins

mkdir -p $ZSH_PLUGIN_DIR

git clone git@github.com:zsh-users/zsh-autosuggestions.git $ZSH_PLUGIN_DIR/zsh-autosuggestions
```



# Symlink

``` bash
ln -s $REPO/zsh/zshrc $HOME/.zshrc
```



# For the machine at hand

Create a `$HOME/.zshenv` file that stores local user scripts.
