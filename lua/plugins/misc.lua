return {
  -- 1. Detect tabstop and shiftwidth automatically
  { 'tpope/vim-sleuth' },

  -- 2. Fugitive
  { 'tpope/vim-fugitive',},

  -- 3. Which-Key
  {
    'folke/which-key.nvim',
    event = 'VeryLazy', 
    opts = {
      icons = { mapping = false },
    },
  },

  -- 4. Autopairs
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {
      check_ts = true,
    },
  },

  -- 5. TODO Comments: Highlights TODO, FIXME, etc.
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { { 'nvim-lua/plenary.nvim' } },
    opts = { signs = false },
  },
}
