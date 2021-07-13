local M = {}

M.setup = function()
require("lspconfig")['yaml'].setup {}
end
M.on_attach = function(client, bufnr)
end

return M
