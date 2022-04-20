return require('packer').startup(function()

      -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Collaborative editing
    use 'jbyuki/instant.nvim'

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

    -- Dashboard
    use 'glepnir/dashboard-nvim'

    -- Session Management
    use({
      "folke/persistence.nvim",
      event = "BufReadPre", -- this will only start session saving when an actual file was opened
      module = "persistence",
      config = function()
        require("persistence").setup()
      end,
    })

    use {
        'hoob3rt/lualine.nvim',
        config = function()
            require('config/lualine')
        end,
        requires = {
            'kyazdani42/nvim-web-devicons', opt = true
        }
    }

    -- GCC and GBC comment feature
    use {
        'numToStr/Comment.nvim',
        commit = "0aaea32f27315e2a99ba4c12ab9def5cbb4842e4",
        config = function()
            require('config/comment')
        end
    }

    -- Toggle Term
    use {
        'akinsho/toggleterm.nvim',
        config = function()
            require('config/toggleterm')
        end
    }

    --for notetaking and usual day to day stuff
    use "norcalli/nvim-colorizer.lua"    --Colorizer

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
    --use 'rcarriga/nvim-notify'

    -- Snippets Jam
    use 'L3MON4D3/LuaSnip'
    use {
        'rafamadriz/friendly-snippets',
        -- after="L3MON4D3/LuaSnip",
        config = function()
            require('config/friendly')
        end
    }
    --The New League of autocomplete
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'saadparwaiz1/cmp_luasnip'
    use {
        'hrsh7th/nvim-cmp',
        config = function()
            require('config/nvim-cmp')
        end
    }

    --Treesitter is Treesitter
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
end)
