--[[ keys.lua ]]
local map = vim.keymap.set

-- This function takes in four parameters:
--     mode: the mode you want the key bind to apply to (e.g., insert mode, normal mode, command mode, visual mode).
--     sequence: the sequence of keys to press.
--     command: the command you want the keypresses to execute.
--     options: an optional Lua table of options to configure (e.g., silent or noremap).

-- center cusror on screen when moving
map("", "<C-d>", "<C-d>zz")
map("", "<C-u>", "<C-u>zz")
map({"n", "v"}, "n", "nzzzv")
map({"n", "v"}, "N", "Nzzzv")

-- move between splits
map("", "<C-j>", "<C-w>j")
map("", "<C-k>", "<C-w>k")
map("", "<C-h>", "<C-w>h")
map("", "<C-l>", "<C-w>l")

-- append next line to current line without moving the cursor
map("n", "J", "mzJ`z")

-- gg moves cursor to start of first line
map("n", "gg", "gg0")
-- G moves cursor to end of last line
map("n", "G", "G$")

-- copy from cursor to end of line
map("n", "Y", "y$")

-- requires clipboard set up for neovim see :help clipboard
-- install xclip | sudo apt install xclip
-- copy to system clipboard register
map({"n", "v"}, "<leader>y", [["+y]])
map({"n", "v"}, "<leader>Y", [["+Y]])
-- paste from system clipboard
map({"n", "v"}, "<leader>p", [["+p]])
map({"n", "v"}, "<leader>P", [["+P]])

-- delete to void register
map({"n", "v"}, "<leader>d", "\"_d")
map({"n", "v"}, "<leader>D", "\"_D")
map({"n", "v"}, "<leader>c", "\"_c")
map({"n", "v"}, "<leader>C", "\"_C")

-- delete to void register when pasting over a selection
map("x", "<leader>p", [["_dP]])

-- map register n to <leader>n
map("n", "<leader>1", [["1]])
map("n", "<leader>2", [["2]])
map("n", "<leader>3", [["3]])
map("n", "<leader>4", [["4]])
map("n", "<leader>5", [["5]])
map("n", "<leader>6", [["6]])
map("n", "<leader>7", [["7]])
map("n", "<leader>8", [["8]])
map("n", "<leader>9", [["9]])

-- remove highlighted text
map("n", "<leader>n", ":nohl<CR>")

-- keep text highlighted after indent/outdent
map("v", "<", "<gv")
map("v", ">", ">gv")

