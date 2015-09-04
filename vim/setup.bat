:: copy vimrc to home folder
copy vimrc ~\_vimrc

:: copy content over to .vim folder
copy -r after ~\vimfiles
copy -r colors ~\vimfiles
copy -r plugin ~\vimfiles
copy -r plugins ~\vimfiles
copy -r UltiSnips ~\vimfiles

:: create temp folders
if not exist ~\vimbackup
    mkdir ~\vimbackup
if not exist ~\vimswap
    mkdir ~\vimswap
if not exist ~\vimundo
    mkdir ~\vimundo

:: setup vim plug
curl -fLo ~\vimfiles\autoload\plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

:: copy vimproc binaries
copy windows\vimproc\* ~\vimfiles\plugged\vimproc.vim\autoload

:: install consolas powerline fonts
:: TODO 

:: add "Open vim here" windows explorer context menu entry
:: TODO 

:: start vim and download plugins
gvim +PlugUpdate +qall

