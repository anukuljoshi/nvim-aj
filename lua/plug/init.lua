local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system(
        {"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
            lazypath})
end
vim.opt.rtp:prepend(lazypath)

-- plugins: this should be a table or a string
--     table: a list with your Plugin Spec
--     string: a Lua module name that contains your Plugin Spec. See Structuring Your Plugins
-- opts: see Configuration (optional)
plugins = {
    {
        "folke/which-key.nvim",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end
    },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        -- or                              , branch = '0.1.x',
        dependencies = {'nvim-lua/plenary.nvim'}
    },
    {
        { 'VonHeikemen/lsp-zero.nvim', branch = 'v3.x' },
        {'williamboman/mason.nvim'},
        {'williamboman/mason-lspconfig.nvim'},
        {'neovim/nvim-lspconfig'},
        {'hrsh7th/cmp-nvim-lsp'},
        {
            'hrsh7th/nvim-cmp',
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
        {'L3MON4D3/LuaSnip'}
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000
    },
    {
        'smoka7/hop.nvim',
        version = "*",
        opts = {}
    },
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function () 
            local configs = require("nvim-treesitter.configs")
            configs.setup({
                ensure_installed = {
                    "c", "lua",
                    "go", "python",
                    "typescript", "javascript",
                    "html", "css"
                },
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },  
            })
        end
    },
    {
        'numToStr/Comment.nvim',
        opts = {
            -- add any options here
        },
        lazy = false,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {}
    },
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
    },
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        opts = {
        }
    },
}

require("lazy").setup(plugins, opts)

