# assumes we cloned this repo into .vim/
cd
ln -s .vim/.vimrc .vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
