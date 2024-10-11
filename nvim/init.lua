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

-- Use 'gj' and 'gk' for moving down and up by displayed lines
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

local print_date = require("print_date")

vim.api.nvim_create_user_command("PrintDate", print_date.print_today_date, {})

vim.api.nvim_set_keymap("n", "<leader>d", ":PrintDate<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>qq", ":wq<CR>", {})
