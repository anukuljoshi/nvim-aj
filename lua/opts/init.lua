--[[ opts.lua ]]

-- [[ Context ]]
vim.opt.colorcolumn = "80"    -- str:  Show col for max line length
vim.opt.number = true         -- bool: Show line numbers
vim.opt.relativenumber = true -- bool: Show relative line numbers
vim.opt.scrolloff = 4         -- int:  Min num lines of context

-- [[ Filetypes ]]
vim.opt.encoding = "utf8"     -- str:  String encoding to use
vim.opt.fileencoding = "utf8" -- str:  File encoding to use

-- [[ Theme ]]
vim.opt.syntax = "ON"        -- str:  Allow syntax highlighting
vim.opt.termguicolors = true -- bool: If term supports ui color then enable

-- [[ Search ]]
vim.opt.ignorecase = true -- bool: Ignore case in search patterns
vim.opt.smartcase = true  -- bool: Override ignorecase if search contains capitals
vim.opt.incsearch = true  -- bool: Use incremental search
vim.opt.hlsearch = true   -- bool: Highlight search matches

-- [[ Whitespace ]]
vim.opt.expandtab = true -- bool: Use spaces instead of tabs
vim.opt.shiftwidth = 4   -- num:  Size of an indent
vim.opt.softtabstop = 4  -- num:  Number of spaces tabs count for in insert mode
vim.opt.tabstop = 4      -- num:  Number of spaces tabs count for

-- [[ Splits ]]
vim.opt.splitright = true -- bool: Place new window to right of current one
vim.opt.splitbelow = true -- bool: Place new window below the current one
vim.o.diffopt = vim.o.diffopt .. ',vertical'

vim.opt.signcolumn = "yes"
vim.diagnostic.config({
    update_in_insert = true,
    float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
    },
})

vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
