require("config.lazy")

-- Indentation settings
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.softtabstop = 2

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- import your plugins
		{
			"folke/zen-mode.nvim",
			config = function()
				require("zen-mode").setup({
					window = {
						width = 90,
						options = {
							number = false,
							relativenumber = false,
						},
					},
				})
				-- Key mapping to toggle Zen Mode
				vim.keymap.set("n", "<leader>z", ":ZenMode<CR>", { silent = true })
			end,
		},
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	-- automatically check for plugin updates
	checker = { enabled = true },
})

-- Enable word wrap
vim.wo.wrap = true

-- Set wrap options to wrap at words
vim.wo.linebreak = true

-- Use 'gj' and 'gk' for moving down and up by displayed lines
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

local print_date = require('print_date')

vim.api.nvim_create_user_command('PrintDate', print_date.print_today_date, {})

vim.api.nvim_set_keymap('n', '<leader>d', ':PrintDate<CR>', {noremap=true, silent=true})
