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

so vimrc-plugins
