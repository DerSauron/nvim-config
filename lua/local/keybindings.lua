-- Remap space as leader key
nmap("<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Clipboard
vmap("<C-A-y>", "\"+y")
vmap("<C-A-p>", "\"+p")

-- Move text up and down
nmap("<A-j>", "<cmd>m .+1<CR>==")
nmap("<A-k>", "<cmd>m .-2<CR>==")
vmap("<A-j>", "<cmd>m .+1<CR>==gv")
vmap("<A-k>", "<cmd>m .-2<CR>==gv")

-- Visual indent fix
vmap("<", "<gv")
vmap(">", ">gv")
vmap("=", "=gv")

-- chad tree
nmap("<leader>e", "<cmd>NvimTreeToggle<CR>")

-- telescope
nmap("<leader>ff", "<cmd>Telescope find_files<cr>")
nmap("<leader>fg", "<cmd>Telescope live_grep<cr>")
nmap("<leader>fb", "<cmd>Telescope buffers<cr>")
nmap("<leader>fh", "<cmd>Telescope help_tags<cr>")

-- terminal
tmap("<ESC>", "<C-\\><C-n>")
