return {
    -- telescope
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {},
        config = function()
            -- use fzf
            require("telescope").setup({
                defaults = {
                    layout_config = {
                        horizontal = {
                            preview_width = 0.65,
                        },
                    },
                },
                pickers = {
                    buffers = {
                        show_all_buffers = true,
                        sort_lastused = true,
                        theme = "dropdown",
                        previewer = false,
                        mappings = {
                            i = {
                                ["<c-d>"] = "delete_buffer",
                            },
                            n = {
                                ["dd"] = "delete_buffer",
                            }
                        }
                    }
                }
            })
            require("telescope").load_extension("fzf")
            local builtin = require("telescope.builtin")

            -- custom keymaps
            -- files
            vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
            vim.keymap.set("n", "<leader>fa", function()
                builtin.find_files({
                    hidden = true
                })
            end, { desc = "[F]ind [A]ll (including hidden)"})
            vim.keymap.set("n", "<leader>f.", function()
                builtin.find_files({
                    cwd = vim.fn.expand("%:p:h")
                })
            end, { desc = "[F]ind in [.] cwd"})
            vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "[F]ind [O]ld files" })

            -- search
            vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "[F]ind current [W]ord" })
            vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "[F]ind search by [G]rep" })
            vim.keymap.set("n", "<leader>fh", builtin.search_history, { desc = "[F]ind Search [H]istory" })

            -- neovim
            vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "[F]ind existing [b]uffers" })
            vim.keymap.set("n", "<leader>fm", builtin.marks, { desc = "[F]ind [M]arks" })
            vim.keymap.set("n", "<leader>fq", builtin.quickfix, { desc = "[F]ind [Q]uickfix" })
            vim.keymap.set("n", "<leader>fj", builtin.jumplist, { desc = "[F]ind [J]ump list" })
            vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "[F]ind [D]iagnostics" })

            -- git
            vim.keymap.set("n", "<leader>gg", builtin.git_status, { desc = "find [G]it [S]tatus" })
            vim.keymap.set("n", "<leader>gf", builtin.git_files, { desc = "find [G]it [F]iles" })
            vim.keymap.set("n", "<leader>gc", builtin.git_bcommits, { desc = "Search [G]it [C]ommits for Buffer"})
            vim.keymap.set("n", "<leader>gC", builtin.git_commits, { desc = "Search [G]it [C]ommits"})
            vim.keymap.set("n", "<leader>gb", builtin.git_branches, { desc = "Search [G]it [B]ranches"})
            vim.keymap.set("n", "<leader>gs", builtin.git_stash, { desc = "Search [G]it [S]tash list"})

            -- -- treesitter
            -- vim.keymap.set("n", "<leader>tt", builtin.treesitter, { desc = "[F]ind [T]reesitter objects"})

            -- extras
            vim.keymap.set("n", "<leader>fc", builtin.colorscheme, { desc = "[F]ind [C]olorscheme" })
        end
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build =
        "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
    },
}
