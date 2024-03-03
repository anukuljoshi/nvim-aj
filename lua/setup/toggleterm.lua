function _G.set_terminal_keymaps()
    local opts = {buffer = 0}
    vim.keymap.set("t", "jk", [[<Cmd>ToggleTermToggleAll<CR>]], opts)
    vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
    vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
    vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
    vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

-- open terminal
vim.api.nvim_set_keymap(
    "n",
    "<leader>th",
    "<cmd>ToggleTerm direction=horizontal<CR>",
    {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
    "n",
    "<leader>tv",
    "<cmd>ToggleTerm size=60 direction=vertical<CR>",
    {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
    "n",
    "<leader>tf",
    "<cmd>ToggleTerm direction=float<CR>",
    {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
    "n",
    "<leader>tb",
    "<cmd>ToggleTerm direction=tab<CR>",
    {noremap = true, silent = true}
)
