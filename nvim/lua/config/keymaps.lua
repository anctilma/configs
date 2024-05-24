-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- quit terminal mode on ESC in neovim
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- map leader w to ctrl-w for window operations
vim.keymap.set('n', '<leader>w', '<c-w>', {noremap = true })
vim.keymap.set('t', '<leader>w', '<c-w>', {noremap = true })

-- edit the vimrc on a vertical split on leader v
vim.keymap.set('n', "<leader>v", ":e $MYVIMRC<CR>")

-- Make "[[" and "]]" work even if '{' or '}' are not in the first column
-- vim.keymap.set('n', '[[', '?{<CR>w99[{', { noremap = true })
-- vim.keymap.set('n', '][', '/}<CR>b99]}', { noremap = true })
-- vim.keymap.set('n', ']]', 'j0[[%/{<CR>', { noremap = true })
-- vim.keymap.set('n', '[]', 'k$][%?}<CR>', { noremap = true })

-- map leader g to fugitive.vim commands
vim.keymap.set('n', '<leader>gs', ':Git<CR>', { noremap = true })
vim.keymap.set('n', '<leader>gl', ':GV<CR>', { noremap = true })
vim.keymap.set('n', '<leader>gL', ':GV!<CR>', { noremap = true })
vim.keymap.set('n', '<leader>gc', ':Git commit<CR>', { noremap = true })
vim.keymap.set('n', '<leader>gd', ':Gdiffsplit<CR>', { noremap = true })
vim.keymap.set('n', '<leader>gh', ':Ghdiffsplit<CR>', { noremap = true })
vim.keymap.set('n', '<leader>gv', ':Gvdiffsplit<CR>', { noremap = true })
vim.keymap.set('n', '<leader>gr', ':Gread<CR>', { noremap = true })
vim.keymap.set('n', '<leader>gw', ':Gwrite<CR>', { noremap = true })

-- map F5 to toggle undotree
vim.keymap.set('n', '<F5>', ':UndotreeToggle<CR>', { silent = true, noremap = true })

-- map F9 to toggle Aerial
vim.keymap.set("n", "<F9>", "<cmd>AerialToggle!<CR>")

-- bubble text up and down with ctrl-up and down (requires unimpaired plugin)
-- bubble single lines
vim.keymap.set('n', '<C-Up>', '[e')
vim.keymap.set('n', '<C-Down>',']e')
-- bubble multiple lines
vim.keymap.set('n', '<C-Up>', '[egv')
vim.keymap.set('n', '<C-Down>', ']egv')

-- enable using ctrl-numpad+ for incrementing
vim.keymap.set('', '<C-kPlus>', '<C-A>', { noremap = true })

-- enable using ctrl-numpad- for decrementing
vim.keymap.set('', '<C-kMinus>', '<C-X>', {noremap = true })

-- center after search
-- vim.keymap.set('n', 'n', 'nzz')
-- vim.keymap.set('n', 'N', 'Nzz')

-- center after jump to next function
-- vim.keymap.set('n', ']]', ']]zz')
-- vim.keymap.set('n', '[[', '[[zz')

-- map Y to y$ (yank till end of line)
vim.keymap.set('n', 'Y', 'y$')

-- highlight last inserted text
vim.keymap.set('n', 'gV', '`[v`]', { noremap = true })

-- map é to search so we can use the same key to search even if the keyboard is in french
vim.keymap.set('n', 'é', '/')
vim.keymap.set('n', 'É', '?')

-- map leader-S to buffer save.
vim.keymap.set('n', '<leader>S', ':w<CR>', { noremap = true })

-- map space k and space j to buffer next and buffer previous
vim.keymap.set('n', '<leader>k', ':bn<CR>', { silent = true, noremap = true })
vim.keymap.set('n', '<leader>j', ':bp<CR>', { silent = true, noremap = true })

-- map leader-x to delete buffer to vim-bufkill's BD command
vim.keymap.set('n', '<leader>x', ':BD<CR>', { noremap = true, silent = true })

-- map leader-o to toggle .h/.cpp file (o for opposite) - TODO: only configure this mapping when loading a cpp file.
-- vim.keymap.set('', '<M-o>', ':e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>')
vim.keymap.set('', '<M-o>', ':ClangdSwitchSourceHeader<CR>')

