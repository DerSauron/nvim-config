local ok, npairs = pcall(require, "nvim-autopairs")
if not ok then
    print("Plugin autopairs not found")
    return
end

local cmp_autopairs = require("nvim-autopairs.completion.cmp")

npairs.setup({
    check_ts = true,
    ts_config = {
    },
    disable_filetype = { "TelescopePrompt", "spectre_panel" },
    fast_wrap = {
        map = "<M-e>",
        chars = { "{", "[", "(", "\"", "'" },
        pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
        offset = 0, -- Offset from pattern match
        end_key = "$",
        keys = "qwertyuiopzxcvbnmasdfghjkl",
        check_comma = true,
        highlight = "PmenuSel",
        highlight_grey = "LineNr",
    },
    ignored_next_char = "[%w%.]",
})

local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
    print("Plugin cmp not found while configuring autopairs")
    return
end

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({map_char = {tex = "" }}))
