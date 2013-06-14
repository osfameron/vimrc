" make this file easy to edit and source
map <Leader>v :e ~/.vimrc<CR>
map <Leader>V :so ~/.vimrc<CR>

" basics
set expandtab
set shiftwidth=4
set tabstop=4
set autoindent
set smarttab
set visualbell
syn on
set splitbelow
set splitright
set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs

" set256colours
if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
  set t_Co=256
endif

" stop me fat-fingering <F1> for help...
map <F1> <ESC>
imap <F1> <ESC>

" toggle
map <F4> :set number!<CR>
map <F5> :set list!<CR>
set pastetoggle=<F10>

" navigate buffers with <C-p> and <C-n>
map <c-p> :bp<CR>
map <c-n> :bn<CR>
map <c-x> :bd<CR>

" Search defaults
set hlsearch
set ignorecase
set smartcase
set incsearch
nmap <Leader>q :nohlsearch<CR>

" via merijn on #haskell
" sets OSX clipboard automatically
set clipboard+=unnamed

" Use Vundle to manage package installation
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" Ack
Bundle "ack.vim"
noremap <LocalLeader># "ayiw:Ack <C-r>a<CR>
vnoremap <LocalLeader># "ay:Ack <C-r>a<CR>

" :Gist
Bundle "mattn/webapi-vim"
Bundle "mattn/gist-vim"
let g:gist_post_private = 1

" <C-f> to navigate files, and <C-b> for buffers
Bundle "kien/ctrlp.vim"
let g:ctrlp_map = '<C-f>'
let g:ctrlp_cmd = 'CtrlP'
map <c-b> :CtrlPBuffer<CR>
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|mk4|avi|pdf)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'

" syntastic does basic QuickFix stuffs, and integrates nicely with Powerline
Bundle "scrooloose/syntastic"

" map <C-t> to NERDtree
Bundle "scrooloose/nerdtree"
map <C-t> :NERDTreeToggle<CR>

" Show CSS colours in the right colour
Bundle "ap/vim-css-color"

" Matchit for HTML etc.
Bundle "tmhedberg/matchit"

" Snippets
Bundle "MarcWeber/ultisnips"
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "osfameron/vim-snippets"
let g:UltiSnips = {} " hackety hack
let g:UltiSnips.ExpandTrigger="<c-j>"
let g:UltiSnips.ListSnippets="<c-l>"
" let g:UltiSnips.JumpForwardTrigger = "<tab>"
" let g:UltiSnips.JumpBackwardTrigger = "<s-tab>"

" Set colorscheme to the 256 colour version of desert
Bundle "flazz/vim-colorschemes"
Bundle "Lokaltog/vim-distinguished"
Bundle "altercation/vim-colors-solarized"
set background=dark
let g:solarized_termcolors=256
" colo desert
" colo solarized
colo distinguished

" the exciting new status line
Bundle "Lokaltog/vim-powerline"

" Git
Bundle "git.zip"
Bundle 'tpope/vim-fugitive'
" [q ]q etc.
Bundle 'tpope/vim-unimpaired' 

" Slime
Bundle "osfameron/vim-slime"
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "1"}

" TODO plugins I haven't actually played with yet
Bundle "vim-perl/vim-perl"
Bundle "jQuery"

" Allow unsaved changes in buffers
set hidden
filetype plugin indent on
