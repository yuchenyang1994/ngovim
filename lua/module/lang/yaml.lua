local M = {}

M.setup = function()
require("lspconfig")['yaml'].setup {}
end
M.on_attach = function(client, bufnr)
    require("module.lsp.format").setup(client, bufnr)
    require("module.lsp.key").setup(client, bufnr)
end

return M
