return require('packer').startup(function()

      -- Packer can manage itself
    use 'wbthomason/packer.nvim'

      --treesitter supported colorschemes(POG)
    use 'rafamadriz/neon'               --this is like onedark and is very poggers
    use 'marko-cerovac/material.nvim'
    use 'sainnhe/sonokai'               --has eyepleasing schemes
    use 'joshdick/onedark.vim'
    use 'sainnhe/gruvbox-material'
    use 'EdenEast/nightfox.nvim'
    use "bluz71/vim-moonfly-colors"
    use 'shaeinst/roshnivim-cs'         --Black And white Cool Colors

    -- Session Management
    use({
      "folke/persistence.nvim",
      event = "BufReadPre", -- this will only start session saving when an actual file was opened
      module = "persistence",
      config = function()
        require("persistence").setup()
      end,
    })

        --Treesitter is Treesitter
        use {
            'nvim-treesitter/nvim-treesitter',
            run = ':TSUpdate',
            config = function()
                require('config/treesitter')
            end
        }
    

    -- LSP components for that fancy IDE stuff in here
    use {
        'neovim/nvim-lspconfig',
        config = function()
            require('config/nvim-lspconfig')
        end
    }

    use {
        'kkharji/lspsaga.nvim',
        config = function()
            require('config/lspsaga')
        end
    }
    use 'williamboman/nvim-lsp-installer'

    -- The New League of autocomplete
    use {
        'hrsh7th/nvim-cmp',
        after='nvim-lspconfig',
        config = function()
            require('config/nvim-cmp')
        end
    }

    use {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'saadparwaiz1/cmp_luasnip'
    }


    -- Snippets Jam
    use {
        'L3MON4D3/LuaSnip',
        tag = 'v<CurrentMajor>.*',
        config = function()
            require('luasnip.loaders.from_vscode').lazy_load()
        end
    }
    use 'rafamadriz/friendly-snippets'
    -- use 'onsails/lspkind-nvim'  -- Adds nerd font icons ( in lualine )

    -- use 'williamboman/nvim-lsp-installer'


    -- For Java specific things
    --use 'mfussenegger/nvim-jdtls'


    --For Indent lines
    use {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require('config/indent-blankline')
        end
    }

    -- Transparency
    use {
        'xiyaowong/nvim-transparent',
        config = function()
            require('config/transparent')
        end
    }
    
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
    --use 'gennaro-tedesco/nvim-peekup'
    use "tversteeg/registers.nvim"

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

    -- Toggle Term
    use {
        'akinsho/toggleterm.nvim',
        config = function()
            require('config/toggleterm')
        end
    }

    -- use {
    --     'windwp/nvim-autopairs',        --auto pairing if it is not obvious from the name
    --     after = 'hrsh7th/nvim-cmp',
    --     config = function()
    --         require('config/nvim-autopairs')
    --     end
    -- }

    -- Auto pairs
    use {
        "windwp/nvim-autopairs",
        wants = "nvim-treesitter",
        module = { "nvim-autopairs.completion.cmp", "nvim-autopairs" },
        config = function()
            require("config/nvim-autopairs")
        end
    }

    -- LSP signatures
    use {
        "ray-x/lsp_signature.nvim",
        config = function()
            require("config/lsp_signature")
        end
    }

    --File Tree
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require('config/nvim-tree')
        end
    }

    -- Statusline
    use {
        'hoob3rt/lualine.nvim',
        config = function()
            require('config/lualine')
        end,
        requires = {
            'kyazdani42/nvim-web-devicons', opt = true
        }
    }

    --For Bufferline
    use {
        'akinsho/bufferline.nvim',
        tag = "v2.*",
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require('config/bufferline')
        end
    }

    --Hop for motion
    use {
        'phaazon/hop.nvim',
        branch = 'v2', -- optional but strongly recommended
        --config = function()
        --  -- you can configure Hop the way you like here; see :h hop-config
        --  require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
        --end
      }

      -- Sniprun
      -- use { 'michaelb/sniprun', run = 'bash ./install.sh'}

    --Competitive Programming
    -- use {
    --     "p00f/cphelper.nvim",
    --     requires = 'nvim-lua/plenary.nvim',
    -- }

    -- use {
    --     'xeluxee/competitest.nvim',
    --     requires = 'MunifTanjim/nui.nvim',
    --     config = function() require'competitest'.setup() end
    -- }

    --for notetaking and usual day to day stuff
    use "norcalli/nvim-colorizer.lua"    --Colorizer
    use 'davidgranstrom/nvim-markdown-preview'   --markdown preview
end)
