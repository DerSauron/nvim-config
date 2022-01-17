local dap_ok, _ = pcall(require, "dap")
if not dap_ok then
    print("Plugin dap not found")
    return
end

local dap_vt_ok, dap_vt = pcall(require, "nvim-dap-virtual-text")
if not dap_vt_ok then
    print("Plugin dap virtual text not found")
    return
end

dap_vt.setup({
    enabled = true,
})

require("local.dap-loader.debuggers.php")
require("local.dap-loader.debuggers.nvim-lua")
