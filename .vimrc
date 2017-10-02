" Use Vundle to manage package installation
colo desert " temporary, to appease Vundle
filetype on " workaround for osx to appease git re non-zero exit
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()
Plugin 'gmarik/vundle'

let localleader='\\'

Plugin 'csv.vim'

" Ack
Plugin 'ack.vim'
noremap <LocalLeader># "ayiw:Ack <C-r>a<CR>
vnoremap <LocalLeader># "ay:Ack <C-r>a<CR>

" <C-f> to navigate files, and <C-b> for buffers, <C-m> for MRU
Plugin 'kien/ctrlp.vim'
let g:ctrlp_map = '<LocalLeader>f'
let g:ctrlp_cmd = 'CtrlP'
map <LocalLeader>b :CtrlPBuffer<CR>
map <LocalLeader>m :CtrlPMRU<CR>
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|mk4|avi|pdf)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
let g:ctrlp_working_path_mode = '0' " don't do anything clever with root directory
" Based on https://gist.github.com/rene-aguirre/3715215 config for ctrlp
" open files extra files in hidden buffers
let g:ctrlp_open_multiple_files = '1jr'
" indexing speed up
" NB: need to delete files-list to refresh!  This may work with e.g. PIPs
" dev workflow, but not other projects (otoh, it's bloody fast)
" perhaps could delegate to a small shell script that recreates if too old?

