vim.opt.encoding = "utf-8"
-- vim.opt.clipboard = "unnamedplus"
vim.opt.cursorline = true
vim.opt.hidden = true -- Allow modified buffers in background
vim.opt.inccommand = "split" -- Show replacements before applieng
-- vim.opt.mouse=a
vim.opt.number = true
vim.opt.signcolumn = "yes"
vim.opt.relativenumber = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.title = true
vim.opt.ttimeoutlen = 0 -- Command timeout
vim.opt.updatetime = 400
vim.opt.wildmenu = true -- Auto complete menu
vim.opt.wrap = false
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.scrolloff = 4
vim.opt.ruler = true
vim.opt.undofile = true; vim.bo.undofile = true
vim.opt.path:append(".,**")

vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
-- vim.opt.whichwrap+=<,>,[,]

vim.opt.list = true
vim.opt.listchars = {tab = "→ ", nbsp = "␣", trail = "•", extends = "⟩", precedes = "⟨"}

vim.opt.completeopt = { "menu", "menuone", "noselect" }

vim.opt.colorcolumn = { 120 }
