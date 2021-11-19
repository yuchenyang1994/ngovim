local go = require('go')
local wk = require('which-key')
local lspconfig = require('lspconfig')

local M = {}

M.on_attach = function(client, bufnr)
    vim.cmd([[
        augroup LspFormat
          autocmd! * <buffer>
          autocmd BufWritePre <buffer> lua require('go.format').gofmt()
          autocmd BufWritePre <buffer> lua require('go.format').goimport()
    ]])
    require("module.lsp.key").setup(client, bufnr)
    local keymap = {
        m = {
            name = "Mode",
            a = {
                name = "Tag",
                t = {"<cmd>GoAddTag<CR>", "Add Tag"},
                r = {"<cmd>GoRmTag<CR>", "Remove Tag"},
            },
            t = {
                name = "Test",
                f = {"<cmd>GoTestFunc<CR>", "Test Func"},
                a = {"<cmd>GoAddTest<CR>", "Add Test"},
            },
            r = {"<cmd>GoRename<CR>", "GoRename"},
            i = {"<cmd>GoImport<CR>", "Go Import"},
            c = {"<cmd>GoCmt<CR>", "Go Comment"},
            f = {"<cmd>GoFillStruct<CR>", "Fill Struct"},

        }
    }
    wk.register(keymap, {buffer = bufnr, prefix="<leader>", mode="n"})
    go.setup{}
end

return M
