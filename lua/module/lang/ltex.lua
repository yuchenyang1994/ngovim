local M = {
    filetypes = { "bib", "markdown", "org", "plaintex", "rst", "rnoweb", "tex" },
}

M.on_attach = function(client, bufnr)
    require("module.lsp.format").setup(client, bufnr)
    require("module.lsp.key").setup(client, bufnr)
end

return M
