local M = {}

M.setup = function()
    local lspconfig =  require("lspconfig")
    lspconfig['dockerfile'].setup{}
end
M.on_attach = function(client, bufnr)
end

return M
