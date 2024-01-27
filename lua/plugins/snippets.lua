return {
    {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "v2.*",
        -- install jsregexp (optional!).
        build = "make install_jsregexp",
        config = function()
            local ls = require("luasnip")
            ls.setup({})

            ls.filetype_extend("javascript", { "jsdoc" })

            vim.keymap.set({ "i" }, "<C-L>", function() ls.expand() end, { silent = true })
            vim.keymap.set({ "i", "s" }, "<C-J>", function() ls.jump(1) end, { silent = true })
            vim.keymap.set({ "i", "s" }, "<C-K>", function() ls.jump(-1) end, { silent = true })

            vim.keymap.set({ "i", "s" }, "<C-E>", function()
                if ls.choice_active() then
                    ls.change_choice(1)
                end
            end, { silent = true })
        end
    },
    {
        "danymat/neogen",
        dependencies = "nvim-treesitter/nvim-treesitter",
        config = function()
            local neogen = require("neogen")
            neogen.setup({})
            vim.keymap.set(
                "n", "<leader>dcf",
                function()
                    neogen.generate({ type = "func" })
                end
            )
            vim.keymap.set(
                "n", "<leader>dct",
                function()
                    neogen.generate({ type = "type" })
                end
            )
            vim.keymap.set(
                "n", "<leader>dcc",
                function()
                    neogen.generate({ type = "class" })
                end
            )
        end,
        -- Uncomment next line if you want to follow only stable versions
        -- version = "*"
    }
}
