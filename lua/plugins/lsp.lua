return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        -- autocompletion
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        -- snippet
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        -- notification
        "j-hui/fidget.nvim"
    },
    opts = {},
    config = function()
        require("fidget").setup()
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                -- python
                "pyright",
                -- go
                "gopls",
                -- js/ts
                "tsserver",
                -- vim/lua
                "lua_ls",
                -- others
            },
            handlers = {
                function(server_name)
                    require("lspconfig")[server_name].setup({})
                end,
                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup({
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "vim" }
                                }
                            }
                        }
                    })
                end,
            }
        })

        local cmp = require("cmp")
        cmp.setup({
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            mapping = {
                ["<Tab>"] = cmp.mapping({
                    i = cmp.mapping.confirm({
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = false
                    }),
                    c = function(fallback)
                        if cmp.visible() then
                            cmp.confirm({
                                behavior = cmp.ConfirmBehavior.Replace,
                                select = false
                            })
                        else
                            fallback()
                        end
                    end
                }),
                ["<C-n>"] = cmp.mapping({
                    c = function()
                        if cmp.visible() then
                            cmp.select_next_item({
                                behavior = cmp.SelectBehavior.Select
                            })
                        else
                            vim.api.nvim_feedkeys(t("<Down>"), "n", true)
                        end
                    end,
                    i = function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item({
                                behavior = cmp.SelectBehavior.Select
                            })
                        else
                            fallback()
                        end
                    end
                }),
                ["<C-p>"] = cmp.mapping({
                    c = function()
                        if cmp.visible() then
                            cmp.select_prev_item({
                                behavior = cmp.SelectBehavior.Select
                            })
                        else
                            vim.api.nvim_feedkeys(t("<Up>"), "n", true)
                        end
                    end,
                    i = function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item({
                                behavior = cmp.SelectBehavior.Select
                            })
                        else
                            fallback()
                        end
                    end
                }),
                ["<CR>"] = cmp.mapping({
                    i = cmp.mapping.confirm({
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = false
                    }),
                    c = function(fallback)
                        if cmp.visible() then
                            cmp.confirm({
                                behavior = cmp.ConfirmBehavior.Replace,
                                select = false
                            })
                        else
                            fallback()
                        end
                    end
                }),
            },
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" }, -- For luasnip users.
            }, {
                { name = "buffer" },
            })
        })
    end
}
