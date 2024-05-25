-- [[ Setting options ]]
-- See `:help vim.o`
-- disable startup screen
vim.o.shortmess = 'I'

-- turn off highlighted search by default, turn on only when needed.
vim.o.hlsearch = false

-- turn on incremental search (search as character are entered)
vim.o.incsearch = true

-- briefly hightligh matching [{()}] !!! not sure if this is needed anymore
vim.o.showmatch = true

-- Make line numbers default
vim.wo.number = true

-- Make relative line numbers default
vim.wo.relativenumber = true

-- turn on virtual edit so we can navigate beyond the valid text
-- vim.o.virtualedit = 'all'

-- Enable mouse mode
vim.o.mouse = 'a'

-- turn on the wildmenu (not sure if this is needed anymore)
vim.o.wildmenu = true

-- easy switch to proper soft wrapping mode
vim.cmd( [[ command! -nargs=* Wrap set wrap linebreak nolist ]] )
vim.cmd( [[ command! -nargs=* NoWrap set nowrap nolinebreak ]] )

-- enable cursorline
vim.o.cursorline = true

-- open new split to rignt or bottom and move cursor to new split
vim.o.splitbelow = true
vim.o.splitright = true

-- insert one space instead of two after a '.', '?' and '!' with a join command.
vim.o.joinspaces = false

-- enable hidden buffers by default
vim.o.hidden = true

-- disable the tabline
vim.o.showtabline = 0

-- Scroll all the way to the edge
vim.o.scrolloff = 0

-- Autoload file changes. You can undo by pressing u.
vim.o.autoread = true

-- reasonable folding
vim.o.foldenable = true
vim.o.foldlevelstart=0
vim.o.foldnestmax=10
vim.o.foldmethod='marker'

-- show whitespaces when calling set list
vim.o.listchars = 'space: ,tab: >,eol:¬'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true
