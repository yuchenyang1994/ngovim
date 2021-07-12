local M = {}

function M.format()
  if O.autoformat then
    vim.lsp.buf.formatting_sync()
  end
end

function M.setup(client, buf)
  if client.resolved_capabilities.document_formatting then
    vim.cmd([[
      augroup LspFormat
        autocmd! * <buffer>
        autocmd BufWritePre <buffer> lua require("module.lsp.format").format()
      augroup END
    ]])
  end
end

return M
