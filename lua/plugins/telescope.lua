return {
    -- telescope
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {},
        config = function()
            -- use fzf
            require("telescope").load_extension("fzf")

            -- custom keymaps
            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
            vim.keymap.set("n", "<leader>fa", function()
                builtin.find_files({
                    hidden = true
                })
            end, {})
            vim.keymap.set("n", "<leader>fw", builtin.live_grep, {})
            vim.keymap.set("n", "<leader>fiw", builtin.grep_string, {})
            vim.keymap.set("n", "<leader>fm", builtin.marks, {})
            vim.keymap.set("n", "<leader>fg", builtin.git_files, {})
            vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
            vim.keymap.set("n", "<leader>f.", function()
                builtin.find_files({
                    cwd = vim.fn.expand("%:p:h")
                })
            end)
            vim.keymap.set("n", "<leader>f.", function()
                builtin.find_files({
                    cwd = vim.fn.expand("%:p:h")
                })
            end)
        end
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build =
        "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
    },
}
