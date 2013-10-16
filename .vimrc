execute pathogen#infect()
syntax on
filetype plugin indent on

" COLORS AND FONTS
" --------------------------------------

syntax enable           " Enable syntax highlighting
colorscheme vividchalk

" Powerline
set t_Co=256
set laststatus=2 " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyp
let g:Powerline_symbols = "fancy"
set guifont=Ubuntu\ Mono\ for\ VimPowerline\ 13

if has('gui_running')
else
     " Make sure folds can be read when using a dark terminal
     highlight Folded ctermfg=LightGray ctermbg=DarkBlue
endif


set nocompatible  " Use Vim settings (versus Vi compatible)
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
noremap <Leader>a :Ack<space>
noremap <esc> :noh<return><esc>
noremap <Leader>t :TagbarToggle<cr>
noremap <Leader>s :Gstatus<cr>
noremap <Leader>w :w!<cr>

set linespace=10 
set guioptions-=T " removes top toolbar
set guioptions-=r " Removes right hand scroll bar
set mouse=a

" Prepare a new PHP class
function! Class()
    let name = input('Class name? ')
    let namespace = input('Any Namespace? ')
 
    if strlen(namespace)
        exec 'normal i<?php namespace ' . namespace . ';
    else
        exec 'normal i<?php
    endif
 
    " Open class
    exec 'normal iclass ' . name . ' {^M}^[O^['
    
    exec 'normal i^M    public function __construct()^M{^M ^M}^['
endfunction
nmap ,1  :call Class()<cr>
 
" Add a new dependency to a PHP class
function! AddDependency()
    let dependency = input('Var Name: ')
    let namespace = input('Class Path: ')
 
    let segments = split(namespace, '\')
    let typehint = segments[-1]
 
    exec 'normal gg/construct^M:H^Mf)i, ' . typehint . ' $' . dependency . '^[/}^>O$this->^[a' . dependency . ' = $' . dependency . ';^[?{^MkOprotected $' . dependency . ';^M^[?{^MOuse ' . namespace . ';^M^['
 
    " Remove opening comma if there is only one dependency
    exec 'normal :%s/(, /(/g
'
endfunction
nmap ,2  :call AddDependency()<cr>


let g:vdebug_options = {
    \ 'path_maps': {"/project": "/home/james/projects/cherrynew"},
    \ 'server': 'cherry.dev',
    \ 'port': 9001
\}
