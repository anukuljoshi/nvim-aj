-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)

return {
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {},
        config = function()
            -- Lua
            vim.keymap.set(
                "n",
                "<leader>tt",
                function()
                    require("trouble").toggle()
                end
            )
            vim.keymap.set(
                "n",
                "<leader>tr",
                function()
                    require("trouble").toggle("lsp_references")
                end
            )
            vim.keymap.set(
                "n",
                "<leader>tw",
                function()
                    require("trouble").toggle("workspace_diagnostics")
                end
            )
            vim.keymap.set(
                "n",
                "<leader>td",
                function()
                    require("trouble").toggle("document_diagnostics")
                end
            )
            vim.keymap.set(
                "n",
                "<leader>tq",
                function()
                    require("trouble").toggle("quickfix")
                end
            )
            vim.keymap.set(
                "n",
                "<leader>tn",
                function()
                    require("trouble").next({
                        skip_groups = true,
                        jump = true
                    })
                end
            )
            vim.keymap.set(
                "n",
                "<leader>tp",
                function()
                    require("trouble").previous({
                        skip_groups = true,
                        jump = true
                    })
                end
            )
        end,
    },
}
