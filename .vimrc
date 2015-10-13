set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'rstacruz/sparkup'
Plugin 'tpope/vim-vividchalk'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'stephpy/vim-yaml'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

syntax enable           " Enable syntax highlighting
colorscheme vividchalk

au BufNewFile,BufRead *.ss set filetype=html

set encoding=utf-8 

if has('gui_running')
else
     " Make sure folds can be read when using a dark terminal
     highlight Folded ctermfg=LightGray ctermbg=DarkBlue
endif

set autoread      " Automatically reload when a file is changed outside of Vim
set nobackup      " Do not automatically backup files
set history=1000  " Remember 1000 lines of command line history

" Always show what mode we area currently editing in
set showmode

set cmdheight=1      " Reserve one row for the command bar
set hidden           " Allow the changing of buffers without saving
set hlsearch         " Highlight the last used search pattern
set ignorecase       " Ignore case when searching
set incsearch        " Enable incremental searching
"set lazyredraw       " Do not redraw screen while executing macros
set matchtime=4      " Blink matched brackets for 4/10ths of a second
set nojoinspaces     " Do not insert 2 spaces after sentences when joining
set nomodeline       " Do not read settings from modelines
set nostartofline    " Do not move cursor to SOL during jump commands
set numberwidth=1    " Use the minimal number of columns for line numbers
set number           " Show line numbers
set ruler            " Show the cursor position at all times
set scrolloff=2      " Keep two lines above and below cursor when scrolling
set showcmd          " Display incomplete commands
set showmatch        " Highlight matching brackets
set sidescrolloff=3  " Keep two columns left and right of cursor when scrolling
set smartcase        " Override ignorecase if search has upper case characters
set ttyfast          " Improve smoothness or redraw for newer terminals
set whichwrap+=h,l   " Allow cursor keys to line wrap
set winminheight=0   " Minimal height of a non-current window
set guioptions-=T       " Remove toolbar in gvim

" Show as much as possible of the last line in a window versus '@' lines
set display=lastline

" Make vertical separators between windows blank
set fillchars=vert:\ ,fold:-

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

set nowrap

" Time out on mappings after two seconds, key codes after a tenth of a second
set timeoutlen=2000
set ttimeoutlen=100

" Cursor can be positioned anywhere when in blockwise Visual mode
set virtualedit=block

" Centrally store all swap files using full path names
set directory=/var/tmp//

" Set up default tab spacing
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4


" Move between windows using Ctrl + home row motion keys
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l

set colorcolumn=81
let mapleader = ","
noremap <Leader>n :NERDTree<cr>
noremap <esc> :noh<return><esc>
