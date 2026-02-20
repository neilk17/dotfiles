require("config.lazy")

-- Indentation settings
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.softtabstop = 2

-- Enable word wrap at word boundaries
vim.wo.wrap = true
vim.wo.linebreak = true

-- Spell check
vim.opt.spell = true
vim.opt.spelllang = { "en_us" }

-- Auto-save on leaving insert mode or changing text
vim.api.nvim_create_autocmd({ "TextChanged", "InsertLeave" }, {
	pattern = "*",
	command = "silent! write",
})

-- Auto-enable ZenMode on startup
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		vim.cmd("ZenMode")
	end,
})

-- Set up cursor that works well with WezTerm
vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50"

-- Insert today's date
function print_today_date()
	local date = os.date("date: %Y-%m-%d")
	vim.api.nvim_put({ date }, "c", true, true)
end
vim.api.nvim_create_user_command("PrintDate", print_today_date, {})

-- Toggle between Rose Pine light (dawn) and dark (main)
function toggle_theme()
	local rp = require("rose-pine")
	if vim.o.background == "dark" then
		rp.setup({ variant = "dawn", styles = { italic = false } })
		vim.cmd("colorscheme rose-pine")
	else
		rp.setup({ variant = "main", styles = { italic = false } })
		vim.cmd("colorscheme rose-pine")
	end
end
vim.api.nvim_create_user_command("ToggleTheme", toggle_theme, {})

-- Keymaps
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
vim.keymap.set("n", "<leader>d", ":PrintDate<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>z", ":ZenMode<CR>", { silent = true })
vim.keymap.set("n", "<leader>t", ":ToggleTheme<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>qq", ":wq!<CR>", {})

-- Word count
vim.keymap.set("n", "<leader>wc", function()
	local words = vim.fn.wordcount().words
	print("Word count: " .. words)
end, { desc = "Word count" })

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
