vim.g.mapleader = " "
vim.keymap.set("n", "<leader>-", vim.cmd.Ex)
vim.keymap.set("n", "<leader>qq", ":wq!<CR>")
vim.keymap.set("n", "<leader>qq", ":wq!<CR>")
vim.keymap.set("n", "<C-s>", ":w<CR>")

-- To copy to system clipboard
vim.keymap.set('v', '<leader>c', '"+y', {noremap = true, silent = true})


require("which-key").setup({
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    require("which-key").register({
        f = {
            name = "+file",
        },
        g = {
            name = "+git",
            s = { "<cmd>Git<cr>", "[G]it status"},
        },
        l = { "<cmd>Lazy<cr>", "[L]azy" }
    }, { prefix = "<leader>" })
})
