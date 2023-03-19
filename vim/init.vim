call plug#begin(stdpath("config") . "/plugged")
Plug 'mfussenegger/nvim-dap'
"Plug 'Yggdroot/indentLine'
"Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
"Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
call plug#end()


" Keymaps
let mapleader=","
imap jk <Esc>


" Clipboard
set clipboard+=unnamedplus
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P


" Spacing
set backspace=indent,eol,start
set tabstop=4
set shiftwidth=4
set softtabstop=4


" Syntax
set nocompatible
syntax enable
filetype indent plugin on
filetype indent off
set virtualedit=onemore
set completeopt+=noinsert
set completeopt-=preview
colorscheme clownprince
"colorscheme elflord
set cursorline
set nu
set wrap
"set nowrap
"set foldenable
"set foldmethod=indent
"set foldnestmax=99
"set foldlevel=4
"augroup remember_folds
"  autocmd!
"  au BufWinLeave * mkview
"  au BufWinEnter * silent! loadview
"augroup END
"set spell spelllang=en_us

" Remove trailing whitespace
autocmd FileType golang,javascript,lua,python autocmd BufWritePre <buffer> %s/\s\+$//e

" Handle extremely Large files
let g:LargeFile = 1024 * 1024 * 1024
augroup LargeFile 
	au!
	autocmd BufReadPre * let f=getfsize(expand("<afile>")) | if f > g:LargeFile || f == -2 | call LargeFile() | endif
augroup END

function! LargeFile()
	" No swap files
	setlocal noswapfile
	" No line wrapping
	setlocal nowrap
	" No syntax highlighting etc
	set eventignore+=FileType
	" Save memory when other file is viewed
	setlocal bufhidden=unload
	" No undo possible
	setlocal undolevels=-1
	" Display message
	autocmd VimEnter *  echo "The file is larger than " . (g:LargeFile / 1024 / 1024) . " MB, so some options are changed (see .vimrc for details)."
endfunction

" File explorer (Vex)
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_winsize = 25
