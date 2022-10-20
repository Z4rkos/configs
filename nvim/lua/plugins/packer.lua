require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- Aesthetics
    use 'https://github.com/morhetz/gruvbox'
    use 'folke/tokyonight.nvim'
    use 'andreasvc/vim-256noir'
    use 'https://github.com/lvim-tech/lvim-colorscheme'
    use 'https://github.com/ryanoasis/vim-devicons' -- Developer Icons
    use 'dylanaraps/wal.vim'
    use 'sonph/onehalf'
    use 'folke/lsp-colors.nvim'
    use 'xiyaowong/nvim-transparent'
    use 'RRethy/vim-illuminate'

    -- Specific syntax shit
    use 'pangloss/vim-javascript' -- JavaScript support
    use 'maxmellon/vim-jsx-pretty' -- JS and JSX syntax

    -- Utility
    use { "nvim-lua/plenary.nvim" }
    use 'http://github.com/tpope/vim-surround' -- Surrounding ysw)
    use 'https://github.com/tpope/vim-commentary' -- For Commenting gcc & gc
    use 'nvim-lualine/lualine.nvim' -- Status bar
    use 'https://github.com/ap/vim-css-color' -- CSS Color Preview
    use 'windwp/nvim-autopairs' -- Auto-close braces and scopes
    use 'nvim-telescope/telescope.nvim' -- Cool fuzzy finder thing.
    use 'alvan/vim-closetag' -- Auto closing tags.
    use { 'nvim-treesitter/nvim-treesitter', run = 'TSUpdate' }
    use 'nvim-treesitter/playground'
    use 'lukas-reineke/indent-blankline.nvim'
    use 'psliwka/vim-smoothie'
    use 'https://github.com/vim-scripts/SyntaxAttr.vim'
    use 'rowantran/vim-bspwm-navigator'
    use { 'prettier/vim-prettier', run = 'npm install' }
    use 'nvim-lua/popup.nvim' -- An implementation of the Popup API from vim in Neovim
    use 'kyazdani42/nvim-web-devicons'
    use 'kyazdani42/nvim-tree.lua'
    use({ "akinsho/bufferline.nvim" })
    use({ "moll/vim-bbye" })
    use 'akinsho/toggleterm.nvim'
    use 'goolord/alpha-nvim'
    use 'andweeb/presence.nvim'

    -- web
    use 'Shougo/context_filetype.vim'
    use 'evanleck/vim-svelte'

    -- LSP --
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use({ "jose-elias-alvarez/null-ls.nvim" }) -- for formatters and linters
    use {
      "smjonas/inc-rename.nvim",
      config = function()
        require("inc_rename").setup()
      end,
    }

    -- Cmp ---
    use({ "hrsh7th/nvim-cmp" }) -- The completion plugin
    use({ "hrsh7th/cmp-buffer" }) -- buffer completions
    use({ "hrsh7th/cmp-path" }) -- path completions
    use({ "hrsh7th/cmp-nvim-lsp" })
    use({ "hrsh7th/cmp-nvim-lua" })
    use({ "f3fora/cmp-spell"}) -- Spell stuff

    -- snippets ---
    use({ "L3MON4D3/LuaSnip" }) --snippet engine
    use({ "saadparwaiz1/cmp_luasnip" }) -- snippet completions
    use({ "rafamadriz/friendly-snippets" }) -- a bunch of snippets to use

    -- Git
    use "lewis6991/gitsigns.nvim"

    -- Other --
    use 'vimwiki/vimwiki'
end)

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    print("Something went wrong with packer")
    return
end

-- Have packer use a popup window
-- For some reason setting this makes packer try to delete every package
-- packer.init({
--     opt_default = true,
-- 	display = {
-- 		open_fn = require("packer.util").float
-- 	},
-- })
