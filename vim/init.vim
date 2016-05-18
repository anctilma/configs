" {{{ compatibility
if (has("win32"))
    source $VIMRUNTIME/vimrc_example.vim
    " source $VIMRUNTIME/mswin.vim
    " behave mswin
endif
" }}} compatibility
" {{{ plugins
if (has("win32"))
    call plug#begin('~/vimfiles/plugged')
else
    call plug#begin('~/.config/nvim/plugged')
endif

let g:plug_timeout=120

Plug 'mhinz/vim-startify'
Plug 'qpkorr/vim-bufkill'
Plug 'unblevable/quick-scope'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'felikz/ctrlp-py-matcher'
Plug 'andrewradev/splitjoin.vim'
Plug 'benekastah/neomake'
Plug 'terryma/vim-multiple-cursors'
Plug 'terryma/vim-expand-region'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'aykamko/vim-easymotion-segments'
Plug 'godlygeek/tabular'
Plug 'rking/ag.vim'
Plug 'majutsushi/tagbar'
Plug 'mbbill/undotree'
Plug 'will133/vim-dirdiff'
Plug 'nelstrom/vim-visual-star-search'
Plug 'nelstrom/vim-qargs'
Plug 'alvan/vim-closetag'
Plug 'tommcdo/vim-exchange'
Plug 'ludovicchabant/vim-gutentags'
Plug 'qpkorr/vim-renamer'
Plug 'edsono/vim-matchit'
Plug 'davidhalter/jedi'
Plug 'osse/double-tap'
Plug 'sickill/vim-pasta'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'christoomey/vim-sort-motion'
Plug 'wellle/targets.vim'
Plug 'michaeljsmith/vim-indent-object'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-unimpaired'
" Plug 'tpope/vim-sleuth' " adjust shiftwidth and expandtab automatically
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'junegunn/goyo.vim'
if (!has ("win32"))
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'shougo/vimproc', { 'do': 'make' }
else
    Plug 'majkinetor/vim-omnipresence' 
endif
"Plug 'airblade/vim-gitgutter'

" plugins for UltiSnips and SuperTab support.
Plug 'sirver/ultisnips'
Plug 'tomtom/tlib_vim'
Plug 'marcWeber/vim-addon-mw-utils'
Plug 'garbas/vim-snipmate'
Plug 'ervandew/supertab'
"Plug 'othree/vim-autocomplpop'
Plug 'vim-scripts/L9'

" extra snippet
Plug 'honza/vim-snippets'

" tmux plugins
if (!has("win32"))
Plug 'edkolev/tmuxline.vim'
Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator'
endif

" on demand plugins example.
"Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}

call plug#end()
" }}} plugins
" {{{ tmux configuration
" enable support for timuxline in airline
let g:airline#extensions#tmuxline#enabled = 1
let g:tmuxline_powerline_separators = 1
"let g:tmuxline_separators = {
"    \ 'left' : '',
"    \ 'left_alt': '>',
"    \ 'right' : '',
"    \ 'right_alt' : '<',
"    \ 'space' : ' '}

let g:tmux_navigator_no_mappings = 1
if $TMUX != ''
    nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
    nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
    nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
    nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
    nnoremap <silent> <c-p> :TmuxNavigatePrevious<cr>
else
    nnoremap <silent> <c-h> <c-w>h
    nnoremap <silent> <c-j> <c-w>j 
    nnoremap <silent> <c-k> <c-w>k
    nnoremap <silent> <c-l> <c-w>l
    nnoremap <silent> <c-p> <c-w>p
endif

" }}} tmux configuration
" {{{ ctrlp configuration
let g:ctrlp_working_path_mode = 0
let g:ctrlp_map = '<leader>e'
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
let g:ctrlp_clear_cache_on_exit = 0
if (!has("win32"))
    let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
          \ --ignore .git
          \ --ignore .svn
          \ --ignore "**/*.pyc"
          \ --ignore tags
          \ --ignore cscope.out
          \ --ignore Session.vim
          \ -g ""'
