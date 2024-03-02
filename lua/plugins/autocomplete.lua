return {
    -- load luasnips + cmp related in insert mode only
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            {
                -- snippet plugin
                "L3MON4D3/LuaSnip",
                dependencies = "rafamadriz/friendly-snippets",
                opts = { history = true, updateevents = "TextChanged,TextChangedI" },
                config = function(_, opts)
                    require("luasnip").config.set_config(opts)

                    -- vscode format
                    require("luasnip.loaders.from_vscode").lazy_load()
                    require("luasnip.loaders.from_vscode").lazy_load { paths = vim.g.vscode_snippets_path or "" }

                    -- snipmate format
                    require("luasnip.loaders.from_snipmate").load()
                    require("luasnip.loaders.from_snipmate").lazy_load { paths = vim.g.snipmate_snippets_path or "" }

                    -- lua format
                    require("luasnip.loaders.from_lua").load()
                    require("luasnip.loaders.from_lua").lazy_load { paths = vim.g.lua_snippets_path or "" }

                    vim.api.nvim_create_autocmd("InsertLeave", {
                        callback = function()
                            if
                                require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
                                and not require("luasnip").session.jump_active
                            then
                                require("luasnip").unlink_current()
                            end
                        end,
                    })
                end,
            },

            -- cmp sources plugins
            {
                "saadparwaiz1/cmp_luasnip",
                "hrsh7th/cmp-nvim-lua",
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-path",
            },
            {
        		"onsails/lspkind.nvim",
            }
        },
        config = function()
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
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if require("luasnip").expand_or_jumpable() then
                            vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
                        elseif cmp.visible() then
                            cmp.select_next_item()
                        else
                            fallback()
                        end
                    end, { "i", "s", }),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if require("luasnip").jumpable(-1) then
                            vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
                        elseif cmp.visible() then
                            cmp.select_prev_item()
                        else
                            fallback()
                        end
                    end, { "i", "s", }),
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
                    { name = "luasnip" },
                    { name = "buffer" },
                    { name = "nvim_lua" },
                    { name = "path" },
                },
            })
            vim.cmd([[
            augroup NvimCmp
            au!
            au FileType TelescopePrompt lua require('cmp').setup.buffer { enabled = false }
            augroup END
            ]])
        end
    },
}
