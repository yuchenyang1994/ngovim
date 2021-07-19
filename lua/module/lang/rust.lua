local wk = require('which-key')
local M = {}

M.setup = function()
    local opts = {
        tools = { -- rust-tools options
            -- automatically set inlay hints (type hints)
            -- There is an issue due to which the hints are not applied on the first
            -- opened file. For now, write to the file to trigger a reapplication of
            -- the hints or just run :RustSetInlayHints.
            -- default: true
            autoSetHints = true,

            -- whether to show hover actions inside the hover window
            -- this overrides the default hover handler so something like lspsaga.nvim's hover would be overriden by this
            -- default: true
            hover_with_actions = true,

            -- These apply to the default RustRunnables command
            runnables = {
                -- whether to use telescope for selection menu or not
                -- default: true
                use_telescope = true

                -- rest of the opts are forwarded to telescope
            },

            -- These apply to the default RustSetInlayHints command
            inlay_hints = {
                -- wheter to show parameter hints with the inlay hints or not
                -- default: true
                show_parameter_hints = true,

                -- prefix for parameter hints
                -- default: "<-"
                parameter_hints_prefix = "<- ",

                -- prefix for all the other hints (type, chaining)
                -- default: "=>"
                other_hints_prefix = "=> ",

                -- whether to align to the lenght of the longest line in the file
                max_len_align = false,

                -- padding from the left if max_len_align is true
                max_len_align_padding = 1,

                -- whether to align to the extreme right or not
                right_align = false,

                -- padding from the right if right_align is true
                right_align_padding = 7
            },

            hover_actions = {
                -- the border that is used for the hover window
                -- see vim.api.nvim_open_win()
                border = {
                    {"╭", "FloatBorder"}, {"─", "FloatBorder"},
                    {"╮", "FloatBorder"}, {"│", "FloatBorder"},
                    {"╯", "FloatBorder"}, {"─", "FloatBorder"},
                    {"╰", "FloatBorder"}, {"│", "FloatBorder"}
                },

                -- whether the hover action window gets automatically focused
                -- default: false
                auto_focus = false
            }
        },
        server = {
            on_attach = M.on_attach
        }
    }
    require("rust-tools").setup(opts)
end

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
end

return M