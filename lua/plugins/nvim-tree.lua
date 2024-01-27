local keymap = vim.keymap

local function on_attach(bufnr)
    local api = require "nvim-tree.api"
    local function opts(desc)
        return {
            desc = "nvim-tree: " .. desc,
            buffer = bufnr,
            noremap = true,
            silent = true,
            nowait = true
        }
    end

    -- default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- custom mappings
    -- open nvim-tree
    -- keymap.set("n", "<leader>ex", "<Cmd>NvimTreeToggle<CR>", {
    --     silent = true
    -- })
    -- open nvim-tree with focus on current file
    keymap.set("n", "<leader>e", "<Cmd>NvimTreeFindFile<CR>z.", {
        silent = true
    })
    keymap.set(
        "n",
        "h",
        api.node.navigate.parent_close,
        opts("Parent")
    )
    keymap.set(
        "n",
        "l",
        api.node.open.edit,
        opts("Edit")
    )
end

return {
    -- nvim tree
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        opts = {},
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup({
                on_attach = on_attach,
                hijack_cursor = true,
                disable_netrw = true,
                hijack_netrw = true,
                view = {
                    side = "right",
                },
                actions = {
                    open_file = {
                        quit_on_open = true,
                    },
                },
            })
        end
    },
}
