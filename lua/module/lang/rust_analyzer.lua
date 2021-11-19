local wk = require('which-key')
local M = {}
M.on_attach = function(client, bufnr)
    require("module.lsp.format").setup(client, bufnr)
    require("module.lsp.key").setup(client, bufnr)
    local keymap = {
        m = {
            name = "Mode",
            h = {"<cmd>RustToggleInlayHints<CR>", "Toggle Inlay Hints"},
            r = {"<cmd>RustRunnables<CR>", "Runnables"},
            e = {"<cmd>RustExpandMacro<CR>", "Expand Macro"},
            c = {"<cmd>RustOpenCargo<CR>", "Open Cargo"},
            p = {"<cmd>RustParentModule<CR>", "Parent Module"},
            l = {"<cmd>RustJoinLines<CR>", "Join Lines"}
        }
    }
    wk.register(keymap, {buffer = bufnr, prefix="<leader>", mode="n"})
    require("rust-tools").setup({})
end

return M
