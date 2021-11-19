local wk = require('which-key')

local M = {}

M.on_attach = function(client, bufnr)
    require("module.lsp.format").setup(client, bufnr)
    require("module.lsp.key").setup(client, bufnr)
    vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').goimport() ]], false)
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
    require('go').setup()
end

return M
