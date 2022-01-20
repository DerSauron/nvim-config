local tok, toggleterm = pcall(require, "toggleterm")
if not tok then
    print("Plugin toggleterm not found")
    return
end

toggleterm.setup({
    size = 20,
    open_mapping = [[<C-\>]],
    hide_numbers = true,
    start_in_insert = true,
    direction = "float",
    float_opts = {
        border = "curved",
    },
})

local Path = require("plenary.path")
local terms = require("toggleterm.terminal")

local function find_closest_git_dir()
    local current_file = vim.api.nvim_buf_get_name(0)
    local bases = Path:new(current_file):parents()
    table.insert(bases, 1, current_file)
    for _, p in ipairs(bases) do
        local path = Path:new(p, ".git")
        if path:exists() then
            return p
        end
    end
end

function _G.toggle_gitui()
    local git_dir = find_closest_git_dir()
    if not git_dir then
        print("Not in a git repository")
        return
    end

    local cmd = "gitui -d " .. git_dir .. " -w " .. git_dir
    print(cmd)
    local gitui_term = terms.Terminal:new({
        cmd = cmd,
        hidden = true,
        dir = git_dir,
        close_on_exit = true,
        direction = "float",
    })
    gitui_term:toggle()
end

function _G.toggle_term_direction()
    local term_num = terms.get_toggled_id()
    if not term_num then return end

    local term = terms.get(term_num)
    if not term or not term:is_open() then return end

    local direction
    if term:is_float() then
        direction = "horizontal"
    else
        direction = "float"
    end
    term:close()
    term:open(nil, direction)
end

vim.cmd("command! Git lua toggle_gitui()")
