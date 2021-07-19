local go = require('go')
local wk = require('which-key')
local lspconfig = require('lspconfig')

local M = {}

M.on_attach = function(client, bufnr)
    require("module.lsp.format").setup(client, bufnr)
    require("module.lsp.key").setup(client, bufnr)
    local keymap = {
        m = {
            name = "Mode",
            a = {
                name = "Tag",
                t = {"<cmd>GoAddTags<CR>", "Add Tag"},
                r = {"<cmd>GoRemoveTags<CR>", "Remove Tag"},
                c = {"<cmd>GoClearTags<CR>", "Clear Tag"}
            },
            t = {
                name = "Test",
                t = {"<cmd>GoTestFile<CR>", "Test File"},
                f = {"<cmd>GoTestFunc<CR>", "Test Func"},
                a = {"<cmd>GoTestAll", "Test All"}
            },
            i = {"<cmd>GoImport<CR>", "Go Import"}
        }
    }
    wk.register(keymap, {buffer = bufnr, prefix="<leader>", mode="n"})
end

M.setup = function()
    go.setup{
        auto_format = true,
        auto_lint = true,
        -- linters: golint, errcheck, staticcheck, golangci-lint
        linter = 'golint',
        -- lint_prompt_style: qf (quickfix), vt (virtual text)
        lint_prompt_style = 'vt',
        -- formatter: goimports, gofmt, gofumpt
        formatter = 'goimports',
        -- test flags: -count=1 will disable cache
        test_flags = {'-v'},
        test_timeout = '30s',
        test_env = {},
        -- show test result with popup window
        test_popup = true,
        -- struct tags
        tags_name = 'json',
        tags_options = {},
        tags_transform = 'snakecase',
        tags_flags = {'-skip-unexported'},
        -- quick type
        quick_type_flags = {'--just-types'},
    }
    lspconfig['go'].setup{
        on_attach = M.on_attach,
    }
end

return M
