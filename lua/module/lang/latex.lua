local M = {}

M.setup = function()
    local lspconfig = require("lspconfig")
    lspconfig['latex'].setup({})
end
M.keymap = function()
end

return M
