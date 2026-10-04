# Init

## Neovim + Lua

``` bash
cd ~/.config/nvim
ln -s $REPO/vim/init.lua $HOME/.config/nvim/init.lua
ln -s $REPO/vim/lua $HOME/.config/nvim/lua
ln -s $REPO/vim/after $HOME/.config/nvim/after
```



# Debugger

## Go

Setup the DAP environment like so:

``` lua
require("dap-go").setup()
require("dapui").setup()
```

To start the debugger, place breakpoints (`:DapToggleBreakpoint`) on the line, then start the application in the debugger (`:DapContinue`).
Start the UI:

``` lua
require("dapui").open()
```
