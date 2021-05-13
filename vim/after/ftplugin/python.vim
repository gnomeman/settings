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

" Ale setup
let g:ale_cursor_detail = 1
let g:ale_floating_preview = 1
let b:ale_fix_on_save = 1
let g:ale_linters = {
\ 'python': ['pyflakes', 'mypy'],
\}

let g:ale_fixers = {
\ 'python': ['black'],
\}
