return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'rcarriga/nvim-dap-ui',
      'nvim-neotest/nvim-nio',
      'mfussenegger/nvim-dap-python',
    },
    config = function()
      local dap = require 'dap'
      local dapui = require 'dapui'

      dapui.setup {
        layouts = {
          {
            elements = {
              { id = 'scopes', size = 0.50 },
              { id = 'stacks', size = 0.30 },
              { id = 'breakpoints', size = 0.20 },
            },
            size = 40,
            position = 'left',
          },
          {
            elements = {
              { id = 'repl', size = 0.5 },
              { id = 'console', size = 0.5 },
            },
            size = 12,
            position = 'bottom',
          },
        },
      }

      dap.listeners.after.event_initialized['dapui_config'] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated['dapui_config'] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited['dapui_config'] = function()
        dapui.close()
      end

      require('dap-python').setup '~/.local/share/nvim/mason/packages/debugpy/venv/bin/python'

      -- Standard Float helper for DAP elements
      local function float(id)
        dapui.float_element(id, {
          width = math.floor(vim.o.columns * 0.80),
          height = math.floor(vim.o.lines * 0.75),
          enter = true,
          position = 'center',
        })
      end

      -- DataFrame Visualizer (Pandas + Polars, Centered Floating Window)
      local function visualize_df()
        local var_name = vim.fn.expand '<cexpr>'

        if var_name == '' or var_name == nil then
          var_name = vim.fn.input 'Variable name to visualize: '
        end

        if var_name == '' then
          return
        end

        local dump_cmd = string.format(
          [[
_obj = %s

try:
    import pandas as _pd
    _has_pandas = True
except ImportError:
    _has_pandas = False

try:
    import polars as _pl
    _has_polars = True
except ImportError:
    _has_polars = False

if _has_polars and isinstance(_obj, _pl.DataFrame):
    _obj.write_csv('/tmp/debug_df.csv')
elif _has_polars and isinstance(_obj, _pl.Series):
    _obj.to_frame().write_csv('/tmp/debug_df.csv')
elif _has_pandas and isinstance(_obj, _pd.DataFrame):
    _obj.astype(object).to_csv('/tmp/debug_df.csv', index=False)
elif _has_pandas and isinstance(_obj, _pd.Series):
    _obj.astype(object).to_frame().to_csv('/tmp/debug_df.csv', index=True)
else:
    with open('/tmp/debug_df.csv', 'w') as _f:
        _f.write('NOT_A_DATAFRAME')
]],
          var_name
        )

        dap.session():evaluate(dump_cmd, function(err)
          if err then
            vim.notify('DAP Error: Could not evaluate "' .. var_name .. '" — ' .. tostring(err.message), vim.log.levels.ERROR)
            return
          end

          local lines = vim.fn.readfile '/tmp/debug_df.csv'
          if not lines or lines[1] == 'NOT_A_DATAFRAME' then
            dapui.eval(var_name, { enter = true })
            return
          end

          local width = math.floor(vim.o.columns * 0.9)
          local height = math.floor(vim.o.lines * 0.9)
          local row = math.floor((vim.o.lines - height) / 2)
          local col = math.floor((vim.o.columns - width) / 2)

          local buf = vim.api.nvim_create_buf(false, true)
          local win = vim.api.nvim_open_win(buf, true, {
            relative = 'editor',
            width = width,
            height = height,
            row = row,
            col = col,
            style = 'minimal',
            border = 'rounded',
            title = ' Data Inspector: ' .. var_name .. ' ',
            title_pos = 'center',
          })

          vim.fn.termopen 'vd /tmp/debug_df.csv'

          vim.api.nvim_create_autocmd('TermClose', {
            buffer = buf,
            callback = function()
              vim.api.nvim_win_close(win, true)
            end,
          })

          vim.cmd 'startinsert'
        end)
      end

      -- Control
      vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
      vim.keymap.set('n', '<leader>dc', dap.continue, { desc = 'Debug: Continue' })
      vim.keymap.set('n', '<leader>di', dap.step_into, { desc = 'Debug: Step Into' })
      vim.keymap.set('n', '<leader>do', dap.step_over, { desc = 'Debug: Step Over' })
      vim.keymap.set('n', '<leader>du', dap.step_out, { desc = 'Debug: Step Out' })
      vim.keymap.set('n', '<leader>dt', dap.terminate, { desc = 'Debug: Terminate' })
      vim.keymap.set('n', '<leader>dd', function()
        dap.disconnect { terminateDebuggee = false }
        dapui.close()
      end, { desc = 'Debug: Detach (keep process running)' })
      vim.keymap.set('n', '<leader>dr', function()
        require('dap-python').test_method()
      end, { desc = 'Debug: Run Test Method' })

      vim.keymap.set('n', '<leader>dh', function()
        require('dap.ui.widgets').hover()
      end, { desc = 'Debug: Hover' })
      vim.keymap.set('n', '<leader>de', function()
        dapui.eval(nil, { enter = true })
      end, { desc = 'Debug: Eval' })
      vim.keymap.set('v', '<leader>de', function()
        dapui.eval(nil, { enter = true })
      end, { desc = 'Debug: Eval selection' })

      vim.keymap.set('n', '<leader>dv', visualize_df, { desc = 'Debug: Visualize DataFrame (Float)' })

      vim.keymap.set('n', '<leader>d1', function()
        float 'scopes'
      end, { desc = 'Debug: Float Variables' })
      vim.keymap.set('n', '<leader>d2', function()
        float 'breakpoints'
      end, { desc = 'Debug: Float Breakpoints' })
      vim.keymap.set('n', '<leader>d3', function()
        float 'stacks'
      end, { desc = 'Debug: Float Stacks' })
      vim.keymap.set('n', '<leader>d4', function()
        float 'watches'
      end, { desc = 'Debug: Float Watches' })
      vim.keymap.set('n', '<leader>d5', function()
        float 'repl'
      end, { desc = 'Debug: Float REPL' })
      vim.keymap.set('n', '<leader>d6', function()
        float 'console'
      end, { desc = 'Debug: Float Console' })

      vim.api.nvim_set_hl(0, 'WinSeparator', { fg = '#585b70', bg = '#585b70' })
    end,
  },
}
