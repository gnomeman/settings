# Install plugins

``` bash
export ZSH=$HOME/.config/zsh
export ZSH_PLUGIN_DIR=$ZSH/plugins

mkdir -p $ZSH_PLUGIN_DIR

git clone git@github.com:zsh-users/zsh-autosuggestions.git $ZSH_PLUGIN_DIR/zsh-autosuggestions
```



# For the machine at hand

``` bash
echo export PATH=$PATH >> $ZSH/forthismachineonly.zsh
```



# Symlink

``` bash
ln -s $REPO/zsh/zshrc $HOME/.zshrc
ln -s $REPO/zsh/plugins.zsh $ZSH/plugins.zsh
ln -s $REPO/zsh/plugins/spaceship.zsh $HOME/.config/spaceship.zsh
```
