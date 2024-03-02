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
        "onsails/lspkind.nvim",
        -- snippet
        "L3MON4D3/LuaSnip",
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
                "gopls", "templ",
                -- js/ts
                "tsserver",
                -- vim/lua
                "lua_ls",
                -- web
                "cssmodules_ls", "htmx", "html", "tailwindcss",
                -- others
                "lua_ls", "marksman", "sqlls"
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
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            completion = {
                completeopt = 'menu,menuone,noinsert'
            },
            mapping = {
                ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
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
            },
            formatting = {
                format = function(_, vim_item)
                    vim_item.kind = require("lspkind").presets.codicons[vim_item.kind]
                    .. "  "
                    .. vim_item.kind
                    return vim_item
                end,
            },
            sources = {
                { name = "nvim_lsp" },
                { name = "path" },
                { name = "buffer" },
            },
        })

        vim.cmd([[
            augroup NvimCmp
            au!
            au FileType TelescopePrompt lua require('cmp').setup.buffer { enabled = false }
            augroup END
        ]])
    end
}
