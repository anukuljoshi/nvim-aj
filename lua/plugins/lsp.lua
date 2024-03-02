return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
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
    end
}
