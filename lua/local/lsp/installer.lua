local lsp_installer = require("nvim-lsp-installer")

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
