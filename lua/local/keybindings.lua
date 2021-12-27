-- Remap space as leader key
nmap("<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Move text up and down
nmap("<A-j>", "<Esc>:m .+1<CR>==gi")
nmap("<A-k>", "<Esc>:m .-2<CR>==gi")
vmap("<A-j>", ":m .+1<CR>==")
vmap("<A-k>", ":m .-2<CR>==")
vmap("p", '"_dP')

-- chad tree
nmap('<leader>e', '<cmd>NvimTreeToggle<CR>')

-- telescope
nmap('<leader>ff', '<cmd>Telescope find_files<cr>')
nmap('<leader>fg', '<cmd>Telescope live_grep<cr>')
nmap('<leader>fb', '<cmd>Telescope buffers<cr>')
nmap('<leader>fh', '<cmd>Telescope help_tags<cr>')

-- terminal
tmap('<ESC>', '<C-\\><C-n>')
