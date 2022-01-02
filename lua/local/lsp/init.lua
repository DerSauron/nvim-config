local ok, _ = pcall(require, "lspconfig")
if not ok then
    print "Plugin lspconfig not found"
    return
end

local handlers = require("local.lsp.handlers")

require("local.lsp.installer")
require("local.lsp.null-ls")

handlers.setup()
