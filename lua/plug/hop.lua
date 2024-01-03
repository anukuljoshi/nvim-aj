local hop = require("hop")
local directions = require("hop.hint").HintDirection

function Search_char_bidirectional()
    hop.hint_char1()
end
vim.keymap.set("", "s", Search_char_bidirectional)

function Search_char2_bidirectional()
    hop.hint_char2()
end
vim.keymap.set("", "<leader>s", Search_char2_bidirectional)

function Search_words_forward()
    hop.hint_words({
        direction = directions.AFTER_CURSOR
    })
end
vim.keymap.set("", "<leader>w", Search_words_forward)

function Search_words_backward()
    hop.hint_words({
        direction = directions.BEFORE_CURSOR
    })
end
vim.keymap.set("", "<leader>b", Search_words_backward)

function Jump_lines()
    hop.hint_vertical()
end
vim.keymap.set("", "<leader>g", Jump_lines)

