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
	keys = {
		{"<leader>gs", "<cmd>Git<cr>",
		desc = "[G]it status",
		}
	}
	},
}
