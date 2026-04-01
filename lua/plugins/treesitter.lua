return {
  'nvim-treesitter/nvim-treesitter',
  commit = 'c82bf96', 
  build = ':TSUpdate',
  main = 'nvim-treesitter.configs',
  opts = {
    ensure_installed = {
      -- Core & Documentation
      'lua', 'vim', 'vimdoc', 'regex', 'markdown', 'markdown_inline', 'bash',
      -- Python Stack
      'python', 'toml', 'yaml', 'json', 'gitignore',
      -- Web & JavaScript
      'javascript', 'typescript', 'tsx', 'html', 'css', 'graphql',
      -- Systems & Infrastructure
      'c', 'cpp', 'make', 'cmake', 'dockerfile', 'terraform', 'sql',
    },

    auto_install = false, 
    sync_install = false,

    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },

    indent = { 
      enable = true 
    },

    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = '<c-space>',   -- Ctrl+Space to start selecting a block
        node_incremental = '<c-space>', -- Keep hitting to expand the selection
        scope_incremental = '<c-s>',   -- Select the entire outer scope
        node_decremental = '<M-space>',  -- Alt+Space to shrink selection
      },
    },
  },
}
