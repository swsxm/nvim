return {
  'cbochs/grapple.nvim',
  -- Pinned to stable 2026 commit
  commit = '7aedc26', 
  dependencies = { 
    -- Pinned consistent icon provider
    { 'echasnovski/mini.icons', commit = '5b9076d' } 
  },
  opts = {
    -- Hardened Logic: Tags are scoped to the Git branch. 
    -- If you switch branches, you get a fresh set of tags.
    scope = "git_branch", 
    icons = true,
    statusline = {
      enabled = false, -- Disable to save performance
    },
  },
  keys = {
    { '<leader>;a', '<cmd>Grapple tag<cr>', desc = 'Grapple: Tag file' },
    { '<leader>;d', '<cmd>Grapple untag<cr>', desc = 'Grapple: Remove tag' },
    { '<leader>;;', '<cmd>Grapple toggle_tags<cr>', desc = 'Grapple: Open Menu' },

    -- Quick Selects
    { '<leader>1', '<cmd>Grapple select index=1<cr>', desc = 'Grapple: Jump to 1' },
    { '<leader>2', '<cmd>Grapple select index=2<cr>', desc = 'Grapple: Jump to 2' },
    { '<leader>3', '<cmd>Grapple select index=3<cr>', desc = 'Grapple: Jump to 3' },
    { '<leader>4', '<cmd>Grapple select index=4<cr>', desc = 'Grapple: Jump to 4' },
  },
}
