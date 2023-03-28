
-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- set tab and indent configuration based on file type
vim.api.nvim_create_autocmd('FileType', {
  pattern = {'c', 'cpp', 'cmake', 'cs', 'css', 'java', 'html', 'ps1', 'python', 'text', 'vim', 'xml'},
  command = 'setlocal ts=4 sts=4 sw=4'
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = {'javascript', 'json', 'sh', 'typescript'},
  command = 'setlocal ts=2 sts=2 sw=2'
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'c, cpp, cmake, cs, javascript, java, make, ps1, python, text, typescript, vim',
  command = 'setlocal tw=100'
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'make',
  command = 'setlocal ts=8 sts=8 sw=8'
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = {'c', 'cpp'},
  command = 'setlocal cc=100'
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = {'c', 'cpp', 'cmake', 'cs', 'css', 'html', 'javascript', 'java', 'json', 'ps1', 'python', 'sh', 'text', 'typescript', 'vim'},
  command = 'setlocal expandtab'
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = {'make', 'xml'},
  command = 'setlocal noexpandtab'
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = {'c', 'cpp', 'cs'},
  command = 'setlocal cindent'
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = {'c', 'cpp', 'cs'},
  command = 'setlocal autoindent'
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = {'ps1', 'python'},
  command = 'setlocal autoindent'
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = {'c', 'cpp', 'cs'},
  command = 'setlocal comments ^=://'
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = {'c', 'cpp', 'cs'},
  command = 'setlocal comments ^=://'
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = {'python'},
  command = 'setlocal commentstring=#\\ %s'
})

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = {'*'},
  command = 'call RemoveTrailingWhitespacesFunction()'
})

