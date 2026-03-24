require("config.lazy")
require("config.cmds")
require("config.settings")
require("config.indenting")

vim.cmd("language en_US")
vim.cmd.colorscheme "catppuccin-mocha"

vim.opt.number = true
vim.opt.relativenumber = true

-- keymaps
vim.keymap.set('n', '<leader>q', ':q<CR>', { desc = 'quit' })
vim.keymap.set('n', '<leader>w', ':w<CR>', { desc = 'write' })
vim.keymap.set('i', 'jj', '<esc>')
vim.keymap.set('n', 'u', 'u', { desc = 'undo' })
vim.keymap.set('n', 'U', '<C-r>', { desc = 'redo' })

vim.keymap.set('n', '<leader>e', '<cmd> NvimTreeFocus <CR>', { desc = 'toggle explorer' })
vim.keymap.set('n', '<C-n>', '<cmd> NvimTreeToggle <CR>', { desc = 'toggle explorer' })

vim.keymap.set('n', '<Tab>', ':bnext<CR>', { desc = 'next buffer' })
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', { desc = 'previous buffer' })

vim.keymap.set('n', '<leader>foc', ':set ft=csv_semicolon<CR>', { desc = 'toggle explorer' })
vim.keymap.set('n', '<leader>fop', ':set ft=csv_pipie<CR>', { desc = 'toggle explorer' })

vim.keymap.set('n', '<leader>fodn', ':%s/\\%x00//g<CR>') -- delete null chars??
vim.keymap.set('n', '<leader>b', ':DBUIToggle<CR>') -- delete null chars??

-- directional window navigation like tmux
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')
--





-- telescope
--
