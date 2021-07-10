local status_ok, dap = pcall(require, "dap")
if not status_ok then
  return
end
-- require "dap"
vim.fn.sign_define("DapBreakpoint", {
  text = "",
  texthl = "LspDiagnosticsSignError",
  linehl = "",
  numhl = "",
})
dap.defaults.fallback.terminal_win_cmd = "50vsplit new"
