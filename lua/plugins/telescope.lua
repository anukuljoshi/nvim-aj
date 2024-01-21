return {
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {'nvim-lua/plenary.nvim'},
        config = function()
            require("telescope").load_extension("fzf")
            local builtin = require('telescope.builtin')
            vim.keymap.set(
                "n",
                "<leader>fa",
                function ()
                    builtin.find_files({
                        find_command = {'rg', '--files', '--hidden', '-g', '!.git', '--no-ignore-vcs' }
                    })
                end,
                {}
            )
            -- vim.keymap.set("n", "<leader>fa", builtin.find_files, {})
            vim.keymap.set("n", "<leader>fw", builtin.live_grep, {})
            vim.keymap.set("n", "<leader>fg", builtin.git_files, {})
            vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
            vim.keymap.set(
                'n', '<leader>.',
                function()
                    builtin.find_files({ cwd = vim.fn.expand('%:p:h') })
                end
            )
        end,
        opts = {
            pickers = {
                find_files = {
                    hidden = true
                }
            },
        },
    },
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
    }
}
