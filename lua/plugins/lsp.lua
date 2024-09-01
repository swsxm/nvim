return {
  -- ==========================================
  -- 1. TOOL INSTALLATION (Mason)
  -- ==========================================
  {
    "williamboman/mason.nvim",
    dependencies = {
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
      require("mason").setup()
      require("mason-tool-installer").setup({
        ensure_installed = {
          -- Python
          "ruff",
          "mypy",
          "pyright",
          
          -- Web Dev (JS, TS, HTML, JSON)
          "eslint_d", 
          "prettier", 

          -- C / C++
          "clangd",
          "clang-format",
        },
      })
    end,
  },

  -- ==========================================
  -- 2. LINTING (Fehler & Warnungen anzeigen)
  -- ==========================================
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lint = require("lint")

      -- Mypy anpassen: Fehlende Imports global ignorieren
      local mypy = lint.linters.mypy
      table.insert(mypy.args, "--ignore-missing-imports")

      -- Zuweisung der Linter zu den Dateitypen
      lint.linters_by_ft = {
        python = { "ruff", "mypy" },
        javascript = { "eslint_d" },
        typescript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        typescriptreact = { "eslint_d" },
      }

      -- Automatische Ausführung beim Speichern, Tippen oder Dateiwechsel
      local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = lint_augroup,
        callback = function()
          lint.try_lint()
        end,
      })
    end,
  },

  -- ==========================================
  -- 3. FORMATTING (Nur manuell über <leader>f)
  -- ==========================================
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    keys = {
      {
        "<leader>f",
        function() require("conform").format({ async = true, lsp_fallback = true }) end,
        mode = "",
        desc = "Format buffer",
      },
    },
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          -- Python: Imports sortieren -> Fixes anwenden -> Formatieren
          python = { "ruff_organize_imports", "ruff_fix", "ruff_format" },
          
          -- Web Dev: Alles über Prettier
          javascript = { "prettier" },
          typescript = { "prettier" },
          javascriptreact = { "prettier" },
          typescriptreact = { "prettier" },
          json = { "prettier" },
          html = { "prettier" },
          css = { "prettier" },

          -- C
          c = { "clang-format"},
          cpp = {"clang-format"}
        },
      })
    end,
  },

  -- ==========================================
  -- 4. LSP CONFIG (Das Gehirn - Neovim 0.11+ Standard)
  -- ==========================================
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      -- Damit Neovim die Basis-Konfigurationen des Plugins lädt
      require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- NEUER WEG: Wir nutzen direkt vim.lsp.config (Neovim Native API)
      -- Das Plugin (lspconfig) verschmilzt das automatisch mit seinen Standards.
      vim.lsp.config.pyright = {
        capabilities = capabilities,
        
        -- Zieht den Stecker für jegliche Fehlermeldungen von Pyright
        handlers = {
          ["textDocument/publishDiagnostics"] = function() end,
        },

        settings = {
          python = {
            analysis = {
              typeCheckingMode = "off",
              ignore = { "*" }, 
            }
          }
        }
      }

      -- Schaltet Pyright für Python-Dateien aktiv
      vim.lsp.enable("pyright")
      vim.lsp.enable("clangd")

    end,
  },
}
