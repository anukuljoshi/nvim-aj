local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system(
        {"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
         lazypath})
end
vim.opt.rtp:prepend(lazypath)

-- plugins: this should be a table or a string
--     table: a list with your Plugin Spec
--     string: a Lua module name that contains your Plugin Spec. See Structuring Your Plugins
-- opts: see Configuration (optional)
plugins = {
    require("plug.which-key"),
    require("plug.telescope"),
    require("plug.lsp"),
    require("plug.catpuccin"),
    require("plug.hop"),
}

require("lazy").setup(plugins, opts)
