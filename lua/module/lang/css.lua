local M = {}

M.setup = function()
    local lspconfig = require('lspconfig')
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    lspconfig['css'].setup {
        filetypes = {
            "css",
            "scss",
            "less",
            "postcss"
        },
        on_attach = M.on_attach,
        capabilities = capabilities,
    }
end

M.on_attach = function(client, bufnr)
    require("module.lsp.format").setup(client, bufnr)
    require("module.lsp.key").setup(client, bufnr)
end

return M