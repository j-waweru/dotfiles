return {
    -- COMPLETION & EDITING TOOLS
    {
        "hrsh7th/nvim-cmp",
        dependencies = { 
            "L3MON4D3/LuaSnip", 
            "saadparwaiz1/cmp_luasnip",      -- Added: Bridge between cmp and luasnip
            "rafamadriz/friendly-snippets",  -- Added: The VSCode snippet collection
            "windwp/nvim-autopairs" 
        },
        config = function()
            local cmp = require('cmp')
            local luasnip = require('luasnip')

            -- Load VSCode snippets from friendly-snippets
            require("luasnip.loaders.from_vscode").lazy_load()

            cmp.setup({
                snippet = { 
                    expand = function(args) luasnip.lsp_expand(args.body) end 
                },
                mapping = cmp.mapping.preset.insert({
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                    ['<Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_locally_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            -- This allows Tabout to work if snippets/cmp aren't active
                            fallback()
                        end
                    end, { "i", "s" }),
                    ['<S-Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.locally_jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                }),
                sources = { 
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' }, -- Added: Shows snippets in the popup menu
                    { name = 'buffer' },
                }
            })
        end
    },

    { "windwp/nvim-autopairs", config = true },
    { "windwp/nvim-ts-autotag", config = true },
    { "kylechui/nvim-surround", config = true },

    -- Tabout configuration
    {
        'abecodes/tabout.nvim',
        lazy = false,
        config = function()
            require('tabout').setup {
                tabkey = '<Tab>',
                backwards_tabkey = '<S-Tab>',
                act_as_tab = true,
                completion = false, -- CMP handles the tab key when the menu is open
                tabouts = {
                    { open = "'", close = "'" },
                    { open = '"', close = '"' },
                    { open = '`', close = '`' },
                    { open = '(', close = ')' },
                    { open = '[', close = ']' },
                    { open = '{', close = '}' }
                },
            }
        end,
        priority = 1000,
    },

    {
        "L3MON4D3/LuaSnip",
        build = "make install_jsregexp", -- Optional: supports complex regex snippets
    },

    { "numToStr/Comment.nvim", config = true },
}
