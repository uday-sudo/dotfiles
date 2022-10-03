
--[[
local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local luasnip = require("luasnip")
local cmp = require("cmp")

cmp.setup({
    mapping = {
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i' }),
        ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-1), { 'i', 'c' }),
        ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(1), { 'i', 'c' }),
        ['<C-c>'] = cmp.mapping({
            i = cmp.mapping.close(),
            c = cmp.mapping.close(),
        }),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
        ['<CR>'] = cmp.mapping({
            i = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Replace,
                select = false
            }),
            c = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Replace,
                select = false
            }),
        }),

    },
    enabled = function()
        -- disable completion in comments
        local context = require 'cmp.config.context'
        -- keep command mode completion enabled when cursor is in a comment
        if vim.api.nvim_get_mode().mode == 'c' then
            return true
        else
            return not context.in_treesitter_capture("comment") 
            and not context.in_syntax_group("Comment")
        end
    end,
    sources = {
        { name = 'luasnip' },
        {
            name = 'path',
            option = {
                trailing_slash = true
            }
        },
        { name = 'nvim_lsp' },
        { name = 'calc' },
        -- {
        --     name = 'buffer',
        --     option = {
        --         keyword_length = 1
        --     }
        -- },
        -- { name = 'nvim_lsp_signature_help' },
        -- { name = '' },
        -- { name = '' },
        -- { name = '' },
        -- { name = '' },
    },
    snippet = {
        -- required - you must specify a snippet engine
        expand = function(args)
            -- vim.fn["vsnip#anonymous"](args.body) -- for `vsnip` users.
            require('luasnip').lsp_expand(args.body) -- for `luasnip` users.
            -- vim.fn["ultisnips#anon"](args.body) -- for `ultisnips` users.
            -- require'snippy'.expand_snippet(args.body) -- for `snippy` users.
        end,
    },
    formatting = {
        format = require('lspkind').cmp_format()
    },
    completion = {
        completeopt = 'menu,menuone,noinsert',
    }
    -- sorting = {
    --     comparators = {
    --         function(...) return cmp_buffer:compare_locality(...) end,
    --     }
    -- }
}) 
--]]
local present, cmp = pcall(require, "cmp")

if not present then
   return
end

-- Auto pairs
local cmp_autopairs = require "nvim-autopairs.completion.cmp"
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })

vim.opt.completeopt = "menuone,noselect"

-- nvim-cmp setup
cmp.setup {
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
         require('luasnip').lsp_expand(args.body)
    end,
  },
   formatting = {
      format = function(entry, vim_item)
         -- load lspkind icons
         vim_item.kind = string.format(
            "%s %s",
            require("config.lspkind_icons").icons[vim_item.kind],
            vim_item.kind
         )

         vim_item.menu = ({
            nvim_lsp = "[LSP]",
            nvim_lua = "[Lua]",
            buffer = "[BUF]",
         })[entry.source.name]

         return vim_item
      end,
   },
   mapping = {
      ["<C-p>"] = cmp.mapping.select_prev_item(),
      ["<C-n>"] = cmp.mapping.select_next_item(),
      ["<C-d>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.close(),
      ["<CR>"] = cmp.mapping.confirm {
         behavior = cmp.ConfirmBehavior.Replace,
         select = true,
      },
      ["<Tab>"] = function(fallback)
         if cmp.visible() then
            cmp.select_next_item()
         elseif require("luasnip").expand_or_jumpable() then
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
         else
            fallback()
         end
      end,
      ["<S-Tab>"] = function(fallback)
         if cmp.visible() then
            cmp.select_prev_item()
         elseif require("luasnip").jumpable(-1) then
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
         else
            fallback()
         end
      end,
   },
   sources = {
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "LuaSnip" },
      { name = "buffer" },
      { name = "nvim_lua" },
      { name = "path" },
   },
}
