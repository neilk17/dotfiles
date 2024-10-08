local M = {}

function M.print_today_date()
  local date = os.date("date: %Y-%m-%d")
  vim.api.nvim_put({date}, 'l', true, true)
end

return M
