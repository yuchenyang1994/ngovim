local wk = require("which-key")

local M = {}

function M.setup(client, bufnr)
    local keymap = {
        c = {
            name = "Code",
            r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
            a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action" },
            d = { "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", "Line Diagnostics" },
            l = {
                name = "LSP",
                i = { "<cmd>LspInfo<cr>", "Lsp Info" },
                a = { "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", "Add Folder" },
                r = { "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", "Remove Folder" },
                l = { "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", "List Folders" },
            },
            x = {
                name = "Error",
                s = { "<cmd>Telescope lsp_document_diagnostics<cr>", "Search Document Diagnostics" },
                w = { "<cmd>Telescope lsp_workspace_diagnostics<cr>", "Workspace Diagnostics" },
            },
            g = {
                name = "Goto",
                r = { "<cmd>Telescope lsp_references<cr>", "References" },
                d = { "<Cmd>lua vim.lsp.buf.definition()<CR>", "Goto Definition" },
                D = { "<Cmd>vsplit | lua vim.lsp.buf.definition()<CR>", "Goto Definition" },
                s = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature Help" },
                i = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Goto Implementation" },
                t = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Goto Type Definition" },
            },
            h = { "<cmd>vim.lsp.buf.hover()<CR>", "Hover"},
            f = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "Format Document" },
        },
  }
  local keymap_visual = {
    c = {
      name = "+code",
      a = { ":<C-U>lua vim.lsp.buf.range_code_action()<CR>", "Code Action" },
    },
  }
  vim.cmd "nnoremap <silent> <C-p> :lua vim.lsp.diagnostic.goto_prev()<CR>"
  vim.cmd "nnoremap <silent> <C-n> :lua vim.lsp.diagnostic.goto_next()<CR>"
  keymap_visual.c.f = { "<cmd>lua vim.lsp.buf.range_formatting()<CR>", "Format Range" }
  wk.register(keymap, { buffer = bufnr, prefix = "<leader>", mode="n" })
  wk.register(keymap_visual, { buffer = bufnr, prefix = "<leader>", mode = "v" })
end

return M
