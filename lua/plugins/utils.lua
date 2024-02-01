return {
    -- utils
    {
        "numToStr/Comment.nvim",
        opts = {},
        lazy = false,
    },
    {
        "smoka7/hop.nvim",
        version = "*",
        opts = {},
        config = function()
            local hop = require("hop")
            hop.setup({})
            vim.keymap.set(
                "", "s",
                function()
                    hop.hint_char1()
                end,
                {}
            )
            vim.keymap.set(
                "", "<leader>gg",
                function()
                    hop.hint_vertical()
                end,
                {}
            )
        end
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {}
    },
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        opts = {
            open_mapping = [[<C-p>]],
            hide_numbers = false,
            start_in_insert = true,
            insert_mappings = false,
            terminal_mappings = true,
            direction = 'float',
            float_opts = {
                -- The border key is *almost* the same as 'nvim_open_win'
                -- see :h nvim_open_win for details on borders however
                -- the 'curved' border is a custom border type
                -- not natively supported but implemented in this plugin.
                border = 'single'
            },
        }
    },
    {
        "kylechui/nvim-surround",
        version = "*",
        opts = {},
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
        config = function()
            require("todo-comments").setup({
                -- Show todo comments in the sign column but don't highlight the text
                highlight = {
                    before = "",
                    after = ""
                },
            })
            vim.keymap.set("n", "<leader>ts", "<Cmd>TodoTelescope<CR>")
            vim.keymap.set("n", "<leader>tb", "<Cmd>TodoTrouble<CR>")
        end
    },
    {
        "jiaoshijie/undotree",
        dependencies = "nvim-lua/plenary.nvim",
        config = function()
            local undotree = require("undotree")
            undotree.setup({
                keymaps = {
                    ["j"] = "move_next",
                    ["k"] = "move_prev",
                    ["h"] = "move2parent",
                    ["J"] = "move_change_next",
                    ["K"] = "move_change_prev",
                    ["<cr>"] = "action_enter",
                    ["p"] = "enter_diffbuf",
                    ["q"] = "quit",
                },
            })
            vim.keymap.set("n", "<leader>u", "<Cmd>lua require('undotree').toggle()<CR>")
        end,
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {},
        config = function ()
            require('nvim-autopairs').setup({
              disable_filetype = { "TelescopePrompt" , "vim" },
            })
        end
    },
}
