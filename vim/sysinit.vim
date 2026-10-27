" Leader key
let mapleader = ","

" General options
set swapfile
set termguicolors
colorscheme default

set relativenumber
set number

set virtualedit=onemore
set mouse=

" Search
set hlsearch
set ignorecase
set smartcase
set inccommand=split
set incsearch

" Completion and indentation
set completeopt=menuone,longest,noselect,noinsert
set indentkeys=
set tabstop=2
set shiftwidth=2
set softtabstop=2

" Clipboard
set clipboard+=unnamedplus
vnoremap <leader>y "+y
nnoremap <leader>Y "+yg_
nnoremap <leader>y "+y
nnoremap <leader>yy "+yy
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" Insert-mode escape
inoremap <silent> jk <Esc>

" Move by screen lines when lines wrap
nnoremap <silent> j gj
nnoremap <silent> k gk

" Remove trailing whitespace for selected filetypes
function! s:setup_trim_whitespace() abort
  augroup TrimTrailingWhitespace
    autocmd! BufWritePre <buffer>
    autocmd BufWritePre <buffer> keeppatterns %s/\s\+$//e
  augroup END
endfunction

augroup TrimTrailingWhitespaceSetup
  autocmd!
  autocmd FileType go,javascript,lua,python,json,yaml
        \ call s:setup_trim_whitespace()
augroup END

" Filetype support
filetype plugin on
filetype indent off

" Terminal mapping
tnoremap <silent> <leader>jk <C-\><C-n>

" Local project files
set exrc

" Split navigation and resizing
nnoremap <silent> <C-k> <C-w><Up>
nnoremap <silent> <C-j> <C-w><Down>
nnoremap <silent> <C-l> <C-w><Right>
nnoremap <silent> <C-h> <C-w><Left>

nnoremap <silent> <leader>== 5<C-w>+
nnoremap <silent> <leader>-- 5<C-w>-
nnoremap <silent> <leader>.. 5<C-w>>
nnoremap <silent> <leader>,, 5<C-w><

" Tabs
nnoremap <silent> <leader>ta :tabnew<CR>
nnoremap <silent> <leader>tn :tabnext<CR>
nnoremap <silent> <leader>tp :tabprevious<CR>

" Large files
let s:large_file_threshold = 1024 * 1024 * 1024

function! s:large_file_setup(file) abort
  let l:size = getfsize(a:file)

  if l:size >= s:large_file_threshold || l:size == -2
    setlocal noswapfile
    setlocal nowrap
    setlocal bufhidden=unload
    setlocal undolevels=-1

    " eventignore is global, so add it temporarily and restore it after reading.
    if index(split(&eventignore, ','), 'FileType') < 0
      let &eventignore .= (&eventignore ==# '' ? '' : ',') . 'FileType'
      let b:restore_filetype_eventignore = 1
    endif

    echohl ErrorMsg
    echomsg 'The file is larger than 1024 MB, so some options are changed.'
    echohl None
  endif
endfunction

function! s:large_file_restore_eventignore() abort
  if exists('b:restore_filetype_eventignore')
    let l:events = filter(split(&eventignore, ','), 'v:val !=# "FileType"')
    let &eventignore = join(l:events, ',')
    unlet b:restore_filetype_eventignore
  endif
endfunction

augroup LargeFile
  autocmd!
  autocmd BufReadPre * call s:large_file_setup(expand('<afile>'))
  autocmd BufReadPost * call s:large_file_restore_eventignore()
augroup END

" Cleanup helper: uses Lua to inspect access times and avoid following symlinks.
lua << EOF
function cleanup_old_files_async(dir, days, opts)
  opts = opts or {}
  assert(type(dir) == "string", "dir must be a string")
  assert(type(days) == "number" and days >= 0,
    "days must be a non-negative number")

  local uv = vim.loop
  local cutoff = os.time() - days * 24 * 60 * 60
  local result = { deleted = {}, would_delete = {}, errors = {} }
  local sep = package.config:sub(1, 1)

  local function join(parent, name)
    if parent:match("[/\\]$") then
      return parent .. name
    end
    return parent .. sep .. name
  end

  local function walk(path)
    local scan, scan_err = uv.fs_scandir(path)
    if not scan then
      table.insert(result.errors, { path = path, error = scan_err })
      return
    end

    while true do
      local name = uv.fs_scandir_next(scan)
      if not name then break end

      local child = join(path, name)
      local st, stat_err = uv.fs_lstat(child)

      if not st then
        table.insert(result.errors, { path = child, error = stat_err })
      else
        local kind = math.floor(st.mode / 4096) % 16
        local is_directory = kind == 4
        local is_regular_file = kind == 8

        if is_directory then
          walk(child)
        elseif is_regular_file and st.atime then
          local atime = type(st.atime) == "table" and st.atime.sec or st.atime

          if atime and atime <= cutoff then
            if opts.dry_run then
              table.insert(result.would_delete, child)
            else
              local ok, unlink_err = uv.fs_unlink(child)
              if ok then
                table.insert(result.deleted, child)
              else
                table.insert(result.errors, { path = child, error = unlink_err })
              end
            end
          end
        end
      end
    end
  end

  walk(dir)
  return result
end
EOF

" Persistent undo
if has('persistent_undo')
  let s:undodir = expand('~/.undodir')

  if !isdirectory(s:undodir)
    call mkdir(s:undodir, 'p', 0700)
  endif

  let &undodir = s:undodir
  set undofile

  lua cleanup_old_files_async(vim.fn.expand(vim.o.undodir), 30)
endif

" Undo list and open buffers
nnoremap <silent> <leader>ut :undolist<CR>
nnoremap <silent> <C-Space> :buffers<CR>
