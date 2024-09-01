return {
  'cbochs/grapple.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  keys = {
    { '<leader>;a', '<cmd>Grapple tag<cr>', desc = 'Grapple: Tag file' },
    { '<leader>;d', '<cmd>Grapple untag<cr>', desc = 'Grapple: Remove tag' },
    { '<leader>;;', '<cmd>Grapple toggle_tags<cr>', desc = 'Grapple: Open Menu' },

    { '<leader>1', '<cmd>Grapple select index=1<cr>', desc = 'Grapple: Jump to 1' },
    { '<leader>2', '<cmd>Grapple select index=2<cr>', desc = 'Grapple: Jump to 2' },
    { '<leader>3', '<cmd>Grapple select index=3<cr>', desc = 'Grapple: Jump to 3' },
    { '<leader>4', '<cmd>Grapple select index=4<cr>', desc = 'Grapple: Jump to 4' },
  },
}
