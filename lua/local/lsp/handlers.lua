local M = {}

-- TODO: backfill this to template
M.setup = function()
    local signs = {
        { name = "DiagnosticSignError", text = "" },
        { name = "DiagnosticSignWarn", text = "" },
        { name = "DiagnosticSignHint", text = "" },
        { name = "DiagnosticSignInfo", text = "" },
    }

    for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
    end

    local config = {
        -- disable virtual text
        virtual_text = true,
        -- show signs
        signs = {
            active = signs,
        },
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = {
            focusable = false,
            style = "minimal",
            border = "rounded",
            source = "always",
            header = "",
            prefix = "",
        },
    }

    vim.diagnostic.config(config)

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "rounded",
    })

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "rounded",
    })
end

local function lsp_highlight_document(client)
    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec(
        [[
            augroup lsp_document_highlight
                autocmd! * <buffer>
                autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
                autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()
                autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
            augroup END
        ]],
        false
        )
    end
end

local function lsp_keymaps(client, bufnr)
    local set_keymap = vim.api.nvim_buf_set_keymap

    local opts = { noremap = true, silent = true }

    set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    -- set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    -- set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    -- set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    -- set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    -- set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    -- set_keymap(bufnr, "n", "[d", "<cmd>lua vim.diagnostic.goto_prev({ border = 'rounded' })<CR>", opts)
    -- set_keymap(bufnr, "n", "]d", "<cmd>lua vim.diagnostic.goto_next({ border = 'rounded' })<CR>", opts)
    -- set_keymap(bufnr, "n", "gl", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ border = 'rounded' })<CR>", opts)

    if client.resolved_capabilities.document_formatting then
        set_keymap(bufnr, "n", "<C-f>", "<Cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    else
        set_keymap(bufnr, "n", "<C-f>", "<Cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
    end

    set_keymap(bufnr, "n", "gh", "<Cmd>lua require('lspsaga.provider').lsp_finder()<CR>", opts)
    set_keymap(bufnr, "n", "<Leader>ca", "<Cmd>lua require('lspsaga.codeaction').code_action()<CR>", opts)
    set_keymap(bufnr, "x", "<Loader>ca", ":<C-u>lua require('lspsaga.codeaction').range_code_action()<CR>", opts)
    set_keymap(bufnr, "n", "K", "<Cmd>lua require('lspsaga.hover').render_hover_doc()<CR>", opts)
    set_keymap(bufnr, "n", "<C-f>", "<Cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", opts)
    set_keymap(bufnr, "n", "<C-f>", "<Cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", opts)
    set_keymap(bufnr, "n", "<C-k>", "<Cmd>lua require('lspsaga.signatureHelp').signature_help()<CR>", opts)
    set_keymap(bufnr, "n", "<Leader>rn", "<Cmd>lua require('lspsaga.rename').rename()<CR>", opts)
    set_keymap(bufnr, "n", "pd", "<Cmd>lua require('lspsaga.provider').preview_definition()<CR>", opts)
    set_keymap(bufnr, "n", "<Leader>cl", "<Cmd>lua require('lspsaga.diagnostic').show_line_diagnostics()<CR>", opts)
    set_keymap(bufnr, "n", "<Leader>cc", "<Cmd>lua require('lspsaga.diagnostic').show_cursor_diagnostic()<CR>", opts)
    set_keymap(bufnr, "n", "[d", "<Cmd>lua require('lspsaga.diagnostic').navigate('prev')<CR>", opts)
    set_keymap(bufnr, "n", "]d", "<Cmd>lua require('lspsaga.diagnostic').navigate('next')<CR>", opts)
end

M.on_attach = function(client, bufnr)
    lsp_keymaps(client, bufnr)
    lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
    return
end

M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

M.flags = {
    debounce_text_changes = 150,
}

return M
