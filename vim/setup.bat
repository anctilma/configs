echo "Installing vim configuration files..."
:: copy vimrc to home folder

copy vimrc ~\_vimrc

if exist ~\vimfiles
    echo "Found vimfiles folder, copying to ~/vimfiles.backup"
    copy -r ~\vimfiles ~\vimfiles.backup
    rmdir /s /q ~\vimfiles

mkdir ~\vimfiles


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

:: install consolas powerline fonts
:: TODO 

:: add "Open vim here" windows explorer context menu entry
:: TODO 

:: start vim and download plugins
gvim +PlugUpdate +qall

echo "Done."
