local wk_ok, whichkey = pcall(require, "which-key")
if not wk_ok then
    print("Plugin which-key not found")
    return
end

whichkey.setup({
    window = {
        border = "single"
    }
})
