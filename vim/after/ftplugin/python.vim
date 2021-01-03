set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set conceallevel=1
set foldenable
set foldmethod=indent
set foldnestmax=99
set foldlevel=4
augroup remember_folds
  autocmd!
  au BufWinLeave * mkview
  au BufWinEnter * silent! loadview
augroup END
