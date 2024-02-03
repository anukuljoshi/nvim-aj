local icons = require("statusline.icons")

local M = {}

-- Don't show the command that produced the quickfix list.
vim.g.qf_disable_statusline = 1

-- Show the mode in my custom component instead.
vim.o.showmode = false

--- Keeps track of the highlight groups I've already created.
---@type table<string, boolean>
local statusline_hls = {}

---@param hl string
---@return string
function M.get_or_create_hl(hl)
    local hl_name = 'Statusline' .. hl

    if not statusline_hls[hl] then
        -- If not in the cache, create the highlight group using the icon's foreground color
        -- and the statusline's background color.
        local bg_hl = vim.api.nvim_get_hl(0, { name = 'StatusLine' })
        local fg_hl = vim.api.nvim_get_hl(0, { name = hl })
        vim.api.nvim_set_hl(0, hl_name, { bg = ('#%06x'):format(bg_hl.bg), fg = ('#%06x'):format(fg_hl.fg) })
        statusline_hls[hl] = true
    end

    return hl_name
end

--- Current mode.
---@return string
function M.mode_component()
    -- Note that: \19 = ^S and \22 = ^V.
    local mode_to_str = {
        ['n'] = 'NORMAL',
        ['no'] = 'OP-PENDING',
        ['nov'] = 'OP-PENDING',
        ['noV'] = 'OP-PENDING',
        ['no\22'] = 'OP-PENDING',
        ['niI'] = 'NORMAL',
        ['niR'] = 'NORMAL',
        ['niV'] = 'NORMAL',
        ['nt'] = 'NORMAL',
        ['ntT'] = 'NORMAL',
        ['v'] = 'VISUAL',
        ['vs'] = 'VISUAL',
        ['V'] = 'VISUAL',
        ['Vs'] = 'VISUAL',
        ['\22'] = 'VISUAL',
        ['\22s'] = 'VISUAL',
        ['s'] = 'SELECT',
        ['S'] = 'SELECT',
        ['\19'] = 'SELECT',
        ['i'] = 'INSERT',
        ['ic'] = 'INSERT',
        ['ix'] = 'INSERT',
        ['R'] = 'REPLACE',
        ['Rc'] = 'REPLACE',
        ['Rx'] = 'REPLACE',
        ['Rv'] = 'VIRT REPLACE',
        ['Rvc'] = 'VIRT REPLACE',
        ['Rvx'] = 'VIRT REPLACE',
        ['c'] = 'COMMAND',
        ['cv'] = 'VIM EX',
        ['ce'] = 'EX',
        ['r'] = 'PROMPT',
        ['rm'] = 'MORE',
        ['r?'] = 'CONFIRM',
        ['!'] = 'SHELL',
        ['t'] = 'TERMINAL',
    }

    -- Get the respective string to display.
    local mode = mode_to_str[vim.api.nvim_get_mode().mode] or 'UNKNOWN'

    -- Set the highlight group.
    local hl = 'Other'
    if mode:find 'NORMAL' then
        hl = 'Normal'
    elseif mode:find 'PENDING' then
        hl = 'Pending'
    elseif mode:find 'VISUAL' then
        hl = 'Visual'
    elseif mode:find 'INSERT' or mode:find 'SELECT' then
        hl = 'Insert'
    elseif mode:find 'COMMAND' or mode:find 'TERMINAL' or mode:find 'EX' then
        hl = 'Command'
    end

    -- Construct the bubble-like component.
    return table.concat {
        string.format('%%#StatuslineModeSeparator%s#  ', hl),
        string.format('%%#StatuslineMode%s#%s', hl, mode),
        string.format('%%#StatuslineModeSeparator%s# ', hl),
    }
end

--- Git status (if any).
---@return string
function M.git_component()
    local head = vim.b.gitsigns_head
    if not head then
        return ''
    end

    return string.format(' %s', head)
end


--- Filename
---@return string
function M.filename_component()
    -- filename with parent dir
    local filename = vim.fn.expand('%:p:h:t') .. '/' .. vim.fn.expand('%:t')
    -- filename with base project
    -- local filename = vim.fn.expand('%:p:.') .. '/' .. vim.fn.expand('%:t')
    return filename
end

--- The buffer's filetype.
---@return string
function M.filetype_component()
    local devicons = require("nvim-web-devicons")

    -- Special icons for some filetypes.
    local special_icons = {
        DressingInput = { '󰍩', 'Comment' },
        DressingSelect = { '', 'Comment' },
        OverseerForm = { '󰦬', 'Special' },
        OverseerList = { '󰦬', 'Special' },
        fzf = { '', 'Special' },
        gitcommit = { icons.misc.git, 'Number' },
        gitrebase = { icons.misc.git, 'Number' },
        kitty_scrollback = { '󰄛', 'Conditional' },
        lazy = { icons.symbol_kinds.Method, 'Special' },
        lazyterm = { '', 'Special' },
        minifiles = { icons.symbol_kinds.Folder, 'Directory' },
        qf = { icons.misc.search, 'Conditional' },
        spectre_panel = { icons.misc.search, 'Constant' },
    }

    local filetype = vim.bo.filetype
    if filetype == '' then
        filetype = '[No Name]'
    end

    local icon, icon_hl
    if special_icons[filetype] then
        icon, icon_hl = unpack(special_icons[filetype])
    else
        local buf_name = vim.api.nvim_buf_get_name(0)
        local name, ext = vim.fn.fnamemodify(buf_name, ':t'), vim.fn.fnamemodify(buf_name, ':e')

        icon, icon_hl = devicons.get_icon(name, ext)
        if not icon then
            icon, icon_hl = devicons.get_icon_by_filetype(filetype, { default = true })
        end
    end
    icon_hl = M.get_or_create_hl(icon_hl)

    return string.format('%%#%s#%s %%#StatuslineTitle#%s', icon_hl, icon, filetype)
end

--- File-content encoding for the current buffer.
---@return string
function M.encoding_component()
    local encoding = vim.opt.fileencoding:get()
    return encoding ~= '' and string.format('%%#StatuslineModeSeparatorOther# %s', encoding) or ''
end

--- The current line, total line count, and column position.
---@return string
function M.position_component()
    local line = vim.fn.line '.'
    local line_count = vim.api.nvim_buf_line_count(0)
    local col = vim.fn.virtcol '.'

    return table.concat {
        '%#StatuslineItalic#l: ',
        string.format('%%#StatuslineTitle#%d', line),
        string.format('%%#StatuslineItalic#/%d c: %d', line_count, col),
    }
end

--- Renders the statusline.
---@return string
function M.render()
    ---@param components string[]
    ---@return string
    local function concat_components(components)
        local result = components[1]
        for i = 2, #components do
            if #components[i]>0 then
                result = result .. ' | ' .. components[i]
            end
        end
        return result
    end

    return table.concat {
        concat_components {
            M.mode_component(),
            M.git_component(),
            M.filename_component(),
        },
        '%#StatusLine#%=',
        concat_components {
            M.filetype_component(),
            M.encoding_component(),
            M.position_component(),
        },
        ' ',
    }
end
vim.o.statusline = "%!v:lua.require'statusline'.render()"

return M
