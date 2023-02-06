-- empty setup using defaults
require("nvim-tree").setup()

vim.api.nvim_set_keymap("n", "<leader>b", ":NvimTreeToggle<cr>" ,{silent = true, noremap = true})
