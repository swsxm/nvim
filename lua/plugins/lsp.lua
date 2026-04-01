return {
  -- 1. MASON: External Binary Management
  {
    "williamboman/mason.nvim",
    commit = "44d1e90",
    dependencies = { 
      { "WhoIsSethDaniel/mason-tool-installer.nvim", commit = "c5e07b8" } 
    },
    config = function()
      require("mason").setup({
        ui = { border = "rounded" }
      })
      require("mason-tool-installer").setup({
        ensure_installed = {
          "ruff", "mypy", "pyright",     -- Python
          "eslint_d", "prettier",        -- Web
          "clangd", "clang-format",      -- C/C++
          "lua-language-server",         -- Neovim Config
        },
        auto_update = false,
        run_on_start = true,
        start_delay = 3000,
      })
    end,
  },

  -- 2. NVIM-LINT: Diagnostics
  {
    "mfussenegger/nvim-lint",
    commit = "4b03656",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lint = require("lint")

      lint.linters.mypy.args = {
        "--ignore-missing-imports",
      }

      lint.linters_by_ft = {
        python = { "ruff", "mypy" },
        javascript = { "eslint_d" },
        typescript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        typescriptreact = { "eslint_d" },
      }

      local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = lint_augroup,
        callback = function() lint.try_lint() end,
      })
    end,
  },

  -- 3. CONFORM: Code Formatting
  {
    "stevearc/conform.nvim",
    commit = "3543d00",
    event = { "BufWritePre" },
    keys = {
      {
        "<leader>f",
        function() require("conform").format({ async = true, lsp_fallback = true }) end,
        mode = "n",
        desc = "Format buffer",
      },
    },
    opts = {
      formatters_by_ft = {
        -- Ruff logic: Organize -> Fix -> Format
        python = { "ruff_organize_imports", "ruff_fix", "ruff_format" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        json = { "prettier" },
        c = { "clang-format" },
        cpp = { "clang-format" }
      },
    },
  },

  -- 4. LSPCONFIG
  {
    "neovim/nvim-lspconfig",
    commit = "0203a96",
    dependencies = { "saghen/blink.cmp" },
    config = function()
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      -- Pyright: Intelligence only. Diagnostics are handled by Ruff/Mypy above.
      vim.lsp.config.pyright = {
        capabilities = capabilities,
        handlers = {
          ["textDocument/publishDiagnostics"] = function() end,
        },
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "off", -- Handled by Mypy
              ignore = { "*" },         -- Handled by Ruff
            }
          }
        }
      }

      -- Clangd: C/C++
      vim.lsp.config.clangd = { capabilities = capabilities }

      -- Native Activation
      vim.lsp.enable("pyright")
      vim.lsp.enable("clangd")
    end,
  },
}
