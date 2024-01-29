return {
    {
        "nobbmaestro/nvim-andromeda",
        dependencies = {
            "tjdevries/colorbuddy.nvim",
            branch = "dev"
        },
        config = function ()
            require("andromeda").setup({
                preset = "andromeda",
                colors = {
                    -- main background
                    background = "#1b1e29",
                    -- nvim tree active line, indent line
                    mono_1     = "#404455",
                    -- telescope active line, statusline, visual highlight
                    mono_2     = "#101420",
                    -- statusline text, line numbers, borders
                    mono_3     = "#808495",
                    -- unknown
                    mono_4     = "#606064",
                    -- comments
                    mono_5     = "#8589A0",
                    -- normal text
                    mono_6     = "#d5ced9",
                }
            })
            vim.cmd[[highlight Visual guibg=#303445]]
            vim.cmd[[highlight ColorColumn guibg=#303445]]
            vim.cmd[[highlight StatusLineNC guibg=#303445]]
        end
    }
}
