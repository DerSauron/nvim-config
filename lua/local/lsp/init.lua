local ok, _ = pcall(require, "lspconfig")
if not ok then
    print "Plugin lspconfig not found"
    return
end

require("local.lsp.installer")
require("local.lsp.modules.handlers").setup()
