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
  vim.g.dashboard_custom_section = {
    a = {
      description = { "  Find File          " },
      command = "Telescope find_files",
    },
    b = {
      description = { "  Recently Used Files" },
      command = "Telescope oldfiles",
    },
    c = { 
      description = { "冷  Find Project      " },
      command = "lua require'telescope'.extensions.project.project{}",
    },
    d = {
      description = { "  Find Mark          " },
      command = "Telescope marks",
    },
  }
end

return M
