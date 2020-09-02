setlocal foldmethod=syntax
setlocal foldtext=substitute(getline(v:foldstart),'\\t','\ \ \ \ ','g')
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set conceallevel=1
