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
      ensure_installed = { "pyright", "ruff" },
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "saghen/blink.cmp" },
    lazy = false,

    config = function()
      local lsps = { "lua_ls", "cssls", "pyright", "ruff", "omnisharp" } -- INSERT LSPS HERE 
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      vim.lsp.config("*", {
        capabilities = capabilities,
      })

      vim.lsp.config("omnisharp", {
        cmd = { "omnisharp" },
        root_markers = { "*.sln", "*.csproj" },
      })

      vim.lsp.config("pyright", {
        settings = {
          python = {
            analysis = {
              autoImportCompletions = true,
              autoSearchPaths = true,
              diagnosticMode = "workspace",
              typeCheckingMode = "off",
              useLibraryCodeForTypes = true,
            },
          },
        },
      })

      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" }
            }
          }
        }
      })

      for _, name in ipairs(lsps) do
        vim.lsp.enable(name)
      end

      vim.keymap.set("n", "K",  vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "gc", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<leader>fc", vim.lsp.buf.format, {})
    end,
  },
}
