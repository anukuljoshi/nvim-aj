return {
    -- telescope
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {},
        config = function()
            -- use fzf
            require("telescope").load_extension("fzf")
            local builtin = require("telescope.builtin")

            -- custom keymaps
            vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
            vim.keymap.set("n", "<leader>fa", function()
                builtin.find_files({
                    hidden = true
                })
            end, { desc = "[F]ind [A]ll (including hidden)"})
            vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "[F]ind current [W]ord" })
            vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "[F]ind search by [G]rep" })
            vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "[F]ind existing [b]uffers" })
            vim.keymap.set("n", "<leader>fm", builtin.marks, { desc = "[F]ind [M]arks" })
            vim.keymap.set("n", "<leader>f.", function()
                builtin.find_files({
                    cwd = vim.fn.expand("%:p:h")
                })
            end, { desc = "[F]ind in [.] cwd"})
            vim.keymap.set("n", "<leader>gs", builtin.git_status, { desc = "find [G]it [S]tatus" })
            vim.keymap.set("n", "<leader>gf", builtin.git_files, { desc = "find [G]it [F]iles" })
            vim.keymap.set('n', '<leader>gc', builtin.git_bcommits, { desc = "Search [G]it [C]ommits for Buffer"})
            vim.keymap.set('n', '<leader>gC', builtin.git_commits, { desc = "Search [G]it [C]ommits"})
        end
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build =
        "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
    },
}
