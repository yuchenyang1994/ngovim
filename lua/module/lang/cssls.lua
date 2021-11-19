local capabilities = vim.lsp.protocol.make_client_capabilities()

local M = {
    filetypes = {
        "css",
        "scss",
        "less",
        "postcss"
    },
    capabilities = capabilities,
}

M.on_attach = function(client, bufnr)
    require("module.lsp.format").setup(client, bufnr)
    require("module.lsp.key").setup(client, bufnr)
end

return M
