local M = {}

M.setup = function()
    local luadev = require('lua-dev')
    local lspconfig = require("lspconfig")
    local luadev_config = luadev.setup({
        lspconfig = {
            on_attach = M.on_attach
        }
    })
    lspconfig['lua'].setup(luadev_config)
end

M.on_attach = function(client, bufnr)
    require("module.lsp.format").setup(client, bufnr)
    require("module.lsp.key").setup(client, bufnr)
end

return M
