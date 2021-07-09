local M = {}

M.config = function ()
  vim.g.dashboard_disable_at_vimenter = 0
  vim.g.dashboard_custom_header = {
    "███╗   ██╗ ██████╗  ██████╗ ██╗   ██╗██╗███╗   ███╗",
    "████╗  ██║██╔════╝ ██╔═══██╗██║   ██║██║████╗ ████║",
    "██╔██╗ ██║██║  ███╗██║   ██║██║   ██║██║██╔████╔██║",
    "██║╚██╗██║██║   ██║██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
    "██║ ╚████║╚██████╔╝╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
    "╚═╝  ╚═══╝ ╚═════╝  ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
  }
  vim.g.dashboard_default_executive = "telescope"
  vim.g.dashboard_enable_session = 0
  vim.g.dashboard_disable_statusline = 0
end

return M