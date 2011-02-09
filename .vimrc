"
" ~/.vimrc
"

" GENERAL
" --------------------------------------

set nocompatible  " Use Vim settings (versus Vi compatible)
set autoread      " Automatically reload when a file is changed outside of Vim
set nobackup      " Do not automatically backup files
set history=1000  " Remember 1000 lines of command line history

filetype off
call pathogen#runtime_append_all_bundles()
filetype plugin indent on  " Enable file type detection



" COLORS AND FONTS
" --------------------------------------

syntax enable           " Enable syntax highlighting
colorscheme vividchalk  " Emulate TextMate's color scheme by default
" NOTE: if &t_Co == 256 ... test for 256-color capable terminal

if has('gui_running')
     set columns=120                " Set the window's width
"     set fuoptions=maxvert,maxhorz  " Maximize when entering fullscreen
     set lines=44                   " Set the window's height
     set guioptions-=T              " Remove the toolbar from the window

     " Set font according to operating system
     if has('macunix')
          set antialias
          set guifont=Anonymous_Pro:h18
     elseif has('win32')
          set guifont=Terminus:h12:cANSI
     else
"          colorscheme desert
"          set guifont=Terminus\ 12
     endif

     " Use slight transparency when available
     if has('gui_macvim')
          " set transparency=16
     endif
else
     " Make sure folds can be read when using a dark terminal
     highlight Folded ctermfg=LightGray ctermbg=DarkBlue
endif

" Highlight trailing whitespace characters and tabs not used for indention
highlight WhitespaceErrors ctermbg=Red guibg=Red
match WhitespaceErrors /\s\+$\|[^\t]\@<=\t\+/



" USER INTERFACE
" --------------------------------------

set cmdheight=1      " Reserve one row for the command bar
set hidden           " Allow the changing of buffers without saving
set hlsearch         " Highlight the last used search pattern
set ignorecase       " Ignore case when searching
set incsearch        " Enable incremental searching
set lazyredraw       " Do not redraw screen while executing macros
set list             " Display unprintable characters
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

" Allow backspacing over everything
set backspace=eol,indent,start

" Disable sound/visual bell on errors
set noerrorbells
set novisualbell
set t_vb=

" Use strong encryption for writing encrypted files
"set cryptmethod=blowfish

" Centrally store all swap files using full path names
set directory=/var/tmp//

" Show as much as possible of the last line in a window versus '@' lines
set display=lastline

" Make vertical separators between windows blank
set fillchars=vert:\ ,fold:-

" In list mode, use these custom characters
set listchars=tab:▸\ ,extends:>,precedes:<

" Always show the customized statusline
set laststatus=2
set statusline=%<%f\ [%M%n%R%H]%=%l/%L,%v\ %p%%

" Time out on mappings after two seconds, key codes after a tenth of a second
set timeoutlen=2000
set ttimeoutlen=100

" Cursor can be positioned anywhere when in blockwise Visual mode
set virtualedit=block

" Use enhanced command line completion
set wildmenu
set wildmode=longest:full,full
set wildignore=*.o,*.obj,*.exe,*.class,*.swp



" TEXT HANDLING
" --------------------------------------

set autoindent   " Do dumb auto-indentation when no filetype is set
set linebreak    " Wrap long lines at words boundaries
set noexpandtab  " Do not convert tabs to spaces
set smartindent  " Do smart autoindenting when starting a new line
set smarttab     " Use tabs at the start of a line, spaces elsewhere
set nowrap       " Do not automatically wrap long lines

" Set up default tab spacing
set shiftwidth=4
set softtabstop=4
set tabstop=4

" Change default format options:
set formatoptions-=t  " turn off auto-wrapping type
set formatoptions-=c  " turn off auto-wrapping comments
set formatoptions+=q  " format comments manually with gq
set formatoptions+=n  " gq recognizes numbered lists
set formatoptions+=1  " prefer breaking before, not after, a one-letter word



" FOLDING
" --------------------------------------

set foldmethod=indent  " Lines with equal indent form a fold
set foldlevel=99       " Default to no folds closed



" HELPER FUNCTIONS
" --------------------------------------


" MAPPINGS & CUSTOM COMMANDS
" --------------------------------------


" Move between windows using Ctrl + home row motion keys
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

" Python indentation
"autocmd BufRead,BufNewFile *.py syntax on
autocmd BufRead,BufNewFile *.py set ai
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,with,try,except,finally,def,class
au FileType python setl autoindent tabstop=4 expandtab shiftwidth=4 softtabstop=4

set colorcolumn=81
let mapleader = ","
noremap <Leader>n :NERDTree<cr>
noremap <Leader>a :Ack
nnoremap <esc> :noh<return><esc>
