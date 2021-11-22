local M = {
    settings={
        stylelintplus = {
            autoFixOnFormat=true,

        }
    }
}

M.on_attach = function(client, bufnr)
    require("module.lsp.format").setup(client, bufnr)
    require("module.lsp.key").setup(client, bufnr)
end

return M


