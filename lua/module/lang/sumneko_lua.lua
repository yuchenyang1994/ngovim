
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local M = {
    settings = {
        Lua = {
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'},
            },
            runtime = {
                version = 'LuaJIT',
                path = runtime_path,
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
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
