return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    -- This is where you define what columns Oil displays
    columns = {
      'icon', -- Shows the file type icon (powered by mini.icons)
      'permissions', -- Shows standard Linux permissions (e.g., rw-r--r--)
      'size', -- Shows the file size
    },
    -- You can also add other core Oil settings here if needed
    -- default_file_explorer = true,
  },
  -- Optional dependencies
  dependencies = { { 'nvim-mini/mini.icons', opts = {} } },
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,

  -- Add your keybinds here
  keys = {
    { '<leader>o', '<cmd>Oil<CR>', desc = 'Open Oil file explorer' },
  },
}
