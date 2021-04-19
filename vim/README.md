# Go IDE

## Install plugin system

```
git clone https://github.com/junegunn/vim-plug.git
cd ~/.config/nvim
mkdir autoload
cd autoload
ln -s /path/to/plug.vim plug.vim
```


## Initialize

`~/.config/nvim/init.vim`
```
call plug#begin("~/.vim/plugged")
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()
```

Run open `nvim` and run the following options

```
:PlugIntall
:GoBinariesInstall
```



# Basics

Add the following filetype

`~/.config/nvim/after/ftplugin/go.vim`

```
filetype plugin indent on
set autowrite

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
```
