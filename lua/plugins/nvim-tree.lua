local keymap = vim.keymap

local function my_on_attach(bufnr)
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
    keymap.set('n', '<leader>e', '<Cmd>NvimTreeToggle<CR>', {
        silent = true
    })
    keymap.set('n', '<leader>E', '<Cmd>NvimTreeFindFile<CR>z.', {
        silent = true
    })
    keymap.set(
        'n',
        'h',
        api.node.navigate.parent_close,
        opts('Parent')
    )
    keymap.set(
        'n',
        'l',
        api.node.open.edit,
        opts('Edit')
    )
end

return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
        on_attach = my_on_attach,
        hijack_cursor = true,
        disable_netrw = true,
        hijack_netrw = true,
        view = {
            side = "right",
        },
    }
}
