--[[ keys.lua ]]

-- This function takes in four parameters:
--     mode: the mode you want the key bind to apply to (e.g., insert mode, normal mode, command mode, visual mode).
--     sequence: the sequence of keys to press.
--     command: the command you want the keypresses to execute.
--     options: an optional Lua table of options to configure (e.g., silent or noremap).

-- center cusror on screen when moving
vim.keymap.set("", "<C-d>", "<C-d>zz")
vim.keymap.set("", "<C-u>", "<C-u>zz")
vim.keymap.set({ "n", "v" }, "n", "nzzzv")
vim.keymap.set({ "n", "v" }, "N", "Nzzzv")

-- move between splits
vim.keymap.set("", "<C-j>", "<C-w>j")
vim.keymap.set("", "<C-k>", "<C-w>k")
vim.keymap.set("", "<C-h>", "<C-w>h")
vim.keymap.set("", "<C-l>", "<C-w>l")

-- append next line to current line without moving the cursor
vim.keymap.set("n", "J", "mzJ`z")

-- gg moves cursor to start of first line
vim.keymap.set({ "n", "v" }, "gg", "gg0")
-- G moves cursor to end of last line
vim.keymap.set({ "n", "v" }, "G", "G$")

-- copy from cursor to end of line
vim.keymap.set("n", "Y", "y$")

-- requires clipboard set up for neovim see :help clipboard
-- install xclip | sudo apt install xclip
-- copy to system clipboard register
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set({ "n", "v" }, "<leader>Y", [["+Y]])
-- paste from system clipboard
vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]])
vim.keymap.set({ "n", "v" }, "<leader>P", [["+P]])

-- delete to void register
vim.keymap.set({ "n", "v" }, "<leader>d", "\"_d")
vim.keymap.set({ "n", "v" }, "<leader>D", "\"_D")
vim.keymap.set({ "n", "v" }, "<leader>c", "\"_c")
vim.keymap.set({ "n", "v" }, "<leader>C", "\"_C")

-- delete to void register when pasting over a selection
vim.keymap.set("x", "<leader>p", [["_dP]])

-- map register n to <leader>n
vim.keymap.set("n", "<leader>1", [["1]])
vim.keymap.set("n", "<leader>2", [["2]])
vim.keymap.set("n", "<leader>3", [["3]])
vim.keymap.set("n", "<leader>4", [["4]])
vim.keymap.set("n", "<leader>5", [["5]])
vim.keymap.set("n", "<leader>6", [["6]])
vim.keymap.set("n", "<leader>7", [["7]])
vim.keymap.set("n", "<leader>8", [["8]])
vim.keymap.set("n", "<leader>9", [["9]])

-- remove highlighted text
vim.keymap.set("n", "<leader><leader>", "<cmd>nohl<CR>")

-- keep text highlighted after indent/outdent
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- quickfix list movement
local function quickFixToggle()
    local qf_exists = false
    for _, win in pairs(vim.fn.getwininfo()) do
        if win["quickfix"] == 1 then
            qf_exists = true
        end
    end
    if qf_exists == true then
        vim.cmd "cclose"
        return
    end
    if not vim.tbl_isempty(vim.fn.getqflist()) then
        vim.cmd "copen"
    end
end

vim.keymap.set("n", "<leader>qo", quickFixToggle)
vim.keymap.set("n", "<leader>qn", "<cmd>cnext<cr>")
vim.keymap.set("n", "<leader>qp", "<cmd>cprev<cr>")

vim.keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
vim.keymap.set("n", "<leader>si", ":close<CR>") -- close current split window
vim.keymap.set("n", "<leader>so", "<C-w>o") -- close other split windows

require("keys.cmd")
