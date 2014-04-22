cd
ln -s .vim/.vimrc .vimrc
git clone https://github.com/gmarik/Vundle.vim.git .vim/bundle/vundle
vim +PluginInstall +qall
