return {
  {
    'mfussenegger/nvim-dap',
    -- Pinned to stable 2026 commits for security
    commit = '6a5bba0',
    dependencies = {
      { 'rcarriga/nvim-dap-ui', commit = 'f7d75cc' },
      { 'nvim-neotest/nvim-nio', commit = '21f5324' },
      { 'mfussenegger/nvim-dap-python', commit = '1808458' },
    },
    config = function()
      local dap = require('dap')
      local dapui = require('dapui')

      dapui.setup({
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
      })

      -- Automatic UI state management
      dap.listeners.after.event_initialized['dapui_config'] = function() dapui.open() end
      dap.listeners.before.event_terminated['dapui_config'] = function() dapui.close() end
      dap.listeners.before.event_exited['dapui_config'] = function() dapui.close() end

      -- Hardened Path Logic: Fallback to system python
      local debugpy_path = vim.fn.expand('~/.local/share/nvim/mason/packages/debugpy/venv/bin/python')
      if vim.fn.executable(debugpy_path) == 0 then
        debugpy_path = 'python3'
      end
      require('dap-python').setup(debugpy_path)

      -- Helper: Secure floating UI elements
      local function open_float(id)
        dapui.float_element(id, {
          width = math.floor(vim.o.columns * 0.80),
          height = math.floor(vim.o.lines * 0.75),
          enter = true,
          position = 'center',
        })
      end
      -- visualize df setup
      local function visualize_df()
        local var_name = vim.fn.expand('<cexpr>')
        if var_name == '' or var_name == nil then
          var_name = vim.fn.input('Variable name: ')
        end
        if var_name == '' then return end

        if not var_name:match("^[%w%.%_%[%]]+$") then
          vim.notify("Security: Invalid characters in variable name", vim.log.levels.ERROR)
          return
        end

        local tmp_file = '/tmp/nvim_debug_' .. vim.loop.getpid() .. '.csv'
        
        local python_script = string.format([[
def _nvim_export_csv(obj, path):
    try:
        import polars as pl
        if isinstance(obj, pl.DataFrame):
            obj.write_csv(path)
            return True
        if isinstance(obj, pl.Series):
            obj.to_frame().write_csv(path)
            return True
    except (ImportError, Exception): pass

    try:
        import pandas as pd
        if isinstance(obj, pd.DataFrame):
            obj.to_csv(path, index=False)
            return True
        if isinstance(obj, pd.Series):
            obj.to_frame().to_csv(path, index=True)
            return True
    except (ImportError, Exception): pass
    return False

_nvim_export_csv(%s, '%s')
]], var_name, tmp_file)

        dap.session():evaluate(python_script, function(err)
          if err then
            vim.notify('DAP Eval Error: ' .. err.message, vim.log.levels.ERROR)
            return
          end

          vim.defer_fn(function()
            if vim.fn.filereadable(tmp_file) == 0 then
              dap.session():evaluate('str(type(' .. var_name .. '))', function(_, res)
                local v_type = res and res.result or "Unknown"
                vim.notify(string.format("Variable is %s, not a supported DataFrame/Series", v_type), vim.log.levels.WARN)
              end)
              return
            end
            
            local buf = vim.api.nvim_create_buf(false, true)
            local win = vim.api.nvim_open_win(buf, true, {
              relative = 'editor',
              width = math.floor(vim.o.columns * 0.9),
              height = math.floor(vim.o.lines * 0.9),
              row = math.floor(vim.o.lines * 0.05),
              col = math.floor(vim.o.columns * 0.05),
              style = 'minimal',
              border = 'rounded',
              title = ' Data Inspector: ' .. var_name .. ' ',
              title_pos = 'center',
            })

            vim.fn.termopen({ 'vd', tmp_file }, {
              on_exit = function()
                if vim.api.nvim_win_is_valid(win) then
                  vim.api.nvim_win_close(win, true)
                end
                os.remove(tmp_file)
              end
            })
            vim.cmd('startinsert')
          end, 20) -- 20ms buffer for disk sync
        end)
      end

      -- Execution Control Keymaps
      local map = vim.keymap.set
      map('n', '<leader>db', dap.toggle_breakpoint, { desc = 'Debug: Breakpoint' })
      map('n', '<leader>dc', dap.continue, { desc = 'Debug: Continue' })
      map('n', '<leader>dt', dap.terminate, { desc = 'Debug: Terminate' })
      map('n', '<leader>di', dap.step_into, { desc = 'Debug: Step Into' })
      map('n', '<leader>do', dap.step_over, { desc = 'Debug: Step Over' })
      map('n', '<leader>dr', function() require('dap-python').test_method() end, { desc = 'Debug: Run Test' })

      -- Inspection Keymaps
      map('n', '<leader>de', function() dapui.eval(nil, { enter = true }) end, { desc = 'Debug: Eval' })
      map('v', '<leader>de', function() dapui.eval(nil, { enter = true }) end, { desc = 'Debug: Eval selection' })
      map('n', '<leader>dv', visualize_df, { desc = 'Debug: VisiData Inspector' })

      -- UI Utility Keymaps
      map('n', '<leader>d1', function() open_float('scopes') end, { desc = 'Debug: Variables' })
      map('n', '<leader>d5', function() open_float('repl') end, { desc = 'Debug: REPL' })

      vim.api.nvim_set_hl(0, 'DapStopped', { fg = '#98bb6c', bold = true })
    end,
  },
}
