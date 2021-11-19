
local lspconfig = require("lspconfig")
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local M = {
    settings = {
        Lua = {
            globals = {'vim'},
            runtime = {
                version = 'LuaJIT',
                path = runtime_path,
            },
            telemetry = {
                enable = false,
            },
        }
    }
}


M.on_attach = function(client, bufnr)
    require("module.lsp.format").setup(client, bufnr)
    require("module.lsp.key").setup(client, bufnr)
end

return M
