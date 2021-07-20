return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  --treesitter supported colorschemes(POG)
  use 'rafamadriz/neon'               --this is like onedark and is very poggers
  use 'marko-cerovac/material.nvim'
  use 'sainnhe/sonokai'               --has eyepleasing schemes
  use 'joshdick/onedark.vim'

  --LSP
  use 'neovim/nvim-lspconfig'
  use 'kabouzeid/nvim-lspinstall'       --To install LSP server using :LSPInstall
  use 'stevearc/aerial.nvim'            --list all the variables and functions in current window

  --snippets
  use 'hrsh7th/vim-vsnip'             -- while configuring also checkout https://github.com/rafamadriz/friendly-snippets

  --autocompletion
  use 'hrsh7th/nvim-compe'
  use 'mhartington/formatter.nvim'   --for autoformating
  use 'windwp/nvim-autopairs'        --auto pairing if it is not obvious from the name

  --markdown heh? I don't really use it so yes not using it

  --syntax highlighters
    use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
  }
  use 'nvim-treesitter/nvim-treesitter-textobjects'

  --Terminal integration
  use {
    "numtostr/FTerm.nvim",             --floating terminal window
    config = function()
        require("FTerm").setup()
    end
  }

  --register preview and handling
  use 'gennaro-tedesco/nvim-peekup'

  --fuzzyfinder and stuff
  use {
  'nvim-telescope/telescope.nvim',                                       --needs to be configured with plenary.nvim and popup.nvim
  requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }

  --colors yay!
  use 'norcalli/nvim-colorizer.lua'   --higlights colors
  use 'sunjon/Shade.nvim'             --shade inactive windows usefull atleast i think it is

  --icons these are dependencies for others
  use 'kyazdani42/nvim-web-devicons'

  --barline and tabline
  use 'romgrk/barbar.nvim'            --barline
  use {
  'hoob3rt/lualine.nvim',                                      --statusline
  requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  --indentation guides
  require("packer").startup(
      function()
          use "lukas-reineke/indent-blankline.nvim"
      end
  )

  --file explorer
  use 'kyazdani42/nvim-tree.lua'

  --misc
  use 'andweeb/presence.nvim'        --For Flexing on discord 

end)
