local hop = require("hop")

function Search_char_bidirectional()
    hop.hint_char1()
end
vim.keymap.set("", "s", Search_char_bidirectional)

function Jump_lines()
    hop.hint_vertical()
end
vim.keymap.set("", "<leader>g", Jump_lines)

