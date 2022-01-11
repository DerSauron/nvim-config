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
local Terminal = require("toggleterm.terminal").Terminal

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
    local gitui_term = Terminal:new({cmd = cmd, hidden = true})
    gitui_term:toggle()
end

vim.cmd("command! Git lua toggle_gitui()")
