local ok, lualine = pcall(require, "lualine")
if not ok then
    print "Plugin lualine not found"
    return
end

lualine.setup({
    options = {
        theme = "dracula-nvim"
    }
})
