# Install plugins

``` bash
export ZSH=$HOME/.config/zsh
export ZSH_PLUGIN_DIR=$ZSH/plugins

mkdir -p $ZSH_PLUGIN_DIR

git clone --depth=1 https://github.com/spaceship-prompt/spaceship-prompt.git $ZSH_PLUGIN_DIR/spaceship
git clone --depth=1 https://github.com/spaceship-prompt/spaceship-vi-mode.git $ZSH_PLUGIN_DIR/spaceship-vi-mode
git clone git@github.com:zdharma-zmirror/fast-syntax-highlighting.git $ZSH_PLUGIN_DIR/fast-syntax-highlighting
git clone git@github.com:zsh-users/zsh-autosuggestions.git $ZSH_PLUGIN_DIR/zsh-autosuggestions
git clone git@github.com:zsh-users/zsh-completions.git $ZSH_PLUGIN_DIR/zsh-completions
```


# For the machine at hand

``` bash
echo export PATH=$PATH >> $ZSH/forthismachineonly.zsh
```


#

``` bash
ln -s $REPO/zsh/zshrc $HOME/.zshrc
ln -s $REPO/zsh/plugins.zsh $ZSH/plugins.zsh
ln -s $REPO/zsh/plugins/spaceship.zsh $HOME/.config/spaceship.zsh
```
