local dap = require("dap")
local _, cfg = pcall(require, "env.dap.php")

dap.adapters.php = {
    type = 'executable',
    command = 'node',
    args = { cfg.home_dir },
}

dap.configurations.php = {
    {
        type = 'php',
        request = 'launch',
        name = 'Listen for Xdebug',
        port = cfg.listen_port or 9000,
    }
}
