" General Config ______________________________________________________________

set binary                             " Don’t add empty newlines at the end of
set noeol                              " files
set clipboard=unnamed                  " Use the OS clipboard by default (on
                                       " versions compiled with `+clipboard`)
set cursorline                         " Highlight current line
set exrc                               " Enable per-directory .vimrc files and
set secure                             " disable unsafe commands in them
set modeline                           " Respect modeline in files
set modelines=4
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
set visualbell                         " No sounds

" This makes vim act like all other editors, buffers can exist in the
" background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden


filetype plugin indent on
syntax on                              " Enable syntax highlighting

" Use old regex engine. This improves (but does not eliminate) scroll lagging
" because of syntax highlighting especially when opening certain ruby files
set regexpengine=1


" Folds _______________________________________________________________________

set foldmethod=indent                  " Fold based on indent
set foldnestmax=3                      " Deepest fold is 3 levels
set nofoldenable                       " Dont fold by default


" Indentation _________________________________________________________________

set smartindent
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


" Scrolling ___________________________________________________________________

set scrolloff=3                        " Start scrolling three lines before the
                                       " horizontal window border
set sidescrolloff=15                   " Start scrolling three lines before the
                                       " vertical window border
set sidescroll=1


" Search and Replace __________________________________________________________

set gdefault                           " Add the g flag to search/replace by
                                       " default
set ignorecase                         " Ignore case when searching


" Swap and Backup Files _______________________________________________________

set noswapfile
set nobackup
set nowb


" Custom Settings _____________________________________________________________

" so ~/.vim/settings.vim

" PLUGINS
" Using vim-plug
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
Plug 'tpope/vim-surround'

call plug#end()


" PLUGIN SETTINGS

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
let g:Gitv_DoNotMapCtrlKey = 1 " prevent gitv from remapping control commands (<C-L>, <C-K>, etc) which
                               " conflicts with my custom window navigation mappings

" vim-rspec
let g:rspec_command = "Dispatch bundle exec rspec {spec}"

" UltiSnips
let g:UltiSnipsEditSplit = 'vertical' " open a new vertical split to edit snippets when calling :UltiSnipsEdit


set background=dark
colorscheme solarized

" Do not use fish
set shell=/bin/bash


" CUSTOM KEY MAPPINGS
let mapleader=","

" Quick Vim config reload
nnoremap <Leader>sv :source $MYVIMRC<CR>

" Note: comments are intentionally placed in a separate line before `*map`
" commands because putting them on the same line will make the `*map` command
" try to interpret any blank spaces after <new command> producing uninteded
" behavior (see http://vim.wikia.com/wiki/Avoid_the_escape_key)

" Don't leave home keys. jk to leave insert mode
inoremap jk <ESC>

" Press space bar to turn off highlighting
nnoremap <Space> :noh<CR>

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

set lazyredraw " This stops Vim from redrawing the screen during complex operations and
               " results in much smoother looking plugins.

" temporary workaround to make <C-H> split navigation work until
" https://github.com/neovim/neovim/issues/2048 is resolved
if has('nvim')
  nmap <BS> <C-W>h
endif