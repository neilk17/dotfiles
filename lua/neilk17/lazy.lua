local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)
-- require("lazy").setup(plugins, opts)

require('lazy').setup({
  -- in charge of managing lsp servers, linters & formatters
  'williamboman/mason.nvim',

  -- bridges gap b/w mason & lspconfig
  'williamboman/mason-lspconfig.nvim',

  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    }
  },


  -- pairs
  'windwp/nvim-autopairs',
  'windwp/nvim-ts-autotag',

  -- git related 
  'tpope/vim-rhubarb',
  'tpope/vim-fugitive',
  'lewis6991/gitsigns.nvim',

  -- Colorscheme
  'folke/tokyonight.nvim',
  'ellisonleao/gruvbox.nvim',


  -- For parans
  'tpope/vim-surround',

  -- Fancier statusline
  'nvim-lualine/lualine.nvim',
  'lukas-reineke/indent-blankline.nvim', -- Add indentation guides even on blank lines

  -- "gc" to comment visual regions/lines
  'numToStr/Comment.nvim',

  -- Typescript commenting 
  'JoosepAlviste/nvim-ts-context-commentstring',

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- Nvim tree
  'nvim-tree/nvim-web-devicons',
  'nvim-tree/nvim-tree.lua',

  -- prettier
  'sbdchd/neoformat',

  -- Fuzzy Finder (files, lsp, etc)
  --{ 'nvim-telescope/telescope.nvim', branch = '0.1.x', dependenceies = { 'nvim-lua/plenary.nvim' } },

  {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  -- Neovim dev
  "folke/neodev.nvim",

  -- LSP Zero: completion
  {
  'VonHeikemen/lsp-zero.nvim',
  dependenceies = {
    -- LSP Support
    {'neovim/nvim-lspconfig'},
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-path'},
    {'saadparwaiz1/cmp_luasnip'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/cmp-nvim-lua'},

    -- Snippets
    {'L3MON4D3/LuaSnip'},
    {'rafamadriz/friendly-snippets'},
    }
  },
  -- Lua
  {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {
	-- your configuration comes here
	-- or leave it empty to use the default settings
	-- refer to the configuration section below
      }
    end
  },

  -- Tailwind
  { "roobert/tailwindcss-colorizer-cmp.nvim",
    -- optionally, override the default options:
    config = function()
      require("tailwindcss-colorizer-cmp").setup({
	color_square_width = 2,
      })
    end
  },

  {'NvChad/nvim-colorizer.lua'},

  -- diffview
  { 'sindrets/diffview.nvim', dependenceies = 'nvim-lua/plenary.nvim' },

  -- Vim matchup
  {
    'andymass/vim-matchup',
    setup = function()
      -- may set any options here
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end
  },

  -- copilot
  { "github/copilot.vim" },

  -- text highlight
  { "RRethy/vim-illuminate" },

  -- UI
  { "echasnovski/mini.indentscope" },

  -- Trouble nvim
  {
    "folke/trouble.nvim",
    dependenceies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("trouble").setup {
	vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
	  {silent = true, noremap = true}
	)
	-- your configuration comes here
	-- or leave it empty to use the default settings
	-- refer to the configuration section below
      }
    end
  },

  -- using packer.nvim
  {
    'akinsho/bufferline.nvim',
    version = "v3.*",
    dependenceies = 'nvim-tree/nvim-web-devicons'
  },

  -- Markdown preview
  -- install without yarn or npm
  ({
      "iamcco/markdown-preview.nvim",
      build = function() vim.fn["mkdp#util#install"]() end,
  }),
})

