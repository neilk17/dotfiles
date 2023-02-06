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

-- jk to exit insert mode
keymap.set('i', 'jk', '<ESC>')
-- // to clear search highlighting
--[[ keymap.set('n', '//', ':noh<CR>') ]]

-- map mac command key + s to save file
keymap.set('n', '++', ':update<CR>')


-- quit buffer
keymap.set('n', '<leader>q', ':wq<CR>')

keymap.set("n", "<leader>e", ":Lex 30<CR>")
-- source file
keymap.set('n', '<leader>vs', ':source $MYVIMRC<CR>')
keymap.set('n', 'x', '"_x')
-- split window
keymap.set('n', '<leader>sv', '<C-w>v')
keymap.set('n', '<leader>sh', '<C-w>h')
keymap.set('n', '<leader>sx', ':close<CR>')

-- Better Window navigation
keymap.set('n', '<C-h>', '<C-w>h')
keymap.set('n', '<C-j>', '<C-w>j')
keymap.set('n', '<C-k>', '<C-w>k')
keymap.set('n', '<C-l>', '<C-w>l')
-- tabs
keymap.set('n', '<C-t>', ':tabnew<CR>')

-- move lines around
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- better 'J'
keymap.set("n", "J", "mzJ`z")

-- Paste over existing words
keymap.set("x", "<leader>p", "\"_dP")

