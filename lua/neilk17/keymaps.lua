local keymap = vim.keymap

-- Mappings
vim.g.mapleader = " "
-- leader 
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Remap for dealing with word wrap
keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- map mac command key + s to save file
keymap.set('n', '++', ':update<CR>')

-- Clear search with <esc>
keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

keymap.set('n', 'x', '"_x')
-- split window
keymap.set('n', '<leader>sv', '<C-w>v', { desc = "Split window vertical"})
keymap.set('n', '<leader>sp', '<C-w>h', { desc = "Split window horizontal"})
keymap.set('n', '<leader>sx', ':close<CR>', { desc = "Close window"})

-- Window navigation
keymap.set('n', '<C-h>', '<C-w>h', { desc = "Go to left window"})
keymap.set('n', '<C-j>', '<C-w>j', { desc = "Go to lower window"})
keymap.set('n', '<C-k>', '<C-w>k', { desc = "Go to upper window"})
keymap.set('n', '<C-l>', '<C-w>l', { desc = "Go to right window"})

-- Resize window using <ctrl> arrow keys
keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })
-- tabs
keymap.set('n', '<C-t>', ':tabnew<CR>')

-- move lines around
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- better 'J'
keymap.set("n", "J", "mzJ`z")

-- Paste over existing words
keymap.set("x", "<leader>p", "\"_dP")

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
keymap.set("n", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
keymap.set("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
keymap.set("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
keymap.set("n", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
keymap.set("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
keymap.set("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

-- better indenting
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- new file
keymap.set("n", "<leader>nf", "<cmd>enew<cr>", { desc = "New File" })

-- quit
keymap.set("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })
