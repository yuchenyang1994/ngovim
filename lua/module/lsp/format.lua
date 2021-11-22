local M = {}

function M.format()
    vim.lsp.buf.formatting_sync()
end

function M.setup(client, buf)
    vim.cmd([[
      augroup LspFormat
        autocmd! * <buffer>
        autocmd BufWritePre <buffer> lua require("module.lsp.format").format()
      augroup END
    ]])
end

return M
