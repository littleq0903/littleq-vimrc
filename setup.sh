ln -s `dirname $0`/.vimrc $HOME

git clone git@github.com:Shougo/neobundle.vim.git ~/.vim/bundle/neobundle.vim

vim -c "NeoBundleInstall"