" if has("unix")
" \ 1: ['.git', 'cd %s && git ls-files'],
" \ 'fallback': 'find %s -type f'
"let g:ctrlp_user_command = {
"    \ 'types': {
"        \ 1: ['files-list', 'cat %s/files-list'],
"        \ 2: ['.git', 'cd %s && git ls-files | tee files-list'],
"        \ 3: ['.hg', 'hg --cwd %s locate -I . | tee %s/files-list'],
"        \ 4: ['.svn', 'ack -f %s | tee %s/files-list'],
"        \ },
"    \ 'fallback': 'ack -f %s | tee %s/files-list'
"    \ }
"else
"" windows
"let ctrlp_filter_greps = "".
"    \ 'grep -iv "\\.\(' .
"    \ 'exe\|jar\|class\|swp\|swo\|log\|so\|o\|pyc\|jpe?g\|png\|gif\|mo\|po' .
"    \ 'o\|a\|obj\|com\|dll\|exe\|tmp\|docx\|pdf\|jpg\|png\|vsd\|zip' .
"    \ '\)$"'
"let g:ctrlp_user_command = {
"    \ 'types': {
"        \ 1: ['.git', "cd %s && git ls-files | " . ctrlp_filter_greps],
"        \ 2: ['.hg', 'hg --cwd %s locate -I .'],
"        \ 3: ['.svn', 'svn status %s -q -v --xml | grep -e "\\s*path=" | sed ' . "'" . 's/\\s*path="\(.*\)".*$/\1/' . "' | " . ctrlp_filter_greps],
"        \ },
"    \ 'fallback': 'dir %s /-n /b /s /a-d'
"    \ }
"endif
"
" Haskell stuffs
Plugin 'Shougo/vimproc.vim' " requires manual `make` afterwards
Plugin 'eagletmt/ghcmod-vim'
Plugin 'eagletmt/neco-ghc'
Plugin 'neovimhaskell/haskell-vim'

" syntastic does basic QuickFix stuffs, and integrates nicely with Powerline
Plugin 'scrooloose/syntastic'
" Perl checker is disabled by default, because perl -c has to evaluate code
let g:syntastic_perl_checkers = ['perl', 'podchecker']
let g:syntastic_enable_perl_checker = 1
" just use ENV for following
" let g:syntastic_perl_lib_path = [ 'lib', 'perllib' ]

" via http://www.stephendiehl.com/posts/vim_2016.html
map <Leader>s :SyntasticToggleMode<CR>
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

map <C-t> :Explore .<CR>
let g:netrw_list_hide='\v\~$|\.(o|swo|swp|pyc|wav|mp3|ogg|mk4|avi|pdf)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])'
let g:netrw_liststyle = 3

" Show CSS colours in the right colour
Plugin 'ap/vim-css-color'

" Matchit for HTML etc.
Plugin 'tmhedberg/matchit'

" Set colorscheme to the 256 colour version of desert
Plugin 'flazz/vim-colorschemes'
Plugin 'Lokaltog/vim-distinguished'
Plugin 'altercation/vim-colors-solarized'

" Plugin 'Lokaltog/vim-powerline'
Plugin 'vim-airline/vim-airline'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
set guifont=Inconsolata\ for\ Powerline:h18 

" Git
Plugin 'git.zip'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
let g:gitgutter_override_sign_column_highlight = 1

" Syntax stuff
Plugin 'vim-perl/vim-perl'
Plugin 'jQuery'

Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'

" xquery
Plugin 'HakimCassimallyBBC/xqueryvim'
Plugin 'bkad/CamelCaseMotion'

" Jekyll
Plugin 'PProvost/vim-markdown-jekyll'

" clojure
" Plugin 'guns/vim-sexp'
" let g:sexp_enable_insert_mode_mappings = 0 " because it's an abomination
Plugin 'kien/rainbow_parentheses.vim'
" Plugin 'tpope/vim-sexp-mappings-for-regular-people'
Plugin 'tpope/vim-fireplace'
Plugin 'guns/vim-clojure-static'
Plugin 'guns/vim-clojure-highlight'
Plugin 'bhurlow/vim-parinfer'

Plugin 'sjl/gundo.vim'

call vundle#end() 
filetype plugin indent on

" make this file easy to edit and source
map <Leader>v :e  $MYVIMRC<CR>
map <Leader>V :so $MYVIMRC<CR>

map <space> <pagedown>
map <S-space> <pageup> " won't work in terminal vim

" basics
" set scrolloff=3 " nice for code, but not so nice for help
syn on
" set cursorline " obscurse some highlighting
set expandtab
set shiftwidth=2
set tabstop=2
set autoindent
set smarttab
set visualbell
set splitbelow
set splitright
set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
set nojoinspaces

func! WordProcessorMode()
    setlocal formatoptions-=t
    setlocal textwidth=80
    map <buffer> j gj
    map <buffer> k gk
    setlocal smartindent
    setlocal spell spelllang=en_gb
    setlocal noexpandtab
    setlocal nocursorline

    " didn't use to need these?
    setlocal wrap
    setlocal linebreak
endfu

if has("autocmd")
  " Avoid showing trailing whitespace when in insert mode
  au InsertEnter * :set listchars-=trail:_
  au InsertLeave * :set listchars+=trail:_

  " In Makefiles, use real tabs, not tabs expanded to spaces
  au FileType make set noexpandtab

  au FileType text call WordProcessorMode()
  au FileType markdown call WordProcessorMode()
  au FileType help set nospell

  au FileType python set ts=4
  au FileType python set sw=4

  " TODO, put these in a plugin
  au BufRead,BufNewFile *.t set filetype=perl
  au BufRead,BufNewFile *.t map <buffer> ,t :!prove -wlv %<CR>
  au FileType yaml map <buffer> ,t :!prove -wlv t/acceptance.t :: %<CR>
  augroup AutoReloadVimRC
    au!
    au BufWritePost $MYVIMRC nested so $MYVIMRC
      " nested required to avoid breaking Powerline
  augroup END
endif

" stop me fat-fingering <F1> for help...
map <F1> <ESC>
imap <F1> <ESC>

" toggle
map <F4> :set number!<CR>
map <F5> :set list!<CR>
set pastetoggle=<F3>

" navigate buffers with <C-p> and <C-n>
set hidden
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

" cute, but breaks copy/paste, need to debug this
" set mouse=a

set background=dark
if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
    set t_Co=256
    let g:solarized_termcolors=256
    colo distinguished
else
    colo desert
endif

" indicator chars
" set listchars=tab:>\ ,trail:_,extends:\\,precedes:%,nbsp:_,eol:$
" set showbreak=+++
set listchars=tab:>\ ,trail:\ 
set list
hi SpecialKey ctermbg=red ctermfg=black guibg=red guifg=black
