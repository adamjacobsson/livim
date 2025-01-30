-- auto resize split when changing window size
vim.api.nvim_command("autocmd VimResized * wincmd =")

-- keep the gutter witdh constant
vim.api.nvim_command("set signcolumn=yes")
