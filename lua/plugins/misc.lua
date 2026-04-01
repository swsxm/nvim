return {
  -- 1. Detect tabstop and shiftwidth automatically
  { 'tpope/vim-sleuth', commit = 'be69bff' },

  -- 2. Fugitive
  { 'tpope/vim-fugitive', commit = '96c1009' },

  -- 3. Which-Key
  {
    'folke/which-key.nvim',
    commit = 'fcbf4ee',
    event = 'VeryLazy', -- Load only when needed
    opts = {
      icons = { mapping = false },
    },
  },

  -- 4. Autopairs
  {
    'windwp/nvim-autopairs',
    commit = '23320e7',
    event = 'InsertEnter',
    opts = {
      check_ts = true,
    },
  },

  -- 5. TODO Comments: Highlights TODO, FIXME, etc.
  {
    'folke/todo-comments.nvim',
    commit = '31e3c38',
    event = 'VimEnter',
    dependencies = { { 'nvim-lua/plenary.nvim', commit = '5001291' } },
    opts = { signs = false },
  },
}
