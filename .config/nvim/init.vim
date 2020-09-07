" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
" call plug#begin('~/.vim/plugged')
call plug#begin(stdpath('data') . '/plugged')

Plug 'itchyny/lightline.vim'

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'

Plug 'editorconfig/editorconfig-vim'

Plug 'sheerun/vim-polyglot'

Plug 'sainnhe/sonokai'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }


Plug 'norcalli/nvim-colorizer.lua'
Plug 'airblade/vim-gitgutter'
Plug 'posva/vim-vue'

Plug 'machakann/vim-highlightedyank'

Plug 'easymotion/vim-easymotion'

Plug 'ryanoasis/vim-devicons'

" Initialize plugin system
call plug#end()

" START COC SETTINGS
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
" END COC SETTINGS


" Plugin 'scrooloose/nerdtree'
" Plugin 'scrooloose/nerdcommenter'

set encoding=UTF-8

set autoread      " Automatically reload when a file is changed outside of Vim
set history=1000  " Remember 1000 lines of command line history

set showmode " Always show what mode we area currently editing in

set hidden           " Allow the changing of buffers without saving
set hlsearch         " Highlight the last used search pattern
set ignorecase       " Ignore case when searching
set incsearch        " Enable incremental searching
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

nmap <C-_>   <Plug>NERDCommenterToggle
vmap <C-_>   <Plug>NERDCommenterToggle<CR>gv

set colorcolumn=81
let mapleader = ","
noremap <Leader>n :NERDTree<cr>
noremap <Leader>f :FZF<cr>
noremap <esc> :noh<return><esc> " I belive this clears the highlighted search term

set guifont=Fira\ Code\:h16

let g:sonokai_style = 'default'
let g:sonokai_enable_italic = 1
let g:sonokai_diagnostic_line_highlight = 1

colorscheme sonokai

set noshowmode

let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ }

set number
set relativenumber
