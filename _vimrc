set expandtab
set sw=4
set ts=4
colo desert
map <F5> :set list!<CR>
set pastetoggle=<F10>
set ai
set vb
set ruler
set hlsearch
set ignorecase
set smartcase
set incsearch
syn on

set splitbelow
set splitright

" via merijn on #haskell
" sets OSX clipboard automatically
set clipboard+=unnamed

set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle "git.zip"
Bundle 'tpope/vim-fugitive'

Bundle 'git://git.wincent.com/command-t.git'
" note additional config step

Bundle "ack.vim"
noremap <LocalLeader># "ayiw:Ack <C-r>a<CR>
vnoremap <LocalLeader># "ay:Ack <C-r>a<CR>

Bundle "http://github.com/mattn/gist-vim.git"

Bundle "petdance/vim-perl"
Bundle "jQuery"

set hidden
Bundle "sjbach/lusty"

filetype plugin indent on
