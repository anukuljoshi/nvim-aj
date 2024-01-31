-- Create the '.vim' directory if it doesn't exist
vim.fn.mkdir('.vim', 'p')

-- Autocommands
vim.cmd([[
  autocmd VimEnter *
        \ if filereadable('.vim/Session.vim') |
        \     source .vim/Session.vim |
        \ endif
]])

vim.cmd([[
  autocmd VimLeavePre *
        \ mksession! .vim/session.vim
]])

-- Shadafile/Viminfo settings
if vim.fn.has('nvim') == 1 then
    vim.o.shadafile = '.vim/main.shada'
else
    vim.o.viminfofile = '.vim/.viminfo'
end
