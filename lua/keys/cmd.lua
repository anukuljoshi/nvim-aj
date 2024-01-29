local augroup = vim.api.nvim_create_augroup
local ajGroup = augroup("AJ", {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup("HighlightYank", {})

function R(name)
    require("plenary.reload").reload_module(name)
end

autocmd("TextYankPost", {
    group = yank_group,
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({
            higroup = "IncSearch",
            timeout = 40,
        })
    end,
})

autocmd({ "BufWritePre" }, {
    group = ajGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

autocmd({ "LspAttach" }, {
    group = ajGroup,
    callback = function(e)
        local function optsCreate(desc)
            return {
                buffer = e.buf,
                desc = desc,
            }
        end
        vim.keymap.set(
            "n", "gd",
            vim.lsp.buf.definition,
            optsCreate("LSP [G]oto [D]efinition")
        )
        vim.keymap.set(
            "n", "gr",
            require("telescope.builtin").lsp_references,
            optsCreate("LSP [G]oto [R]eferences")
        )
        vim.keymap.set(
            "n", "gI",
            vim.lsp.buf.implementation,
            optsCreate("LSP [G]oto [I]mplementation")
        )
        vim.keymap.set(
            "n", "<leader>cr",
            vim.lsp.buf.rename,
            optsCreate("LSP [R]e[n]ame")
        )
        vim.keymap.set(
            "n", "<leader>ca",
            vim.lsp.buf.code_action,
            optsCreate("LSP [C]ode [A]ction")
        )
        vim.keymap.set(
            "n", "gt",
            vim.lsp.buf.type_definition,
            optsCreate("[G]oto [T]ype [D]efinition")
        )
        vim.keymap.set(
            "n", "<leader>ds",
            require("telescope.builtin").lsp_document_symbols,
            optsCreate("[D]ocument [S]ymbols")
        )
        vim.keymap.set(
            "n", "<leader>ws",
            require("telescope.builtin").lsp_dynamic_workspace_symbols,
            optsCreate("[W]orkspace [S]ymbols")
        )
        -- Lesser used LSP functionality
        vim.keymap.set(
            "n", "gD",
            vim.lsp.buf.declaration,
            optsCreate("[G]oto [D]eclaration")
        )
        -- See `:help K` for why this keymap
        vim.keymap.set(
            "n", "K",
            vim.lsp.buf.hover,
            optsCreate("Hover Documentation")
        )
        vim.keymap.set(
            { "i", "n" }, "<C-k>",
            vim.lsp.buf.signature_help,
            optsCreate("Signature Documentation")
        )
        -- Create a command `:Format` local to the LSP buffer
        vim.api.nvim_buf_create_user_command(e.buf, "Format", function()
            if vim.lsp.buf.format then
                vim.lsp.buf.format()
            elseif vim.lsp.buf.formatting then
                vim.lsp.buf.formatting()
            end
        end, { desc = "Format current buffer with LSP" })
        vim.keymap.set(
            "n", "<leader>cf",
            "<Cmd>Format<CR>",
            optsCreate("Format current buffer")
        )
    end,
})
