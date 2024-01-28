--[[ init.lua ]]

-- LEADER
-- These keybindings need to be defined before the first /
-- is called; otherwise, it will default to " "
vim.g.mapleader = " "
vim.g.localleader = " "

require("vars") -- Variables
require("opts") -- Options
require("plug")
require("colors")
require("projects")
require("keys") -- Keymaps

print("hello aj")
