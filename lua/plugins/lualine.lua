return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 
    { 'echasnovski/mini.icons' } 
  },
  config = function()
    local hide_in_width = function()
      return vim.fn.winwidth(0) > 100
    end

    local mode = {
      'mode',
      fmt = function(str)
        return ' ' .. str 
      end,
    }

    local filename = {
      'filename',
      file_status = true,
    }

    local diagnostics = {
      'diagnostics',
      sources = { 'nvim_diagnostic' },
      sections = { 'error', 'warn' },
      symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
      colored = true, 
      update_in_insert = false,
      cond = hide_in_width,
    }

    local diff = {
      'diff',
      symbols = { added = ' ', modified = ' ', removed = ' ' }, 
      cond = hide_in_width,
    }

    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = 'rose-pine', 
        
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        
        disabled_filetypes = { 
          statusline = { 'alpha', 'neo-tree', 'dashboard', 'lazy', 'mason' },
        },
        always_divide_middle = true,
        globalstatus = true, 
      },
      sections = {
        lualine_a = { mode },
        lualine_b = { 'branch' },
        lualine_c = { filename },
        lualine_x = { 
          diagnostics, 
          diff, 
          { 'filetype', cond = hide_in_width } 
        },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { { 'filename', path = 1 } },
        lualine_x = { { 'location', padding = 0 } },
        lualine_y = {},
        lualine_z = {},
      },
    }
  end,
}