endif

" }}} ctrlp configuration
"{{{ closetag configuration
" enable closetag for xml,html,htm,xhtml and ndb files
let g:closetag_filenames = "*.xml,*.html,*.htm,*.xhtml,*.ndb,*.2db,*.config,*.rss,*.scn"
"}}} closetag configuration
"{{{ airline configuration
" always display airline
set laststatus=2
" disable the tabline
 let g:airline#extensions#tabline#enabled = 0
" show only the file name
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tagbar#enabled = 0

" set jellybeans theme for airline
let g:airline_theme = 'jellybeans'
" use the patched fonts
let g:airline_powerline_fonts = 1
" disable whitespace detection
let g:airline#extensions#whitespace#enabled = 0
" disable arrows
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
"}}} airline configuration
" {{{ gugentags configuration
let g:gutentags_exclude = ["linux-xlnx"]
" }}}
" {{{ incsearch configuration
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map z/ <Plug>(incsearch-easymotion-/)
map z? <Plug>(incsearch-easymotion-?)
map zg/ <Plug>(incsearch-easymotion-stay)
" }}}
" {{{ quickscope configuration
" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
" }}} 
"{{{ autocmd
" set tab and indent configuration based on file type
if has("autocmd")
    "enable file type detection
    filetype on

    autocmd FileType make       setlocal ts=8 sts=8 sw=8 noexpandtab
    autocmd FileType html       setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType css        setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType xml        setlocal ts=4 sts=4 sw=4 noexpandtab
    autocmd FileType c          setlocal ts=4 sts=4 sw=4 expandtab cindent comments ^=://
    autocmd FileType cs         setlocal ts=4 sts=4 sw=4 expandtab cindent comments ^=://
    autocmd FileType javascript setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType python     setlocal ts=4 sts=4 sw=4 expandtab autoindent
    autocmd FileType vim        setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType cpp        setlocal ts=4 sts=4 sw=4 expandtab cindent comments ^=://

    " change de default comment style to c++ for c++ files
    autocmd FileType cpp,cs     setlocal commentstring=//\ %s

    " Treat the files with the following extentions as xml
    autocmd BufNewFile,BufRead *.rss,*.ndb,*.2db,*.config,*.scn setfiletype xml

    " Force this style for c++, since vim-sleuth misreads the initializer
    " list offset as the file general shiftwidth sometimes.
    " autocmd BufRead *.cpp,*.h setlocal ts=4 sts=4 sw=4 expandtab

    " Source the vimrc file after saving it
    if has("autocmd")
      autocmd BufWritePost init.vim source $MYVIMRC
    endif

endif
"}}} autocmd
" {{{ wildignore
if has("win32")
    set wildignore+=*\\.git\\*,*\\.hg\\*,*\\.svn\\*,tags,cscope.out,*.pyc,Session.vim  " Windows ('noshellslash')
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,tags,cscope.out,*.pyc,Session.vim
endif
" }}}
" {{{ mappings

" map leader key to space
let mapleader="\<space>"

" edit the vimrc on a vertical split on leader v
nmap <leader>v :e $MYVIMRC<CR>

" map F12 to toggle NERDTree
noremap <silent> <F12> :NERDTreeToggle<CR>

" map F10 to toggle whitespace detection
noremap <silent> <F10> :AirlineToggleWhitespace<CR>:SyntasticToggleMode<CR>

" map F9 to toggle tag bar
noremap <silent> <F9> :TagbarToggle<CR>

" map F7 to save and build
if (!has("win32"))
    "nnoremap <silent> <F7> :Neomake ARCH=arm -s -j 2<CR>
    nnoremap <silent> <F7> :Make ARCH=arm -s -j 2<CR>
else
" map F6 to omnipresence
let g:omnipresence_hotkey = 'F6'
endif

