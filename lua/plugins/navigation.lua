return {
    {
        "chentoast/marks.nvim",
        config = function ()
            require("marks").setup({
                -- whether to map keybinds or not. default true
                default_mappings = true,
                -- which builtin marks to show. default {}
                -- builtin_marks = { ".", "<", ">", "^" },
                -- whether movements cycle back to the beginning/end of buffer. default true
                cyclic = true,
                -- whether the shada file is updated after modifying uppercase marks. default false
                force_write_shada = true,
                -- how often (in ms) to redraw signs/recompute mark positions.
                -- higher values will have better performance but may cause visual lag,
                -- while lower values may cause performance penalties. default 150.
                refresh_interval = 250,
                -- sign priorities for each type of mark - builtin marks, uppercase marks, lowercase
                -- marks, and bookmarks.
                -- can be either a table with all/none of the keys, or a single number, in which case
                -- the priority applies to all marks.
                -- default 10.
                sign_priority = { lower=10, upper=15, builtin=8, bookmark=20 },
                -- disables mark tracking for specific filetypes. default {}
                excluded_filetypes = {},
                -- disables mark tracking for specific buftypes. default {}
                excluded_buftypes = {},
                -- marks.nvim allows you to configure up to 10 bookmark groups, each with its own
                -- sign/virttext. Bookmarks can be used to group together positions and quickly move
                -- across multiple buffers. default sign is "!@#$%^&*()" (from 0 to 9), and
                -- default virt_text is "".
                bookmark_0 = {
                    sign = "⚑",
                    virt_text = "hello world",
                    -- explicitly prompt for a virtual line annotation when setting a bookmark from this group.
                    -- defaults to false.
                    annotate = false,
                },
                mappings = {}
            })
            vim.keymap.set("n", "<leader>dm", "<Cmd>delm! | delm A-Z0-9<CR>")
            vim.keymap.set("n", "<leader>df", "<Cmd>delmarks a-z<CR>")

            -- vim.keymap.set("n", "<leader>dm", "<Cmd>delmarks a-z<CR>")
            -- vim.keymap.set("n", "<leader>Dm", "<Cmd>delmarks A-Z<CR>")
            -- vim.keymap.set("n", "", "<Cmd>delm! | delm A-Z0-9<CR>")
        end
    },
    -- {
    --     "BartSte/nvim-project-marks",
    --     config = function ()
    --         require("projectmarks").setup({
    --             -- If set to a string, the path to the shada file is set to the given value.
    --             -- If set to a boolean, the global shada file of neovim is used.
    --             shadafile = "nvim.shada",
    --
    --             -- If set to true, the """ and "`" mappings are are appended by the
    --             -- `last_position`, and `last_column_position` functions, respectively.
    --             mappings = true,
    --
    --             -- Message to be displayed when jumping to a mark.
    --             message = "Waiting for mark..."
    --         })
    --
    --         local function createFileIfNotExists(filepath)
    --             local stat, err = vim.loop.fs_stat(filepath)
    --
    --             if not stat then
    --                 -- File doesn"t exist, create it
    --                 local file, open_err = io.open(filepath, "w")
    --
    --                 if file then
    --                     file:close()
    --                 else
    --                     print("Error creating file: " .. open_err)
    --                 end
    --             end
    --         end
    --
    --         local filepath = vim.fn.getcwd() .. "/" .. "nvim.shada"
    --         createFileIfNotExists(filepath)
    --     end
    -- },
}
