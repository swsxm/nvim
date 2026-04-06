return {
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { 'echasnovski/mini.icons' } ,
    { 'nvim-telescope/telescope-ui-select.nvim' },
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      commit = '6fea601',
      build = 'make',
      cond = function()
        return vim.fn.executable('make') == 1
      end,
    },
  },
  config = function()
    local actions = require('telescope.actions')
    
    local ignore_patterns = {
      'node_modules', '%.git/', '%.venv', '%.pycache__', 
      '__pycache__', '.*cache.*', '%.DS_Store', 'thumbs.db'
    }

    require('telescope').setup({
      defaults = {
        layout_strategy = 'vertical',
        layout_config = {
          vertical = { width = 0.9, height = 0.9, preview_height = 0.5 },
        },
        
        mappings = {
          i = {
            ['<C-k>'] = actions.move_selection_previous,
            ['<C-j>'] = actions.move_selection_next,
            ['<C-l>'] = actions.select_default,
            ['<C-c>'] = actions.close,
          },
        },
        
        file_ignore_patterns = ignore_patterns,
        path_display = { 'smart' },
      },
      
      pickers = {
        find_files = {
          hidden = true, 
        },
        live_grep = {
          additional_args = function(_)
            return { '--hidden' }
          end,
        },
      },
      
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    })

    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')

    local builtin = require('telescope.builtin')
    local map = vim.keymap.set

    map('n', '<leader>sf', builtin.find_files, { desc = 'Search: Files' })
    map('n', '<leader>s.', builtin.oldfiles, { desc = 'Search: Recent Files' })
    map('n', '<leader><leader>', builtin.buffers, { desc = 'Search: Open Buffers' })

    map('n', '<leader>sg', builtin.live_grep, { desc = 'Search: Grep (Workspace)' })
    map('n', '<leader>sw', builtin.grep_string, { desc = 'Search: Current Word' })
    map('n', '<leader>/', builtin.current_buffer_fuzzy_find, { desc = 'Search: Buffer Fuzz' })

    map('n', '<leader>sh', builtin.help_tags, { desc = 'Search: Help' })
    map('n', '<leader>sk', builtin.keymaps, { desc = 'Search: Keymaps' })
    map('n', '<leader>sd', builtin.diagnostics, { desc = 'Search: Diagnostics' })
    map('n', '<leader>sr', builtin.resume, { desc = 'Search: Resume Last' })
  end,
}
