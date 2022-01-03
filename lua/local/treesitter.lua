local ok, config = pcall(require, "nvim-treesitter.configs")
if not ok then
    print "Plugin treesitter not found"
    return
end

config.setup({
    ensure_installed = "maintained",
    sync_install = false,
    ignore_install = {},
    highlight = {
        enable = true,
        disable = {},
        additional_vim_regex_highlight = true,
    },
    indent = {
        enable = true,
        disable = {},
    },
    autopairs = {
        enable = true,
    },
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },
})
