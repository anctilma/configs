set nocompatible
filetype off

" enable vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

" let Vundle manage Vundle
" required! 
Plugin 'gmarik/vundle'

" My bundles here:
"Plugin 'Valloric/YouCompleteMe'
Plugin 'bling/vim-airline'
Plugin 'edkolev/tmuxline.vim'
Plugin 'kien/ctrlp.vim'                                      
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'scrooloose/nerdtree'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-obsession'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-dispatch'
Plugin 'scrooloose/syntastic'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'terryma/vim-multiple-cursors'
call vundle#end()
filetype plugin indent on    " required

filetype on

" map F12 to toggle NERDTree
nmap <silent> <F12> :NERDTreeToggle<CR>

" map F11 to toggle whitespace detection
nmap <silent> <F11> :AirlineToggleWhitespace<CR>:SyntasticToggleMode<CR>

" change de default comment style to c++
autocmd FileType c,cpp,cs,java setlocal commentstring=//\ %s


" You complete me configuration
let g:ycm_show_diagnostics_ui = 0

" always display airline
set laststatus=2
" enable the tabline
let g:airline#extensions#tabline#enabled = 1
" show only the file name
let g:airline#extensions#tabline#fnamemod = ':t'
" set jellybeans theme for airline
let g:airline_theme = 'jellybeans'
" use the patched fonts
let g:airline_powerline_fonts = 1
" enablle support for timuxline
let g:airline#extensions#tmuxline#enabled = 1
" disable whitespace detection by default.
let g:airline#extensions#whitespace#enabled = 0

" tmuxline configuration
let g:tmuxline_powerline_separators = 1
"let g:tmuxline_separators = {
"    \ 'left' : '',
"    \ 'left_alt': '>',
"    \ 'right' : '',
"    \ 'right_alt' : '<',
"    \ 'space' : ' '}

" ctrl-p configuration
let g:ctrlp_working_path_mode = 0

" disable syntastic active check by default
let g:syntastic_mode_map = {"mode": "passive"}

" disable arrows
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''

" disable arrow navigation
noremap <Up> ddkP
noremap <Down> ddp
noremap <Left> <Nop>
noremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
vnoremap <Up> <Nop>
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>

" map bashing j and k in random order to ESC
inoremap jk <esc>
inoremap kj <esc>

" quick pairs
imap <leader>' ''<ESC>i
imap <leader>" ""<ESC>i
imap <leader>( ()<ESC>i
imap <leader>[ []<ESC>i

" center after search
nmap n nzz
nmap N Nzz

" replace tabs with 4 spaces
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab

" enable C language style indentation
set cindent

" enable line numbers
set number

" enable relative line numbers
set relativenumber 

" show whitespaces when calling set list
set listchars=tab:>\ ,eol:¬,extends:>,precedes:<

" don't create the ~filename files
set nobackup 

" turn off highlighted search by default, turn on only when needed.
set nohlsearch

" turn on virtual edit so we can navigate beyond the valid text.
set virtualedit=all

" turn on the wildmenu
set wildmenu

" disable line wrap
set nowrap

" enable cursorline
set cul

" map leader key to comma
let mapleader = ","

" gui only options
if has('gui_running')
  set guioptions-=T " remove tool bar
  "set guioptions-=m " remove menu bar
  set guioptions-=r " remove righ-hand scroll bar
  " use the jellybeans color scheme
  colorscheme jellybeans
  set guifont=Consolas\ 12
else
  colorscheme jellybeans
  set term=xterm-256color
  set t_ut= "disable Background Color Erase (BCE)
  set t_Co=256
endif

" disable startup screen
set shortmess=I

" Enable mouse support.
set mouse=a
