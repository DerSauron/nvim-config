-- auto install packer
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = vim.fn.system({
        'git',
        'clone',
        '--depth',
        '1',
        'https://github.com/wbthomason/packer.nvim',
        install_path
    })
end

-- auto reload packer when update this file
vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]])

-- plugin definitions
local ok, packer = pcall(require, 'packer')
if not ok then
    return
end

return packer.startup(function(use)
    -- bare minimum
    use { 'wbthomason/packer.nvim' }
    use { 'nvim-lua/plenary.nvim' }

    -- decoration
    use { 'Mofiqul/dracula.nvim'}
    use { 'kyazdani42/nvim-web-devicons' }
    use { 'nvim-lualine/lualine.nvim' }

    -- utilities
    use { 'kyazdani42/nvim-tree.lua' }
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use { 'jiangmiao/auto-pairs' }
    use { 'ap/vim-css-color' }

    -- telescope
    use { 'nvim-telescope/telescope.nvim' }
    use { 'nvim-telescope/telescope-fzy-native.nvim' }

    -- lsp
    use { 'neovim/nvim-lspconfig' }
    use { 'williamboman/nvim-lsp-installer' }
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

    if PACKER_BOOTSTRAP then
        packer.sync()
    end
end)
