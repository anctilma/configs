if has("win32")
    set runtimepath+=~/vimfiles,~/vimfiles/after
    set packpath+=~/vimfiles
    source ~/_vimrc
else
    set runtimepath+=~/.vim,~/.vim/after
    set packpath+=~/.vim
    source ~/.vimrc
endif
