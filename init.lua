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

vim.keymap.set('n', '<leader>e', '<cmd> NvimTreeFocus <CR>', { desc = 'toggle explorer' })
vim.keymap.set('n', '<C-n>', '<cmd> NvimTreeToggle <CR>', { desc = 'toggle explorer' })

vim.keymap.set('n', '<leader>foc', ':set ft=csv_semicolon<CR>', { desc = 'toggle explorer' })
vim.keymap.set('n', '<leader>fop', ':set ft=csv_pipie<CR>', { desc = 'toggle explorer' })

vim.keymap.set('n', '<leader>fodn', ':%s/\\%x00//g<CR>') -- delete null chars??
--





-- telescope
--
