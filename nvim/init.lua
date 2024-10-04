-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

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
	install = { colorscheme = { "habamax" } },
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
