function _G.map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

function _G.nmap(lhs, rhs, opts)
    map('n', lhs, rhs, opts)
end

function _G.imap(lhs, rhs, opts)
    map('i', lhs, rhs, opts)
end

function _G.vmap(lhs, rhs, opts)
    map('v', lhs, rhs, opts)
end

function _G.tmap(lhs, rhs, opts)
    map('t', lhs, rhs, opts)
end

function _G.reload_config()
  for name,_ in pairs(package.loaded) do
    if name:match('^cnull') then
      package.loaded[name] = nil
    end
  end

  dofile(vim.env.MYVIMRC)
end
vim.cmd('command! ReloadConfig lua reload_config()')
