set nocompatible

" my pluggins here:
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'bling/vim-airline'
Plug 'edkolev/tmuxline.vim'
Plug 'kien/ctrlp.vim'
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-unimpaired'
Plug 'scrooloose/syntastic'
Plug 'terryma/vim-multiple-cursors'
Plug 'terryma/vim-expand-region'
Plug 'Lokaltog/vim-easymotion'
Plug 'godlygeek/tabular'
Plug 'rking/ag.vim'
Plug 'majutsushi/tagbar'
Plug 'Shougo/vimshell.vim'
Plug 'Shougo/vimproc.vim'
Plug 'sjl/gundo.vim'
Plug 'will133/vim-dirdiff'
Plug 'nelstrom/vim-visual-star-search'
Plug 'nelstrom/vim-qargs'
Plug 'osyo-manga/vim-over'
Plug 'alvan/vim-closetag'
Plug 'benmills/vimux'
Plug 'tommcdo/vim-exchange'
"Plug 'airblade/vim-gitgutter'

" theme plugins
Plug 'nanotech/jellybeans.vim'
Plug 'vim-scripts/solarized'

" plugins for UltiSnips and SuperTab support.
Plug 'sirver/ultisnips'
Plug 'tomtom/tlib_vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'garbas/vim-snipmate'
Plug 'ervandew/supertab'

" extra snippet 
Plug 'honza/vim-snippets'

" on demand plugins example.
"Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}

call plug#end()

" map leader key to comma
let mapleader = ","

" map F12 to toggle NERDTree
noremap <silent> <F12> :NERDTreeToggle<CR>

" map F10 to toggle whitespace detection
noremap <silent> <F10> :AirlineToggleWhitespace<CR>:SyntasticToggleMode<CR>

" map F9 to toggle tag bar
noremap <silent> <F9> :TagbarToggle<CR>

" map F5 to toggle gundo
nnoremap <silent> <F5> :GundoToggle<CR>

" otherwise, use cscope for navigation
set cscopetag

" change de default comment style to c++ for c++ files
autocmd FileType cpp,cs setlocal commentstring=//\ %s

" enable closetag for xml,html,htm,xhtml and ndb files.
let g:closetag_filenames = "*.xml,*.html,*.htm,*.xhtml,*.ndb,*.2db,*.config,*.rss"

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
" disable whitespace detection
let g:airline#extensions#whitespace#enabled = 0

" tmuxline configuration
let g:tmuxline_powerline_separators = 1
"let g:tmuxline_separators = {
"    \ 'left' : '',
"    \ 'left_alt': '>',
"    \ 'right' : '',
"    \ 'right_alt' : '<',
"    \ 'space' : ' '}

" disable syntastic active check by default
let g:syntastic_mode_map = {"mode": "passive"}

" disable arrows
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''

" bubble text up and down with ctrl-up and down (required unimpaired plugin)
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" map bashing j and k in random order to ESC
inoremap jk <esc>
inoremap kj <esc>

" map ctrl-x to buffer delete
nnoremap <c-x> :bd<CR>

" map Ctrl-K Ctrl-O to toggle .h/.cpp file (same as Visual Studio)
map <c-k><c-o> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

" ctrl-p configuration
let g:ctrlp_working_path_mode = 0
let g:ctrlp_map = '<leader>f'
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore "**/*.pyc"
      \ --ignore tags
      \ --ignore cscope.out
      \ -g ""'

" quick pairs
imap <leader>' ''<ESC>i
imap <leader>" ""<ESC>i
imap <leader>( ()<ESC>i
imap <leader>[ []<ESC>i

" enable using ctrl-numpad+ for incrementing
noremap <C-kPlus> <C-A>

" enable using ctrl-numpad- for decrementing
noremap <C-kMinus> <C-X>

" center after search
"nmap n nzz
"nmap N Nzz

" map leader-w to ctrl-w
nnoremap <leader>w <c-w>

" show whitespaces when calling set list
set listchars=tab:>\ ,eol:¬,extends:>,precedes:<

" set tab and indent configuration based on file type
if has("autocmd")
    "enable file type detection
    filetype on

    "syntax of makefile is fussy over tabs vs spaces
    autocmd FileType make       setlocal ts=8 sts=8 sw=8 noexpandtab
    autocmd FileType html       setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType css        setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType xml        setlocal ts=4 sts=4 sw=4 noexpandtab
    autocmd FileType c          setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType cpp        setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType python     setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType javascript setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType vim        setlocal ts=4 sts=4 sw=4 expandtab

    " Treat the files with the following extentions as xml
    autocmd BufNewFile,BufRead *.rss,*.ndb,*.2db,*.config setfiletype xml
endif

" replace tabs with 4 spaces
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab


" enable line numbers
set number

" enable relative line numbers
set relativenumber

" don't create the ~filename files
set nobackup

" turn off highlighted search by default, turn on only when needed.
" set nohlsearch

" turn on incremental search (search as character are entered)
set incsearch

" redraw only when we need to
set lazyredraw

" briefly hightligh matching [{()}]
set showmatch

" turn on virtual edit so we can navigate beyond the valid text
"set virtualedit=all

" turn on the wildmenu
set wildmenu

" disable line wrap
set nowrap

" enable cursorline
set cul

" reasonable folding
set foldenable
set foldlevelstart=10
set foldnestmax=10
nnoremap <space> za
"set foldmethod=indent
set foldmethod=marker

" highlight last inserted text
nnoremap gV `[v`]

" gui only options
if has('gui_running')
  set guioptions-=T " remove tool bar
  "set guioptions-=m " remove menu bar
  set guioptions-=r " remove righ-hand scroll bar
  " use the jellybeans color scheme
  colorscheme jellybeans
  set background=dark
  set guifont=Inconsolata\ for\ Powerline\ Medium\ 13
  set linespace=0
  set lines=40
  set columns=170
  
  " Map Ctrl-Tab and Ctrl-Shift-Tab to next and previous buffer (similar to 
  " Visual Studio
  nmap <c-tab> :bn<CR>
  nmap <c-s-tab> :bp<CR>
else
  set term=xterm-256color
  set t_ut= "disable Background Color Erase (BCE)
  set t_Co=256
  colorscheme jellybeans
  set background=dark
  " Map Ctrl-Tab and Ctrl-Shift-Tab to next and previous buffer (similar to 
  " Visual Studio
  set timeout timeoutlen=1000 ttimeoutlen=100
  set <F13>=[27;5;9~ " assign the key code sent by putty when tying ctrl-tab to the F13 key (this requires a patched version of putty)
  set <F14>=[27;6;9~ " assign the key code sent by putty when tying ctrl-shift-tab to the F14 key (this requires a patched version of putty)
  " map ctrl-tab to next buffer
  nmap <F13> :bn<CR>
  " map ctrl-shift-tab to previous buffer
  nmap <F14> :bp<CR>
endif

" disable startup screen
set shortmess=I

" Enable mouse support.
set mouse=a
