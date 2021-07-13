local M = {}

M.setup = function()
  local lspconfig = require('lspconfig')
  lspconfig['bash'].setup {
    on_attach = M.on_attach,
    filetypes = { "sh", "zsh" },
  }
  lspconfig.efm.setup {
    -- init_options = {initializationOptions},
    init_options = { documentFormatting = true, codeAction = false },
    root_dir = require("lspconfig").util.root_pattern(".git/"),
    filetypes = { "zsh" },
    settings = {
      rootMarkers = { ".git/" },
      languages = {
        sh = {},
      },
    },
  }
end

M.on_attach = function(client, bufnr)
    require("module.lsp.format").setup(client, bufnr)
    require("module.lsp.key").setup(client, bufnr)
end

return M
