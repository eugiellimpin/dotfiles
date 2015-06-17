" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible


" General Config ______________________________________________________________

set autoread                           " Reload files changed outside Vim
set backspace=indent,eol,start         " Allow backspace in insert mode
set binary                             " Don’t add empty newlines at the end of
set noeol                              " files
set clipboard=unnamed                  " Use the OS clipboard by default (on
                                       " versions compiled with `+clipboard`)
set cursorline                         " Highlight current line
set encoding=utf-8 nobomb              " Use UTF-8 without BOM
set exrc                               " Enable per-directory .vimrc files and
set secure                             " disable unsafe commands in them
set laststatus=2                       " Always show status line
set modeline                           " Respect modeline in files
set modelines=4
set mouse=a                            " Enable mouse in all modes
set noerrorbells                       " Disable error bells
set nostartofline                      " Don't reset cursor to start of line
                                       " when moving around.
set number                             " Display line numbers
if exists("&relativenumber")           " Display relative line numbers
	set relativenumber
	au BufReadPost * set relativenumber
endif
set ruler                              " Show the cursor position
set shortmess=atI                      " Don't show the intro message when starting Vim
set showcmd                            " Show the (partial) command as it’s
                                       " being typed
set showmode                           " Show the current mode
set title                              " Show the filename in the window titlebar
set ttyfast                            " Optimize for fast terminal connections
set visualbell                         " No sounds

" This makes vim act like all other editors, buffers can exist in the
" background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden


syntax on                              " Enable syntax highlighting

" Change leader to a comma because the backslash is too far away. That means
" all \x commands turn into ,x. The mapleader has to be set before vundle
" starts loading all the plugins.
let mapleader=","


" Completion __________________________________________________________________

set wildmenu                           " Enhance command-line completion


" Folds _______________________________________________________________________

set foldmethod=indent                  " Fold based on indent
set foldnestmax=3                      " Deepest fold is 3 levels
set nofoldenable                       " Dont fold by default


" Indentation _________________________________________________________________

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" Display tabs and trailing spaces visually
set list listchars=tab:▸\ ,trail:·,eol:¬,nbsp:_

set nowrap                             " Don't wrap lines
set linebreak                          " Wrap lines at convenient points


" Persistent Undo _____________________________________________________________

" Keep undo history across sessions, by storing in file. Only works all the
" time.
if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif


" Vundle Initialization _______________________________________________________

" This loads all the plugins specified in ~/.vim/vundle.vim
" Use Vundle plugin to manage all other plugins
if filereadable(expand("~/.vim/vundles.vim"))
  source ~/.vim/vundles.vim
endif


" Scrolling ___________________________________________________________________

set scrolloff=3                        " Start scrolling three lines before the
                                       " horizontal window border
set sidescrolloff=15                   " Start scrolling three lines before the
                                       " vertical window border
set sidescroll=1


" Search and Replace __________________________________________________________

set gdefault                           " Add the g flag to search/replace by
                                       " default
set hlsearch                           " Highlight searches
set ignorecase                         " Ignore case when searching
set incsearch                          " Highlight dynamically as a pattern is
                                       " typed


" Swap and Backup Files _______________________________________________________

set noswapfile
set nobackup
set nowb


" Custom Settings _____________________________________________________________

" so ~/.vim/settings.vim



" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Automatic commands
if has("autocmd")
	" Enable file type detection
	filetype on
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
endif


" PLUGINS
" Using vim-plug
call plug#begin('~/.vim/plugged')
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-fugitive'
Plug 'gregsexton/gitv'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'kien/ctrlp.vim'

call plug#end()

set background=dark
colorscheme solarized