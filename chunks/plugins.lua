local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    packer_bootstrap = vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

local packer = require('packer')

return packer.startup(function(use)
    use { 'wbthomason/packer.nvim' }

    -- decoration
    use { 'Mofiqul/dracula.nvim'}
    use { 'kyazdani42/nvim-web-devicons' }
    use { 'nvim-lualine/lualine.nvim' }

    -- utilities
    use { 'ms-jpq/chadtree', branch = 'chad', run = ':CHADdeps' }
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use { 'jiangmiao/auto-pairs' }
    use { 'ap/vim-css-color' }

    -- telescope
    use { 'nvim-lua/plenary.nvim' }
    use { 'nvim-telescope/telescope.nvim' }
    use { 'nvim-telescope/telescope-fzy-native.nvim' }

    -- lsp
    use { 'neovim/nvim-lspconfig' }
    use { 'glepnir/lspsaga.nvim' }

    -- code completion
    use { 'hrsh7th/cmp-nvim-lsp' }
    use { 'hrsh7th/cmp-buffer' }
    use { 'hrsh7th/cmp-path' }
    use { 'hrsh7th/cmp-cmdline' }
    use { 'hrsh7th/nvim-cmp' }
    use { 'hrsh7th/cmp-vsnip' }
    use { 'hrsh7th/vim-vsnip' }
    use { 'ray-x/lsp_signature.nvim' }

    -- git
    use { 'lewis6991/gitsigns.nvim' }

    if packer_bootstrap then
        packer.sync()
    end
end)
