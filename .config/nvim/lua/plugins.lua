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


    -- LSP components for that fancy IDE stuff in here
    use {
        'neovim/nvim-lspconfig',
        config = function()
            require('config/nvim-lspconfig')
        end
    }

    use {
        'kosayoda/nvim-lightbulb',
        config=function()
            vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]
        end
    }

    --use'ray-x/lsp_signature.nvim'
    use 'kabouzeid/nvim-lspinstall'

    use {
        'hrsh7th/nvim-compe',
        config = function()
            require('config/nvim-compe')
        end
    }

    use 'hrsh7th/vim-vsnip'

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
            require('config/treesitter')
        end
    }

    use {
            'nvim-treesitter/nvim-treesitter-textobjects'
    }

    use {
            'rrethy/nvim-treesitter-textsubjects'
    }

    -- LSP bs ends here

    -- for getting code outline (variables and functions)

    use {
        'stevearc/aerial.nvim',
        config = function()
            require('config/lualine')
        end,
        requires = {
            'kyazdani42/nvim-web-devicons', opt = true
        }
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
        'hoob3rt/lualine.nvim',
        config = function()
            require('config/lualine')
        end,

        requires = {
            'kyazdani42/nvim-web-devicons', opt = true
        }
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
        'lervag/vimtex',
        config = function()
            require('config/vimtex')
        end
    }

end)
