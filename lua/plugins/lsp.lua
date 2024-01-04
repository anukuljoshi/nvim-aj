return {
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},
    -- LSP
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        lazy = true,
        config = false,
    },
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            {'hrsh7th/cmp-nvim-lsp'},
        }
    },
    -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            {'L3MON4D3/LuaSnip'}
        },
        config = function ()
            local cmp = require("cmp")
            cmp.setup({
                mapping = {
                    ['<Tab>'] = cmp.mapping({
                        i = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false }),
                        c = function(fallback)
                            if cmp.visible() then
                                cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
                            else
                                fallback()
                            end
                        end
                    }),
                    ['<C-n>'] = cmp.mapping({
                        c = function()
                            if cmp.visible() then
                                cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                            else
                                vim.api.nvim_feedkeys(t('<Down>'), 'n', true)
                            end
                        end,
                        i = function(fallback)
                            if cmp.visible() then
                                cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                            else
                                fallback()
                            end
                        end
                    }),
                    ['<C-p>'] = cmp.mapping({
                        c = function()
                            if cmp.visible() then
                                cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
                            else
                                vim.api.nvim_feedkeys(t('<Up>'), 'n', true)
                            end
                        end,
                        i = function(fallback)
                            if cmp.visible() then
                                cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
                            else
                                fallback()
                            end
                        end
                    }),
                    ['<CR>'] = cmp.mapping({
                        i = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false }),
                        c = function(fallback)
                            if cmp.visible() then
                                cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
                            else
                                fallback()
                            end
                        end
                    }),
                },
            })
        end
    },
}

