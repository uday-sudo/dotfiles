return {
  {
    "kawre/neotab.nvim",
    event = "InsertEnter",
    opts = {
        -- configuration goes here
    },
  },
  {
    "L3MON4D3/LuaSnip",
    build = "make install_jsregexp",
    dependencies = { "neotab.nvim", },
    keys = {
        {
            "<Tab>",
            function()
                return require("luasnip").jumpable(1) --
                        and "<Plug>luasnip-jump-next"
                    or "<Plug>(neotab-out)"
            end,
            expr = true,
            silent = true,
            mode = "i",
        },
    },
  }
}
