return {
    -- add gruvbox
    { "ellisonleao/gruvbox.nvim" },
    {'nyoom-engineering/oxocarbon.nvim'},
    {'navarasu/onedark.nvim'},
    --[[
    {
        "navarasu/onedark.nvim",
        opts = function()
            require('onedark').setup {
                style = 'darker' --Option: dark, darker, cool, deep, warm, warmer, light
            }
        end,
    },
    {
      "LazyVim/LazyVim",
      opts = {
        colorscheme = "onedark",
      },
    }--]]
  }