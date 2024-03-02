return {
    -- utils
    {
        "numToStr/Comment.nvim",
        opts = {},
        lazy = false,
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
            direction = "float",
            float_opts = {
                -- The border key is *almost* the same as "nvim_open_win"
                -- see :h nvim_open_win for details on borders however
                -- the "curved" border is a custom border type
                -- not natively supported but implemented in this plugin.
                border = "single"
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
                -- Show todo comments in the sign column but don"t highlight the text
                highlight = {
                    before = "",
                    after = ""
                },
            })
            vim.keymap.set("n", "<leader>ft", "<Cmd>TodoTelescope<CR>")
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
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {},
        config = function ()
            require("nvim-autopairs").setup({
              disable_filetype = { "TelescopePrompt" , "vim" },
            })
        end
    },
	{
		"windwp/nvim-ts-autotag",
        ft = {
            "html", "javascript", "typescript", "javascriptreact",
            "typescriptreact", "svelte", "vue", "tsx", "jsx", "rescript",
            "xml",
            "php",
            "markdown",
            "astro", "glimmer", "handlebars", "hbs"
        },
        lazy = true,
        config = true,
    },
    -- code spell checker
    {
        "kamykn/spelunker.vim",
        config = function ()
            -- Enable spelunker.vim. (default: 1)
            -- 1: enable
            -- 0: disable
            -- let g:enable_spelunker_vim = 1

            -- [[ helper function to toggle spelunker ]]
            function ToggleSpellChecker()
                if vim.g.enable_spelunker_vim == 1 then
                    vim.g.enable_spelunker_vim = 0
                else
                    vim.g.enable_spelunker_vim = 1
                end
            end
            vim.keymap.set("n", "<leader>sc", [[:lua ToggleSpellChecker()<CR>]], { noremap = true, silent = true })

            -- Spellcheck type: (default: 1)
            -- 1: File is checked for spelling mistakes when opening and saving. This
            -- may take a bit of time on large files.
            -- 2: Spellcheck displayed words in buffer. Fast and dynamic. The waiting time
            -- depends on the setting of CursorHold `set updatetime=1000`.
            vim.g.spelunker_check_type = 2
            vim.o.updatetime = 1000

            -- Highlight type: (default: 1)
            -- 1: Highlight all types (SpellBad, SpellCap, SpellRare, SpellLocal).
            -- 2: Highlight only SpellBad.
            -- FYI: https://vim-jp.org/vimdoc-en/spell.html#spell-quickstart
            vim.g.spelunker_highlight_type = 2

            vim.g.spelunker_disable_acronym_checking = 0
            -- Override highlight setting.
            vim.cmd[[
              highlight SpelunkerSpellBad cterm=underline ctermfg=247 gui=underline guifg=#ff0000
              highlight SpelunkerComplexOrCompoundWord cterm=underline ctermfg=NONE gui=underline guifg=NONE
            ]]
        end
    }
}
