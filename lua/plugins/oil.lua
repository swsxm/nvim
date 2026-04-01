return {
  'stevearc/oil.nvim',
  commit = '975a77c', 
  dependencies = { 
    { 'echasnovski/mini.icons', opts = {}, commit = '5b9076d' } 
  },
  lazy = false,
  opts = {
    delete_to_trash = true,
    skip_confirm_for_simple_edits = false,
    
    columns = {
      'icon',
      'permissions',
      'size',
    },
    
    view_options = {
      show_hidden = true,
      is_always_hidden = function(name, _)
        return name == '..' 
          or name == '.git' 
          or vim.startswith(name, '__') 
          or name:lower():match('cache')
      end,
    },
    
    float = {
      padding = 2,
      max_width = 100,
      max_height = 0.8, -- FIXED: 80% of screen height (0 would crash)
      border = 'rounded',
      win_options = {
        winhl = 'Normal:NormalFloat',
      },
    },
  },
  keys = {
    { '-', '<cmd>Oil<CR>', desc = 'Open parent directory' },
    { '<leader>o', '<cmd>Oil --float<CR>', desc = 'File Explorer (Float)' },
  },
}
