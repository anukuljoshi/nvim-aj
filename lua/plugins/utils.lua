return {
    {
        'numToStr/Comment.nvim',
        opts = {},
        lazy = false,
    },
    {
        "smoka7/hop.nvim",
        version = "*",
        opts = {},
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {}
    },
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        opts = {
            open_mapping = [[<leader>t]],
            hide_numbers = false,
            start_in_insert = true,
            insert_mappings = false,
            terminal_mappings = false,
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
}

