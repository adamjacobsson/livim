vim.o.tabstop = 4      -- A TAB character looks like 4 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 4  -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4   -- Number of spaces inserted when indenting
vim.o.ignorecase = true
vim.opt.clipboard = "unnamedplus"

-- shorter CursorHold delay so diagnostic float shows after 0.5s
vim.o.updatetime = 500

vim.opt.wrap = true
vim.opt.linebreak = true
