return {
  'lukas-reineke/indent-blankline.nvim',
  -- Pinned to stable 2026 release
  commit = 'd28a3f7', 
  main = 'ibl',
  opts = {
    indent = {
      char = '▏',
      tab_char = '▏',
    },
    scope = {
      enabled = false,
      show_start = false,
      show_end = false,
    },
    exclude = {
      filetypes = {
        'help',
        'alpha',
        'dashboard',
        'neo-tree',
        'Trouble',
        'lazy',
        'mason',
        'notify',
        'toggleterm',
      },
    },
  },
}
