return {
    {
        "romgrk/barbar.nvim",
        dependencies = {
            "lewis6991/gitsigns.nvim",     -- OPTIONAL: for git status
            "nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
        },
        opts = {
            -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
            -- animation = true,
            -- insert_at_start = true,
            -- …etc.
        },
        version = "^1.0.0", -- optional: only update when a new 1.x version is released
        config = function()
            local barbar = require("barbar")
            barbar.setup({
                icons = {
                    separator = { left = "", right = "" },
                    -- If true, add an additional separator at the end of the buffer list
                    separator_at_end = false,
                    preset = "default",
                },
                -- If set, the letters for each buffer in buffer-pick mode will be
                -- assigned based on their name. Otherwise or in case all letters are
                -- already assigned, the behavior is to assign letters in order of
                -- usability (see order below)
                semantic_letters = false,
                -- New buffer letters are assigned in this order. This order is
                -- optimal for the qwerty keyboard layout but might need adjustment
                -- for other layouts.
                letters = "asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP",
            })
            local opts = { noremap = true, silent = true }
            -- default
            -- Move to previous/next
            vim.keymap.set("n", "<A-,>", "<Cmd>BufferPrevious<CR>", opts)
            vim.keymap.set("n", "<A-.>", "<Cmd>BufferNext<CR>", opts)
            -- Re-order to previous/next
            vim.keymap.set("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", opts)
            vim.keymap.set("n", "<A->>", "<Cmd>BufferMoveNext<CR>", opts)

            -- Goto buffer in position...
            vim.keymap.set("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", opts)
            vim.keymap.set("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", opts)
            vim.keymap.set("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", opts)
            vim.keymap.set("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", opts)
            vim.keymap.set("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", opts)
            vim.keymap.set("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", opts)
            vim.keymap.set("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", opts)
            vim.keymap.set("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", opts)
            vim.keymap.set("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", opts)
            vim.keymap.set("n", "<A-0>", "<Cmd>BufferLast<CR>", opts)

            -- Pin/unpin buffer
            vim.keymap.set("n", "<A-p>", "<Cmd>BufferPin<CR>", opts)
            -- close current
            vim.keymap.set("n", "<leader>wi", "<Cmd>BufferClose<CR>", opts)
            -- close others
            vim.keymap.set("n", "<leader>wo", "<Cmd>BufferCloseAllButCurrent<CR>", opts)
            -- close left
            vim.keymap.set("n", "<leader>wl", "<Cmd>BufferCloseBuffersLeft<CR>", opts)
            -- close right
            vim.keymap.set("n", "<leader>wr", "<Cmd>BufferCloseBuffersRight<CR>", opts)
            -- Wipeout buffer
            --                 :BufferWipeout
            -- Close commands
            --                 :BufferCloseAllButCurrent
            --                 :BufferCloseAllButPinned
            --                 :BufferCloseAllButCurrentOrPinned
            --                 :BufferCloseBuffersLeft
            --                 :BufferCloseBuffersRight
            -- Magic buffer-picking mode
            vim.keymap.set("n", "<leader>bp", "<Cmd>BufferPick<CR>", opts)
        end
    },
}
