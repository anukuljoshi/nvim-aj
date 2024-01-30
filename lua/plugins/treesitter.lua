return {
    -- treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = {},
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "c", "lua",
                    "go", "python",
                    "typescript", "javascript",
                    "html", "css", "jsdoc",
                },
                -- Install parsers synchronously (only applied to `ensure_installed`)
                sync_install = false,

                -- Automatically install missing parsers when entering buffer
                -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
                auto_install = true,

                highlight = { enable = true },
                indent = { enable = true },
            })
        end
    },
    -- {
    --     -- TODO: see other options and configure to need
    --     "nvim-treesitter/nvim-treesitter-context",
    -- },
}