" map F5 to toggle undotree
nnoremap <silent> <F5> :UndotreeToggle<CR>

" bubble text up and down with ctrl-up and down (required unimpaired plugin)
" bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" quick pairs
" imap <leader>' ''<ESC>i
" imap <leader>" ""<ESC>i
" imap <leader>( ()<ESC>i
" imap <leader>[ []<ESC>i

" enable using ctrl-numpad+ for incrementing
noremap <C-kPlus> <C-A>

" enable using ctrl-numpad- for decrementing
noremap <C-kMinus> <C-X>

" center after search
nmap n nzz
nmap N Nzz

" center after jump to next function
nmap ]] ]]zz
nmap [[ [[zz

" map Y to y$ (yank till end of line)
noremap Y y$

" map leader-s to buffer save.
nnoremap <leader>s :w<CR>

" map leader-S to save all buffers
nnoremap <leader>S :wa<CR>

" map space k and space j to buffer next and buffer previous
nnoremap <silent> <leader>k :bn<CR>
nnoremap <silent> <leader>j :bp<CR>

" map leader-t to CtrlPTag
nnoremap <leader>t :CtrlPTag<CR>

" map leader-l to CtrlPBuffer
nnoremap <leader>l :CtrlPBuffer<CR>

" map leader-x to delete buffer to vim-bufkill's BD command
nnoremap <silent> <leader>x :BD<CR>

" map leader-o to toggle .h/.cpp file (o for opposite)
map <leader>o :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

" map leader g to fugitive.vim commands
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gl :GV<CR>
nnoremap <leader>gL :GV!<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gw :Gwrite<CR>

" map leader w to ctrl-w for window operations
nnoremap <leader>w <c-w>

" quit terminal mode on ESC
tnoremap <Esc> <C-\><C-n>

" }}} mappings
" {{{ folding
" reasonable folding
set foldenable
set foldlevelstart=0
set foldnestmax=10
nnoremap <leader>f za
set foldmethod=marker
" }}}
" {{{ misc

" disable the tabline
set showtabline=0

" enable syntax highligting
syntax on

" enable line numbers
set number

" enable relative line numbers
set relativenumber

" enable hidden buffers by default
set hidden

" don't create the ~filename files
"set nobackup

" store swap, backup and undo files in a central location instead of the
" current directory
if (has("win32"))
    set dir=~/vimswap//
    set backupdir=~/vimbackup//
    set undodir=~/vimundo//
else
    set dir=~/.vimswap//
    set backupdir=~/.vimbackup//
    set undodir=~/.vimundo//
endif

" turn off highlighted search by default, turn on only when needed.
" set nohlsearch

" turn on incremental search (search as character are entered)
set incsearch

" always show at least one line above/below the cursor
"set scrolloff=1

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

" open new split to rignt or bottom and move cursor to new split
set splitbelow
set splitright

" Insert one space instead of two after a '.', '?' and '!' with a join command.
set nojoinspaces

" highlight last inserted text
nnoremap gV `[v`]

" disable startup screen
set shortmess=I

" show whitespaces when calling set list
scriptencoding=utf-8
set listchars=tab:>\ ,eol:¬,extends:>,precedes:<

" }}}misc
" {{{ gui vs terminal
if has('gui_running')
    set guioptions-=T " remove tool bar
    set guioptions-=m " remove menu bar
    set guioptions-=r " remove righ-hand scroll bar
    set guioptions-=L " remove left-hand scroll bar
    " use the jellybeans color scheme
    set background=dark
    colorscheme jellybeans

    if has ('win32')
        set guifont=Powerline_Consolas:h13:cANSI
    else
        set guifont=Inconsolata\ for\ Powerline\ Medium\ 13
    endif
    set linespace=1
    set lines=40
    set columns=170
else
    " Enable mouse support.
    set mouse=a
    set t_ut= "disable Background Color Erase (BCE)
    set background=dark
    colorscheme jellybeans
endif

" }}} gui vs terminal
