local M = {}
local black = { formatCommand = "black --quiet -", formatStdin = true }

M.setup = function()
    require("lspconfig").efm.setup {
        init_options = { documentFormatting = true, codeAction = false },
        root_dir = require("lspconfig").util.root_pattern(".git/", "requirements.txt"),
        filetypes = { "python" },
        settings = {
            rootMarkers = { ".git/", "requirements.txt" },
            languages = {
              python = {black},
            },
        },
    }
    require("lspconfig")['python'].setup {
        on_attach = M.on_attach,
        settings = {
            python = {
                analysis = {
                    typeCheckingMode = O.lang.python.analysis.type_checking,
                    autoSearchPaths = O.lang.python.analysis.auto_search_paths,
                    useLibraryCodeForTypes = O.lang.python.analysis.use_library_code_types,
                },
            },
        },
    }
end
M.on_attach = function(client, bufnr)
    require("module.lsp.format").setup(client, bufnr)
    require("module.lsp.key").setup(client, bufnr)
end

return M
