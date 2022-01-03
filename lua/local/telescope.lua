local ok, telescope = pcall(require, "telescope")
if not ok then
    print "Plugin telesope not found"
    return
end

local actions = require("telescope.actions")
local previewers = require("telescope.previewers")
local Job = require("plenary.job")

local preview_maker = function(filepath, bufnr, opts)
    opts = opts or {}
    filepath = vim.fn.expand(filepath)

    Job:new({
        command = "file",
        args = { "--mime-type", "-b", filepath },
        on_exit = function(j)
            local mime_type = vim.split(j:result()[1], "/")[1]
            if mime_type == "text" then
                vim.loop.fs_stat(filepath, function(_, stat)
                    if not stat then return end
                    if stat.size > 100000 then
                        vim.schedule(function()
                            vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "FILE TOO LARGE" })
                        end)
                    else
                        previewers.buffer_previewer_maker(filepath, bufnr, opts)
                    end
                end)
            else
                vim.schedule(function()
                    vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "BINARY" })
                end)
            end
        end
    }):sync()
end

telescope.setup({
    defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        path_display = { "smart" },
        buffer_previewer_maker = preview_maker,
        mappings = {
            i = {
                ["<esc>"] = actions.close
            },
        },
    },
    pickers = {
        buffers = {
            sort_mru = true,
            ignore_current_buffer = true,
        }
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        }
    }
})

telescope.load_extension("fzy_native")
