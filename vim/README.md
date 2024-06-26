# Init

## Vim + Lua

``` bash
cd ~/.config/nvim
ln -s $REPO/vim/hybrid.vim $HOME/.config/nvim/init.vim
ln -s $REPO/vim/lua $HOME/.config/nvim/lua
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



# Go IDE

## Install ALE and Go plugins

`~/.config/nvim/init.vim`

``` vim
call plug#begin("~/.vim/plugged")
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'dense-analysis/ale'
call plug#end()
```

Run open `nvim` and run the following options to install Go binaries:

``` vim
:PlugIntall
:GoBinariesInstall
```


### Configure ALE

Add the following filetype

`~/.config/nvim/after/ftplugin/go.vim`

``` vim
filetype plugin indent on
set autowrite
au filetype go inoremap <buffer> . .<C-x><C-o>

" Go syntax highlighting
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1

" Auto formatting and importing
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"

" Status line types/signatures
let g:go_auto_type_info = 1

" Run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

" Map keys for most used commands.
" Ex: `\b` for building, `\r` for running and `\b` for running test.
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)


" Ale setup
let g:ale_cursor_detail = 1
let g:ale_floating_preview = 1
let g:ale_close_preview_on_insert = 1
let g:ale_linters = {
\ 'go': ['gopls', 'golangci-lint', 'gofmt', 'govet', 'staticcheck'],
\}

let g:ale_go_golangci_lint_options = '--fast'

let g:ale_fixers = {
\  'go': ['gofmt', 'goimports']
\}
```


## Environment variables

``` sh
# Environment
export PATH=$PATH:~/go/bin
```



# Lua IDE

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
