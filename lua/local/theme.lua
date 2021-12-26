local color_scheme = "dracula"

vim.cmd([[
    try
        colorscheme ]] .. color_scheme .. [[

    catch /^Vim\%((\a\+)\)\=:E185/
        echo "color scheme ]] .. color_scheme .. [["
        colorscheme default
        set background=dark
    endtry
]])
