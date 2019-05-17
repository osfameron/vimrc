call plug#begin()

" PLUGINS
" =======

" search
Plug 'mhinz/vim-grepper'
nmap gr  :Grepper<CR>
xmap gr  <plug>(GrepperOperator)
nmap gs  <plug>(GrepperOperator)
xmap gs  <plug>(GrepperOperator)

Plug 'mhinz/vim-tree'

" Fuzzy Finder
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
nmap <Leader>f :Files<CR>
nmap <Leader>b :Buffers<CR>

" Tame quickfix
Plug 'romainl/vim-qf'

" Context
Plug 'junegunn/limelight.vim'

" Project/build/test
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-dispatch'
Plug 'janko/vim-test'

" modern language bits
Plug 'w0rp/ale'
let g:ale_sign_error = '• '
let g:ale_sign_warning = '◦ '
" linting is annoying. Only do it on `:ALELint`
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 0


" Match parens etc.
Plug 'andymass/vim-matchup'

" Colour schemes
Plug 'altercation/vim-colors-solarized'
Plug 'itchyny/landscape.vim'

" Status line
Plug 'itchyny/lightline.vim'

" clojure
Plug 'kien/rainbow_parentheses.vim'
Plug 'tpope/vim-fireplace'
Plug 'guns/vim-clojure-static'
Plug 'guns/vim-clojure-highlight'
Plug 'bhurlow/vim-parinfer'

" Git
Plug 'tpope/vim-git'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
let g:gitgutter_override_sign_column_highlight = 1

" Miscellaneous syntax
Plug 'ap/vim-css-color'
Plug 'chrisbra/csv.vim'
Plug 'vim-perl/vim-perl'
Plug 'PProvost/vim-markdown-jekyll'
Plug 'HakimCassimallyBBC/xqueryvim'
Plug 'bkad/CamelCaseMotion'

call plug#end()






" BASICS
" ======

let mapleader=','

set expandtab
set shiftwidth=4
set tabstop=4
set autoindent
set smarttab

set visualbell
set splitbelow
set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
set nojoinspaces

" Search defaults
set hlsearch
set ignorecase
set smartcase
set incsearch
nmap <Leader>q :nohlsearch<CR>

" navigation niceties
map <space> <pagedown>
map <S-space> <pageup> " won't work in terminal vim
set hidden
map <c-p> :bp<CR>
map <c-n> :bn<CR>

command! Close if &buftype == 'quickfix' | cclose | else | bd | endif
map <c-x> :Close<CR>
command! PrevQflike if len(getqflist()) | cprev | else | lprev | endif
command! NextQflike if len(getqflist()) | cprev | else | lprev | endif
map <c-j> :NextQflike<CR>
map <c-k> :PrevQflike<CR>

" file browsing
map <C-t> :Explore .<CR>
let g:netrw_list_hide='\v\~$|\.(o|swo|swp|pyc|wav|mp3|ogg|mk4|avi|pdf)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])'
let g:netrw_liststyle = 3

" stop me fat-fingering <F1> for help...
map <F1> <ESC>
imap <F1> <ESC>

" toggle
set pastetoggle=<F3>
map <F4> :set number!<CR>
map <F5> :set list!<CR>

set scrolloff=3 " nice for code, but not so nice for help
set diffopt=vertical

" via merijn on #haskell
" sets OSX clipboard automatically
set clipboard+=unnamed

" indicator chars
set listchars=tab:>\ ,trail:\ 
hi SpecialKey ctermbg=red ctermfg=black guibg=red guifg=black

" make this file easy to edit and source
" ======================================
map <Leader>v :e  $MYVIMRC<CR>
map <Leader>V :so $MYVIMRC<CR>

" Plain text
" ==========
func! WordProcessorMode()
    setlocal formatoptions-=t
    setlocal textwidth=80
    map <buffer> j gj
    map <buffer> k gk
    setlocal smartindent
    setlocal spell spelllang=en_gb
    setlocal noexpandtab
    setlocal nocursorline
    setlocal wrap
    setlocal linebreak
endfu

" autocommands
" ============

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

  augroup AutoReloadVimRC
    au!
    au BufWritePost $MYVIMRC nested so $MYVIMRC
  augroup END
endif

" colours
if !has('gui_running')
    set t_Co=256
endif

colo solarized
set background=light
set guifont=Menlo\ Regular:h18

" TODO infer these values programmatically
highlight ALEWarningSign guifg=grey guibg=#eee8d5
highlight ALEErrorSign guifg=grey   guibg=#eee8d5

" Lightline
let g:lightline = {
    \'active': {
    \    'left': [['readonly', 'filename', 'modified', 'gitbranch']]
    \ },
    \ 'component_function': {
    \    'gitbranch': 'fugitive#head'
    \ }
\}
