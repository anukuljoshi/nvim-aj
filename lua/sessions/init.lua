-- Create the ".vim" directory if it doesn"t exist
vim.fn.mkdir(".vim", "p")

-- Define a function to save the session
function SaveSession()
    -- if vim.fn.argc() == 0 then
        vim.cmd("mksession! .vim/session.vim")
    -- end
end

-- Define a function to load the session
function LoadSession()
    -- if vim.fn.argc() == 0 then
        local sessionPath = vim.fn.expand(".vim/session.vim")
        if vim.fn.filereadable(sessionPath) == 1 then
            vim.cmd("source " .. sessionPath)
        end
    -- end
end

-- Set up the autocmd
-- load on enter
vim.cmd([[
  augroup LoadSession
  autocmd!
  autocmd VimEnter * nested lua LoadSession()
  augroup END
]])

-- save on exit
vim.cmd([[
  augroup SaveSession
    autocmd!
    autocmd VimLeavePre * lua SaveSession()
  augroup END
]])

-- Shadafile/Viminfo settings
if vim.fn.has("nvim") == 1 then
    vim.o.shadafile = ".vim/main.shada"
else
    vim.o.viminfofile = ".vim/.viminfo"
end
