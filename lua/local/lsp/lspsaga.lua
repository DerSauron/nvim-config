local lsok, lspsaga = pcall(require, "lspsaga")
if not lsok then
    print("Plugin lspsaga not found")
    return
end

lspsaga.init_lsp_saga()
