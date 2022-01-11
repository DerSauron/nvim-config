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

    local ook, server_opts = pcall(require, "local.lsp.configs." .. server.name)
    if ook then
        opts = vim.tbl_deep_extend("force", server_opts, opts)
    end

    local eok, env_server_opts = pcall(require, "env.lsp." .. server.name)
    if eok then
        opts = vim.tbl_deep_extend("force", env_server_opts, opts)
    end

    server:setup(opts)
end)
