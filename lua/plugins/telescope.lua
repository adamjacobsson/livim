return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
-- or                              , branch = '0.1.x',
      dependencies = { 'nvim-lua/plenary.nvim' },
      config = function()
      local actions = require("telescope.actions")
      local builtin = require('telescope.builtin')
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
              mappings = {
                i = {
                  ["<S-Tab>"] = actions.move_selection_previous,
                  ["<Tab>"] = actions.move_selection_next,
                }
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
         }})
    end
}
