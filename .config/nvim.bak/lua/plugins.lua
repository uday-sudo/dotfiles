return require('packer').startup(function()

      -- Packer can manage itself
  use 'wbthomason/packer.nvim'

      --treesitter supported colorschemes(POG)
  use 'rafamadriz/neon'               --this is like onedark and is very poggers
  use 'marko-cerovac/material.nvim'
  use 'sainnhe/sonokai'               --has eyepleasing schemes
  use 'joshdick/onedark.vim'
  use 'sainnhe/gruvbox-material'
  use "Pocco81/Catppuccino.nvim"
  use "elianiva/gruvy.nvim"
  use 'EdenEast/nightfox.nvim'
  use "bluz71/vim-moonfly-colors"
  use 'vigoux/oak'


    use {
        'hoob3rt/lualine.nvim',
        config = function()
            require('config/lualine')
        end,
        requires = {
            'kyazdani42/nvim-web-devicons', opt = true
        }
    }


    --for notetaking and usual day to day stuff
    use "freitass/todo.txt-vim"  --Just a todo list plugin
    use "norcalli/nvim-colorizer.lua"    --Colorizer
    use "vimwiki/vimwiki"        --VimWiki to make notes
    use {
        'iamcco/markdown-preview.nvim',   --the name says it all
            run = function() vim.fn['mkdp#util#install']() end,
            ft = {'markdown'},
        config = function()
            require('config/markdownpreview')
        end
    }

    -- For Latex Formulas in Neovim 
    use "jbyuki/nabla.nvim"

    -- LSP components for that fancy IDE stuff in here
    use {
        'neovim/nvim-lspconfig',
        config = function()
            require('config/nvim-lspconfig')
        end
    }

    -- For Java specific things
    --use 'mfussenegger/nvim-jdtls'


    --For Indent lines
    use {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require('config/indent-blankline')
        end
    }

    --For Bufferline
    use {
        'akinsho/bufferline.nvim',
        config = function()
            require('config/bufferline')
        end
    }

    -- Transparency
    use {
        'xiyaowong/nvim-transparent',
        config = function()
            require('config/transparent')
        end
    }

    use {
        'kosayoda/nvim-lightbulb',
        config=function()
            require('config/nvim-lightbulb')
        end
    }

    --use'ray-x/lsp_signature.nvim'
    use 'williamboman/nvim-lsp-installer'

    --The New League of autocomplete
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use {
        'hrsh7th/nvim-cmp',
        config = function()
            require('config/nvim-cmp')
        end
    }

    use 'L3MON4D3/LuaSnip'

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
            require('config/treesitter')
        end
    }

--[[
    use {
            'nvim-treesitter/nvim-treesitter-textobjects'
    }

    use {
            'rrethy/nvim-treesitter-textsubjects'
    }
--]]

    -- LSP bs ends here

    
    
    --Tabout like a pro
    use {
        'abecodes/tabout.nvim',
        config = function()
            require('config/tabout')
        end,
            wants = {'nvim-treesitter'}, -- or require if not used so far
            after = {'nvim-cmp'} -- if a completion plugin is using tabs load it before
    }

      --register preview and handling
    use 'gennaro-tedesco/nvim-peekup'

    --fuzzyfinder and stuff
    use {
    'nvim-telescope/telescope.nvim',
    config = function()
            require('config/telescope')
        end,                                       --needs to be configured with plenary.nvim and popup.nvim
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }

    use {
        "numtostr/FTerm.nvim",             --floating terminal window
        config = function()
            require("config/fterm")
        end
    }

    use {
        'windwp/nvim-autopairs',        --auto pairing if it is not obvious from the name
        config = function()
            require('config/nvim-autopairs')
        end
    }

    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require('config/nvim-tree')
        end
    }

--[[
    use {
        'lervag/vimtex',
        config = function()
            require('config/vimtex')
        end
    }
--]]
end)
