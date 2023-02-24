local fn = vim.fn

-- Plugins
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
-- vim.cmd [[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost packer.lua source <afile> | PackerSync
--   augroup end
-- ]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}


return packer.startup(function(use)
  -- packer
  use 'wbthomason/packer.nvim'

  -- in charge of managing lsp servers, linters & formatters
  use("williamboman/mason.nvim")

  -- bridges gap b/w mason & lspconfig
  use("williamboman/mason-lspconfig.nvim")

  -- tree sitter LSP
  use { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    run = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  }

  use { -- Additional text objects via treesitter
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  }

  -- pairs
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'

  -- git related 
  use 'tpope/vim-rhubarb'
  use 'tpope/vim-fugitive'
  use 'lewis6991/gitsigns.nvim'

  -- Colorscheme
  use 'folke/tokyonight.nvim'
  use 'ellisonleao/gruvbox.nvim'

  -- emmet
  use {
    'mattn/emmet-vim',
    setup = function() vim.g.user_emmet_leader_key = ','end
  }

  -- For parans
  use 'tpope/vim-surround'

  -- Fancier statusline
  use 'nvim-lualine/lualine.nvim'
  use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines

  -- "gc" to comment visual regions/lines
  use 'numToStr/Comment.nvim'

  -- Typescript commenting 
  use 'JoosepAlviste/nvim-ts-context-commentstring'

  -- Detect tabstop and shiftwidth automatically
  use 'tpope/vim-sleuth'

  -- Nvim tree
  use 'nvim-tree/nvim-web-devicons'
  use 'nvim-tree/nvim-tree.lua'

  -- prettier
  use 'sbdchd/neoformat'

  -- Fuzzy Finder (files, lsp, etc)
  use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }

  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }

  -- Neovim dev
  use "folke/neodev.nvim"

  -- LSP Zero: completion
  use {
  'VonHeikemen/lsp-zero.nvim',
  requires = {
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

  }
  -- Lua
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {
	-- your configuration comes here
	-- or leave it empty to use the default settings
	-- refer to the configuration section below
      }
    end
  }

  -- Tailwind
  use({ "roobert/tailwindcss-colorizer-cmp.nvim",
    -- optionally, override the default options:
    config = function()
      require("tailwindcss-colorizer-cmp").setup({
	color_square_width = 2,
      })
    end
  })
  use {'NvChad/nvim-colorizer.lua'}


  -- diffview
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

  -- Vim matchup
  use {
    'andymass/vim-matchup',
    setup = function()
      -- may set any options here
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end
  }

  -- copilot
  use { "github/copilot.vim" }

  -- text highlight
  use { "RRethy/vim-illuminate" }

  -- UI
  use { "echasnovski/mini.indentscope" }

  -- Trouble nvim
  use {
    "folke/trouble.nvim",
    requires = "nvim-tree/nvim-web-devicons",
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
  }

  -- using packer.nvim
  use {
    'akinsho/bufferline.nvim',
    tag = "v3.*",
    requires = 'nvim-tree/nvim-web-devicons'
  }

  -- Markdown preview
  -- install without yarn or npm
  use({
      "iamcco/markdown-preview.nvim",
      run = function() vim.fn["mkdp#util#install"]() end,
  })

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

