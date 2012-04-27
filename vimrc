" VIM-PATHOGEN

runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()


" COLORS

syntax on
filetype plugin indent on

colorscheme molokai

if $TERM =~ '256color'
  set t_Co=256
elseif $TERM =~ '^xterm$'
  set t_Co=256
endif

set cursorline
set number

let mapleader=','

" search feature
set ignorecase " ignore case
set smartcase  " match case if a capital letter is present in the regexp
set hlsearch   " highlight matched patterns
set incsearch  " highlight search result as you type it

set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show unicode glyphs

set list!
set listchars=tab:▸\ ,trail:•,extends:»,precedes:« " whitespace and trailing spaces

set mouse=a " allow mouse scrolling

"
" NERDTree
"
nnoremap <C-g> :NERDTreeToggle<cr>
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$' ]
let NERDTreeHighlightCursorline=1
let NERDTreeShowBookmarks=1
let NERDTreeShowFiles=1


"
" Tabular
"
nmap <Leader>ah :Tabularize /=><CR>
vmap <Leader>ah :Tabularize /=><CR>
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>


"
" Powerline
"
let g:Powerline_symbols = 'unicode'


"
" Quickfixsigns
"
let g:quickfixsigns_classes=['qfl', 'vcsdiff', 'breakpoints']


"
" Syntastic
"
let g:syntastic_enable_signs=1  " enable syntastic signs to show up
let g:syntastic_auto_loc_list=1 " automatically open error window
let g:syntastic_mode_map = { 'mode': 'active',
			   \ 'active_filetypes': [],
			   \ 'passive_filetypes': ['c', 'scss'] }
