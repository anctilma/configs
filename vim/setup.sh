#!/bin/sh

# copy vimrc to home folder
cp vimrc ~/.vimrc

# copy content over to .vim folder
cp -r after ~/.vim
cp -r colors ~/.vim
cp -r plugin ~/.vim
cp -r plugins ~/.vim
cp -r UltiSnips ~/.vim

# create temp folders
mkdir ~/.vimbackup
mkdir ~/.vimswap
mkdir ~/.vimundo

# setup vim plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# gui border fix
cp linux/.gtkrc-2.0 ~
cp linux/.Xresources ~

# install fonts
if [ -d "~/powerline-fonts" ]; then
  cd ~/powerline-fonts
  git pull origin master
  cd ~/configs/vim
  sudo sh ~/powerline-fonts/install.sh
else
  git clone https://github.com/powerline/fonts.git ~/powerline-fonts
  sudo sh ~/powerline-fonts/install.sh
fi

# start vim and download plugins
vim +PlugUpdate +qall

