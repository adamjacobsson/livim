return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        opts = {
            auto_install = true,
        },
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = { 'saghen/blink.cmp' },
        lazy = false,
        config = function()
            local capabilities = require('blink.cmp').get_lsp_capabilities()

            local lspconfig = require("lspconfig")
            lspconfig.ts_ls.setup({
                capabilities = capabilities
            })
            lspconfig.angularls.setup({
                capabilities = capabilities,
                cmd = {"ngserver", "--stdio", "--tsProbeLocations", "/opt/homebrew/lib/node_modules/@angular/language-server", "--ngProbeLocations", "/opt/homebrew/lib/node_modules/@angular/language-server"}
                -- cmd = {
                --     "ngserver",
                --     '--stdio',
                --     '--tsProbeLocations'}
            })
            -- lspconfig.html.setup({
            --     capabilities = capabilities
            -- })
            lspconfig.eslint.setup({
                capabilities = capabilities
            })
            lspconfig.lua_ls.setup({
                capabilities = capabilities
            })
            lspconfig.nextls.setup({
                capabilities = capabilities
            })
            lspconfig.cssls.setup({
                capabilities = capabilities
            })
            lspconfig.ruff.setup({
                capabilities = capabilities
            })
            lspconfig.omnisharp.setup {
                capabilities = capabilities,
                cmd = { "omnisharp" },
                root_dir = lspconfig.util.root_pattern("*.sln", "*.csproj"),
            }

            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
            vim.keymap.set("n", "gc", vim.lsp.buf.code_action, {})
            vim.keymap.set("n", "<leader>fc", vim.lsp.buf.format, {})
        end,
    },
}
