" General {{{

" Don’t add empty newlines at the end of files
set binary
set noeol

" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed

" Highlight current line
set cursorline
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure

" Check for modelines in files
set modeline
" Number of lines at the beginning and end of the file to check for modelines
set modelines=1
" Disable error bells
set noerrorbells
" Don't reset cursor to start of line when moving around.
set nostartofline

" Display line numbers
set number
" Display relative line numbers
if exists("&relativenumber")
  set relativenumber
  au BufReadPost * set relativenumber
endif
" Show the cursor position
set ruler
" Don't show the intro message when starting Vim
set shortmess=atI
" Show the (partial) command as it’s being typed
set showcmd
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" No sounds
set visualbell

" This makes vim act like all other editors, buffers can exist in the
" background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden


filetype plugin indent on
" Enable syntax highlighting
syntax on

" }}}
" Folds {{{

" Enable folding
set foldenable
" Open folds in all levels (match foldnestmax)
set foldlevel=3
" Fold based on indent
set foldmethod=indent
" Deepest fold is 3 levels
set foldnestmax=3

" }}}
" Tabs, spaces and indentation {{{

set smartindent
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" Display tabs and trailing spaces visually
set list listchars=tab:▸\ ,trail:·,eol:¬,nbsp:_

" }}}
" Persistent Undo {{{

" Keep undo history across sessions, by storing in file. Only works all the
" time.
if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" }}}
" Scrolling {{{

" Start scrolling three lines before the horizontal window border
set scrolloff=3
" Start scrolling three lines before the vertical window border
set sidescrolloff=15
set sidescroll=1

" }}}
" Search and Replace {{{

" Add the g flag to search/replace by default
set gdefault
" Ignore case when searching
set ignorecase

" }}}
" Swap and Backup Files {{{

set noswapfile
set nobackup
set nowb

" }}}
" Plugins {{{

call plug#begin('~/.vim/plugged')

Plug 'Raimondi/delimitMate'
Plug 'SirVer/ultisnips'
Plug 'altercation/vim-colors-solarized'
Plug 'edkolev/tmuxline.vim'
Plug 'gregsexton/MatchTag'
Plug 'gregsexton/gitv'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'krisajenkins/vim-pipe'
Plug 'matchit.zip'
Plug 'rking/ag.vim'
Plug 'rstacruz/sparkup'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'thoughtbot/vim-rspec'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'

call plug#end()

" }}}
" Plugin Settings {{{

" vim-fugitive
" No need to capitalize g in Git
cabbrev git Git

" NERDTree
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinSize = 30

" fzf
nnoremap <C-P> :FZF<CR>
" FZF window will occupy the bottom 20% of the screen
let g:fzf_layout = { 'down': '~20%' }

" delimitMate
let delimitMate_expand_cr = 1

" gitv
" Prevent gitv from remapping control commands (<C-L>, <C-K>, etc) which
" conflicts with my custom window navigation mappings
let g:Gitv_DoNotMapCtrlKey = 1

" vim-rspec
let g:rspec_command = "Dispatch bundle exec rspec {spec}"

" UltiSnips
" open a new vertical split to edit snippets when calling :UltiSnipsEdit
let g:UltiSnipsEditSplit = 'vertical'

" }}}
" Colors {{{

set background=dark
colorscheme solarized

" }}}
" Custom Mappings {{{

let mapleader=","

" Quick Vim config reload
nnoremap <Leader>sv :source $MYVIMRC<CR>

" Note: comments are intentionally placed in a separate line before `*map`
" commands because putting them on the same line will make the `*map` command
" try to interpret any blank spaces after <new command> producing uninteded
" behavior (see http://vim.wikia.com/wiki/Avoid_the_escape_key)

" Don't leave home keys. jk to leave insert mode
inoremap jk <ESC>

" Clear the highlighting of :set hlsearch
nnoremap <Leader><Space> :nohlsearch<CR>

" NERDTree
nnoremap <Leader>nt :NERDTreeToggle<CR>
" ag.vim/the_silver_searcher
" Space at EOL is intentional to enable typing immediately
nnoremap <Leader>a :Ag 

" Git
nnoremap <Leader>gv :Gitv<CR>
nnoremap <Leader>gc :Gcommit -s<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gw :Gwrite<CR>

" Easier splits navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-Q> <C-W><C-Q>

" vim-rspec mappings
map <Leader>sf :call RunCurrentSpecFile()<CR>
map <Leader>sn :call RunNearestSpec()<CR>
map <Leader>sl :call RunLastSpec()<CR>
map <Leader>sa :call RunAllSpecs()<CR>

" }}}
" Misc {{{

" Explicitly set shell to avoid using Fish shell when doing :! commands
set shell=/bin/bash

" Stop Vim from redrawing the screen during complex operations which results
" in much smoother looking plugins
set lazyredraw

" 'Temporary' workaround to make <C-H> split navigation work until
" https://github.com/neovim/neovim/issues/2048 is resolved
if has('nvim')
  nmap <BS> <C-W>h
endif

" Use old regex engine. This improves (but does not eliminate) scroll lagging
" because of syntax highlighting especially when opening certain very large
" Ruby files
set regexpengine=1

" }}}
" TODO: move to relevant section. Maybe "Wrapping"?
set nowrap                             " Don't wrap lines
set linebreak                          " Wrap lines at convenient points

" modeline to set options for this file. Specifically, set foldmethod to
" marker so we can fold sections wrapped inside {{{ }}} (so the file reads
" like a table of contents when opened) and foldlevel to zero to close all
" folds by default
"
" vim:foldmethod=marker:foldlevel=0