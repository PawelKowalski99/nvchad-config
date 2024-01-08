
local python_indent = vim.api.nvim_create_augroup('python_indent', {clear = true})


vim.api.nvim_create_autocmd('FileType', {
  pattern = 'python',
  group = python_indent,
  command = 'set autoindent',
})
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'python',
  group = python_indent,
  command = 'set noexpandtab',
})
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'python',
  group = python_indent,
  command = 'set tabstop=4',
})
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'python',
  group = python_indent,
  command = 'set shiftwidth=4',
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'python',
  group = python_indent,
  command = 'set list',
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'python',
  group = python_indent,
  command = 'set listchars=space:␣,tab:-> ',
})


  -- autocmd!
  -- autocmd FileType python set cursorline                              " shows line under the cursor's line
  -- autocmd FileType python set autoindent                              " indent when moving to the next line while writing code
  -- autocmd FileType python set noexpandtab                               " expand spaces into tab
  -- autocmd FileType python set tabstop=4                               " 4 whitespaces for tabs visual presentation
  -- autocmd FileType python set shiftwidth=4   
  -- autocmd FileType python set list
  -- autocmd FileType python set listchars=space:␣,tab:-> 
