vim.g.mapleader = " "
vim.keymap.set("n", "<leader>-", vim.cmd.Ex)
vim.keymap.set("n", "<leader>qq", ":wq!<CR>")
vim.keymap.set("n", "<C-s>", ":w<CR>")

-- To copy to system clipboard
vim.keymap.set('v', '<leader>c', '"+y', {noremap = true, silent = true})

