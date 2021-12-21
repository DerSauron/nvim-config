vim.o.encoding = 'utf-8'
vim.o.clipboard = 'unnamedplus'
vim.o.cursorline = true
vim.o.hidden = true -- Allow modified buffers in background
vim.o.inccommand = 'split' -- Show replacements before applieng
-- vim.o.mouse=a
vim.o.number = true
vim.o.signcolumn = 'yes'
vim.o.relativenumber = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.title = true
vim.o.ttimeoutlen = 0 -- Command timeout
vim.o.wildmenu = true -- Auto complete menu
vim.o.wrap = false
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.scrolloff = 3
vim.o.ruler = true
vim.o.undofile = true; vim.bo.undofile = true
vim.o.path = vim.o.path .. '.,**'

vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
-- vim.o.whichwrap+=<,>,[,]

vim.o.list = true
-- vim.o.listchars = {tab = '→\\ ', nbsp = '␣', trail = '•', extends = '⟩', precedes = '⟨'}
--  vim.o.listchars = { tab = '→ ' }
-- vim.o.listchars = { trail = '1' }
