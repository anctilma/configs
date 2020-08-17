#!/bin/sh

echo "Installing vim configuration files..."

# copy vimrc to home folder
cp vimrc ~/.vimrc

# copy content over to .vim folder
if [ -d ~/.vim ]; then
	echo "Found .vim folder, copying to ~/.vim.backup"
	cp -r ~/.vim ~/.vim.backup
	rm -rf ~/.vim
fi

mkdir ~/.vim
cp -r after ~/.vim
cp -r plugin ~/.vim
cp -r UltiSnips ~/.vim

# create temp folders
if [ ! -d ~/.vimbackup/ ]; then
	mkdir ~/.vimbackup
fi

if [ ! -d ~/.vimswap/ ]; then
	mkdir ~/.vimswap
fi

if [ ! -d ~/.vimundo/ ]; then
	mkdir ~/.vimundo
fi

# setup vim plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install jellybeans color theme
# curl -fLo ~/.vim/colors/jellybeans.vim --create-dirs https://raw.githubusercontent.com/nanotech/jellybeans.vim/master/colors/jellybeans.vim

# gui border fix
#cp linux/.gtkrc-2.0 ~
#cp linux/.Xresources ~
#cp linux/.xinitrc ~

# install fonts
#if [ -d ~/powerline-fonts ]; then
#	cd ~/powerline-fonts
#	git pull origin master
#	cd ~/configs/vim
#else
#	git clone https://github.com/powerline/fonts.git ~/powerline-fonts
#fi
#sudo sh ~/powerline-fonts/install.sh

# start vim and download plugins
vim --noplugin +PlugInstall +qall

echo "Done."
