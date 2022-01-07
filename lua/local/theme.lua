local color_scheme = "dracula"

vim.cmd([[
    try
        colorscheme ]] .. color_scheme .. [[

    catch /^Vim\%((\a\+)\)\=:E185/
        echo "Color scheme ]] .. color_scheme .. [[ not found"
        colorscheme default
        set background=dark
    endtry
]])
