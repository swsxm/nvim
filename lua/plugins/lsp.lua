return {
  'neovim/nvim-lspconfig',
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'saghen/blink.cmp',
  },
  config = function()
    local servers = {
      'lua_ls',
      'ruff',
      'pyright', 
      'terraformls',
      'yamlls',
      'jsonls',
      'clangd',
      'html',
      'ts_ls',
      'marksman',
    }

    require('mason').setup()
    require('mason-lspconfig').setup({ ensure_installed = servers })

    vim.diagnostic.config({ virtual_text = false, signs = true, underline = true })

    local capabilities = require('blink.cmp').get_lsp_capabilities()
    
    for _, server in ipairs(servers) do
      local opts = { capabilities = capabilities }
      
      if server == 'pyright' then
        opts.settings = {
          python = {
            analysis = {
              typeCheckingMode = "off",
              ignore = { '*' },
            },
          },
        }
        opts.handlers = {
          ["textDocument/publishDiagnostics"] = function() end,
        }
      end

      vim.lsp.config(server, opts)
    end

    -- Type checker: ty (Astral) pairs perfectly with ruff
    -- If wanted `uv tool install ty`
    -- Then enable with:
    -- vim.lsp.config('ty', { capabilities = capabilities })
    -- vim.lsp.enable('ty')
  end
}
