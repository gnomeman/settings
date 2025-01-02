# Init

## Neovim + Lua

``` bash
cd ~/.config/nvim
ln -s $REPO/vim/init.lua $HOME/.config/nvim/init.lua
ln -s $REPO/vim/lua $HOME/.config/nvim/lua
ln -s $REPO/vim/after $HOME/.config/nvim/after
```



# Install plugin system

## paq-nvim

``` sh
git clone --depth=1 https://github.com/savq/paq-nvim.git $HOME/.local/share/nvim/site/pack/paqs/start/paq-nvim
```

`lua/plugins.lua`

``` lua
require "paq" {
  "savq/paq-nvim", -- Let Paq manage itself
  "fatih/vim-go", -- Go developement
  "neovim/nvim-lspconfig" -- Mind the semi-colons
}
```

``` vim
:PaqInstall
```



# IDE

## Required packages

### Neovim

* [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)
* [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
* [nvim-dap](https://github.com/mfussenegger/nvim-dap)
* [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)

### Lua

* [lua-debug](https://github.com/actboy168/lua-debug)
* [lua-language-server](https://github.com/sumneko/lua-language-server)
* [lua-make](https://github.com/actboy168/luamake)
* [mobdebug](https://github.com/pkulchenko/MobDebug)


## LSP

1. Clone and install the [Lua language server](https://github.com/sumneko/lua-language-server).
1. In `lua/lua/lsp.lua`, set the `PATH_LUA_LSP_MAIN` value, set to the path of the `main.lua` in the LSP repo.



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
