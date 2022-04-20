require("telescope").setup {
    enable = true, -- boolean: enable transparent
    extra_groups = {"BufferLineTabClose",          -- table/string: additional groups that should be clear
                    "BufferlineBufferSelected",    -- In particular, when you set it to 'all', that means all avaliable groups
                    "BufferLineFill",              -- example of akinsho/nvim-bufferline.lua
                    "BufferLineBackground",
                    "BufferLineSeparator",
                    "BufferLineIndicatorSelected",
      },
    exclude = {}, -- table: groups you don't want to clear
}