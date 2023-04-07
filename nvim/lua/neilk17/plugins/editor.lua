return {
	{
		'nvim-lua/plenary.nvim',
	},
	{
	'nvim-telescope/telescope.nvim', 
	version = false,
	tag = '0.1.1',
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", 
		desc = "[F]ind [F]iles" },
		{"<leader>fb", "<cmd>Telescope buffers<cr>",
		desc="[F]ind [B]uffers"},
		{"<leader>sg", "<cmd>Telescope live_grep<cr>",
		desc="[S]earch [G]rep"},
		{"<leader>fh", "<cmd>Telescope help_tags<cr>",
		desc="[F]ind [H]elp"},
		{"<leader>/", "<cmd>Telescope git_files<cr>",
		desc="[/] Git files"},
	},
	},
	{
	'tpope/vim-fugitive',
	},
    {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup({
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            })
        end,
    }
}
