return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "bash",
                "c_sharp",
                "css",
                "html",
                "javascript",
                "json",
                "lua",
                "python",
                "scss",
                "tsx",
                "typescript",
                "yaml",
            },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false, -- Ensures Treesitter is used
            },
        })
    end
}
