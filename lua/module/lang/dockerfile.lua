local M = {}

M.setup = function()
    local lspconfig =  require("lspconfig")
    lspconfig['dockerfile'].setup{
        on_attach = M.on_attach
    }
end
M.on_attach = function(client, bufnr)
    require("module.lsp.format").setup(client, bufnr)
    require("module.lsp.key").setup(client, bufnr)
end

return M
