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

" NERDTree
nnoremap <C-g> :NERDTreeToggle<cr>
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$' ]
let NERDTreeHighlightCursorline=1
let NERDTreeShowBookmarks=1
let NERDTreeShowFiles=1
