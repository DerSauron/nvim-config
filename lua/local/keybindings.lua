-- Remap space as leader key
nmap("<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Clipboard
vmap("<C-A-y>", "\"+y")
vmap("<C-A-p>", "\"+p")

-- Move text up and down
nmap("<A-j>", "<Cmd>m .+1<CR>==")
nmap("<A-k>", "<Cmd>m .-2<CR>==")
vmap("<A-j>", "<Cmd>m .+1<CR>==gv")
vmap("<A-k>", "<Cmd>m .-2<CR>==gv")

-- Visual indent fix
vmap("<", "<gv")
vmap(">", ">gv")
vmap("=", "=gv")

-- Really delete
nmap("<Leader>dw", "\"_dw")
nmap("<Leader>dd", "\"_dd")

-- commenting
nmap("<Leader>/", "<Cmd>lua require(\"Comment\").toggle()<CR>")
vmap("<Leader>/", "<Cmd>lua require(\"Comment.api\").gc(vim.fn.visualmode())")

-- nvim tree
nmap("<Leader>e", "<Cmd>NvimTreeToggle<CR>")

-- telescope
nmap("<Leader>ff", "<Cmd>Telescope find_files<CR>")
nmap("<Leader>fg", "<Cmd>Telescope live_grep<CR>")
nmap("<Leader>fb", "<Cmd>Telescope buffers<CR>")
nmap("<Leader>fh", "<Cmd>Telescope help_tags<CR>")

-- terminal
tmap("<ESC>", "<C-\\><C-n>")
