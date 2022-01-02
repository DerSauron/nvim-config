local ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not ok then
    print "Plugin lsp-installer not found"
    return
end

lsp_installer.on_server_ready(function(server)
    local handlers = require("local.lsp.handlers")

    local opts = {
        on_attach = handlers.on_attach,
        capabilities = handlers.capabilities,
        flags = handlers.flags
    }

    local ok, server_opts = pcall(require, "local.lsp.configs." .. server.name)
    if ok then
        opts = vim.tbl_deep_extend("force", server_opts, opts)
    end

    server:setup(opts)
end)
