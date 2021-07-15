local M = {}

M.setup = function()
  local lspconfig = require('lspconfig')
  lspconfig['bash'].setup {
    on_attach = M.on_attach,
    filetypes = { "sh", "zsh" },
  }
end

M.on_attach = function(client, bufnr)
    require("module.lsp.format").setup(client, bufnr)
    require("module.lsp.key").setup(client, bufnr)
end

return M
