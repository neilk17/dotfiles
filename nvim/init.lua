require("config.lazy")

-- Indentation settings
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.softtabstop = 2

-- Enable word wrap
vim.wo.wrap = true

-- Set wrap options to wrap at words
vim.wo.linebreak = true

-- Auto-enable ZenMode on startup
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.cmd("ZenMode")
  end,
})

-- Setup custom print date function
function print_today_date()
	local date = os.date("date: %Y-%m-%d")
	vim.api.nvim_put({ date }, "c", true, true)
end

vim.api.nvim_create_user_command("PrintDate", print_today_date, {})

-- Use 'gj' and 'gk' for moving down and up by displayed lines
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
vim.keymap.set("n", "<leader>d", ":PrintDate<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>z", ":ZenMode<CR>", {silent=true})
vim.keymap.set("n", "<leader>qq", ":wq!<CR>", {})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
