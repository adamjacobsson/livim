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
      ensure_installed = {
        "pyright",
        "ruff",
        "omnisharp",
        "ts_ls",
        "angularls",
        "cssls",
        "html",
        "jsonls",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "saghen/blink.cmp" },
    lazy = false,

    config = function()
      local util = require("lspconfig.util")
      local lsps = {
        "lua_ls",
        "cssls",
        "pyright",
        "ruff",
        "omnisharp",
        "ts_ls",
        "angularls",
        "jsonls",
        "html",
      } -- INSERT LSPS HERE 
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      vim.lsp.config("*", {
        capabilities = capabilities,
      })

      local omnisharp_bin = vim.fn.executable("OmniSharp") == 1 and "OmniSharp" or "omnisharp"

      vim.lsp.config("omnisharp", {
        cmd = {
          omnisharp_bin,
          "-z",
          "--hostPID",
          tostring(vim.fn.getpid()),
          "DotNet:enablePackageRestore=false",
          "--encoding",
          "utf-8",
          "--languageserver",
        },
        filetypes = { "cs", "vb" },
        root_dir = function(bufnr, on_dir)
          local fname = vim.api.nvim_buf_get_name(bufnr)
          on_dir(
            util.root_pattern("*.slnx")(fname)
            or util.root_pattern("*.sln")(fname)
            or util.root_pattern("*.csproj")(fname)
            or util.root_pattern("omnisharp.json")(fname)
            or util.root_pattern("function.json")(fname)
          )
        end,
        settings = {
          FormattingOptions = {
            EnableEditorConfigSupport = true,
            OrganizeImports = true,
          },
          RoslynExtensionsOptions = {
            EnableImportCompletion = true,
            EnableAnalyzersSupport = true,
            AnalyzeOpenDocumentsOnly = false,
          },
        },
        capabilities = {
          workspace = { workspaceFolders = false },
        },
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
