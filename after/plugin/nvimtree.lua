-- empty setup using defaults
require("nvim-tree").setup()

vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeToggle<cr>" ,{silent = true, noremap = true})
