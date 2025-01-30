require("config.lazy")
require("config.cmds")
require("config.settings")

vim.cmd("language en_US")
vim.cmd.colorscheme "catppuccin-mocha"

vim.opt.number = true
vim.opt.relativenumber = true

-- keymaps
vim.keymap.set('n', '<leader>q', ':q<CR>', { desc = 'quit' })
vim.keymap.set('n', '<leader>w', ':w<CR>', { desc = 'write' })
vim.keymap.set('i', 'jj', '<esc>')

vim.keymap.set('n', '<leader>e', '<cmd> NvimTreeFocus <Cr>', { desc = 'toggle explorer' })
vim.keymap.set('n', '<C-n>', '<cmd> NvimTreeToggle <Cr>', { desc = 'toggle explorer' })
--local builtin = require('telescope.builtin')
--vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
--vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
--vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
--vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
--




-- telescope
--
