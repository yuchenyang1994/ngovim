local go = require('go')
local wk = require('which-key')
local lspconfig = require('lspconfig')

local M = {}

M.on_attach = function(client, bufnr)
    vim.cmd([[
        augroup LspFormat
          autocmd! * <buffer>
          autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil,500)
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
            i = {"<cmd>GoImport<CR>", "Go Import"},
            c = {"<cmd>GoCmt<CR>", "Go Comment"},
            f = {"<cmd>Gfstruct<CR>", "Fill Struct"},

        }
    }
    wk.register(keymap, {buffer = bufnr, prefix="<leader>", mode="n"})
end

M.setup = function()
    go.setup{}
    lspconfig['go'].setup{
        on_attach = M.on_attach,
    }
end

return M
