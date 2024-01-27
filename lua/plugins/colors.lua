return {
    -- colorscheme
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        opts = {},
    },
    {
        "rebelot/kanagawa.nvim",
        config = function()
            require('kanagawa').setup({
                colors = {
                    palette = {
                        -- default Bg Shades
                        -- sumiInk0 = "#16161D",
                        -- sumiInk1 = "#181820",
                        -- sumiInk2 = "#1a1a22",
                        -- sumiInk3 = "#1F1F28",
                        -- sumiInk4 = "#2A2A37",
                        -- sumiInk5 = "#363646",
                        -- sumiInk6 = "#54546D", --fg

                        -- custom override
                        -- inactive barbar & statusline bg
                        sumiInk0 = "#0d0d1e",
                        -- main bg
                        sumiInk3 = "#17122e",
                        -- active barbar
                        sumiInk4 = "#17122e",
                        -- active line in telescope/nvim-tree
                        sumiInk5 = "#0d0d1e",
                    },
                    theme = {
                        -- change specific usages for a certain theme, or for all of them
                        all = {
                            ui = {
                                -- remove color from LineNr, SignColumn
                                bg_gutter = "none"
                            }
                        }
                    }
                },
            })
        end
    }
}
