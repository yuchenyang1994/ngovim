CONFIG_PATH = vim.fn.stdpath "config"
DATA_PATH = vim.fn.stdpath "data"
CACHE_PATH = vim.fn.stdpath "cache"
TERMINAL = vim.fn.expand "$TERMINAL"

O = {
    theme = "tokyonight",
    vnsip_dir = vim.fn.stdpath "config" .. "/snippets",
    lang = {},
}
