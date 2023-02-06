require 'neilk17.options'
require 'neilk17.keymaps'
require 'neilk17.packer'

-- Set highlight on search
vim.o.hlsearch = false

vim.o.termguicolors = true
vim.cmd [[colorscheme tokyonight-moon]]

-- set lualine as statusline
-- see `:help lualine.txt`
require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'tokyonight',
    component_separators = '|',
    section_separators = '',
  },
}

-- Enable Comment.nvim
-- require('Comment').setup()

-- Gitsigns
-- See `:help gitsigns.txt`
require('gitsigns').setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
}

-- Enable `lukas-reineke/indent-blankline.nvim`
-- See `:help indent_blankline.txt`
require('indent_blankline').setup {
  char = '┊',
  show_trailing_blankline_indent = false,
}

-- commenting for typescript
require'nvim-treesitter.configs'.setup {
  context_commentstring = {
    enable = true
  }
}


-- Typescript comments
require'nvim-treesitter.configs'.setup {
  context_commentstring = {
    enable = true
  }
}

-- Colorizer
require 'colorizer'.setup()

