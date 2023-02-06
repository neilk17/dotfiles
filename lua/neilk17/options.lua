vim.opt.termguicolors = true

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Relative numbers
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.mouse = 'a'

-- Enable break indent
vim.opt.breakindent = true

vim.opt.scrolloff=7
vim.opt.cmdheight=1
-- Tabs
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.incsearch = true
vim.opt.lazyredraw = true
vim.opt.magic = true
vim.opt.showmatch = true

-- Tab to invoke auto completion
vim.opt.wildmenu = true

-- Appearance
vim.opt.termguicolors = true
vim.opt.signcolumn="yes"
vim.opt.cursorline = true

vim.cmd[[highlight Normal guibg=NONE ctermbg=NONE]]
vim.cmd[[highlight clear LineNr]]

-- Line wrapping
vim.opt.wrap = false

-- Backspace
vim.opt.backspace = 'eol,start,indent'

-- Split windows
vim.opt.splitright = true

-- descrease update time
vim.opt.updatetime = 250

-- better completion
-- vim.o.completeopt = 'menuone,select'

vim.opt.title = true
