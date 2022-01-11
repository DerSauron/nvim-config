-- auto install packer
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    print("Installing packer")
    vim.fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
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
local ok, packer = pcall(require, "packer")
if not ok then
    print("Plugin packer not found")
    return
end

local initial_sync = function()
    local plenary_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/plenary.nvim"
    if vim.fn.empty(vim.fn.glob(plenary_path)) > 0 then
        packer.sync()
    end
end

return packer.startup(function(use)
    -- bare minimum
    use { "wbthomason/packer.nvim" }
    use { "nvim-lua/plenary.nvim" }

    -- decoration
    use { "Mofiqul/dracula.nvim"}
    use { "kyazdani42/nvim-web-devicons" }
    use { "nvim-lualine/lualine.nvim" }

    -- utilities
    use { "kyazdani42/nvim-tree.lua" }
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
    use { "windwp/nvim-autopairs" }
    use { "ap/vim-css-color" }
    use { "tpope/vim-abolish" }

    -- telescope
    use { "nvim-telescope/telescope.nvim" }
    use { "nvim-telescope/telescope-fzy-native.nvim" }

    -- lsp
    use { "neovim/nvim-lspconfig" }
    use { "williamboman/nvim-lsp-installer" }
    use { "jose-elias-alvarez/null-ls.nvim" }

    -- code completion
    use { "hrsh7th/cmp-nvim-lsp" }
    use { "hrsh7th/cmp-nvim-lua" }
    use { "hrsh7th/cmp-buffer" }
    use { "hrsh7th/cmp-path" }
    use { "hrsh7th/cmp-cmdline" }
    use { "hrsh7th/nvim-cmp" }
    use { "L3MON4D3/LuaSnip" }
    use { "saadparwaiz1/cmp_luasnip" }
    use { "rafamadriz/friendly-snippets" }
    use { "ray-x/lsp_signature.nvim" }
    use { "numToStr/Comment.nvim" }
    use { "JoosepAlviste/nvim-ts-context-commentstring" }

    -- git
    use { "lewis6991/gitsigns.nvim" }


    -- load plugins from local environment
    local lpok, local_plugins = pcall(require, "env.local_plugins")
    if lpok and type(local_plugins) == "table" then
        pcall(local_plugins.setup, use)
    end

    initial_sync()
end)
