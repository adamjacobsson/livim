return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    -- or                              , branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local actions = require("telescope.actions")
        local builtin = require('telescope.builtin')

        local function open_split(prompt_bufnr, splitright)
            local original = vim.o.splitright
            vim.o.splitright = splitright
            local ok, err = pcall(actions.select_vertical, prompt_bufnr)
            vim.o.splitright = original
            if not ok then
                error(err)
            end
        end

        local function open_split_right(prompt_bufnr)
            open_split(prompt_bufnr, true)
        end

        local function open_split_left(prompt_bufnr)
            open_split(prompt_bufnr, false)
        end

        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        vim.keymap.set('n', '<leader>fw', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
        require("telescope").setup({
            pickers = {
                current_buffer_fuzzy_find = { sorting_strategy = 'ascending' },
            },
            defaults = {
                sorting_strategy = "ascending",
                file_ignore_patterns = {
                    "%.venv/",
                    "venv/",
                },
                mappings = {
                    i = {
                        ["<S-Tab>"] = actions.move_selection_previous,
                        ["<Tab>"] = actions.move_selection_next,
                        ["<C-l>"] = open_split_right,
                        ["<C-h>"] = open_split_left,
                    },
                    n = {
                        ["<C-l>"] = open_split_right,
                        ["<C-h>"] = open_split_left,
                    },
                },
                layout_config = {
                    horizontal = {
                        prompt_position = "top",
                        preview_width = 0.55,
                        results_width = 0.8,
                    },
                    vertical = {
                        mirror = false,
                    },
                    width = 0.87,
                    height = 0.80,
                    preview_cutoff = 120,
                },
            }
        })
    end
}
