vim.g.mapleader = " "
vim.opt.clipboard = "unnamedplus"

local opts = { noremap = true, silent = true }

-- Visual mode indentation
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Don't yank on 'x' or 'p'
vim.keymap.set("n", "x", '"_x', opts)
vim.keymap.set("v", "p", '"_dP', opts)


if vim.g.vscode then
    local vscode = require('vscode')

    -- Leader Search Mappings
    vim.keymap.set('n', '<leader>sf', function() vscode.action('workbench.action.quickOpen') end)
    vim.keymap.set('n', '<leader>sg', function() vscode.action('workbench.action.findInFiles') end)
    vim.keymap.set('n', '<leader>sd', function() vscode.action('actions.find') end)
    vim.keymap.set('n', '<leader>sb', function() vscode.action('workbench.action.showAllEditorsByAppearance') end)
    vim.keymap.set('n', '<leader>ss', function() vscode.action('workbench.action.gotoSymbol') end)
    vim.keymap.set('n', '<leader>sS', function() vscode.action('workbench.action.showAllSymbols') end)
    vim.keymap.set('n', '<leader>c', function() vscode.action('workbench.action.showCommands') end)
    vim.keymap.set('n', '<leader>e', function() vscode.action('workbench.view.explorer') end)

    -- Code Navigation
    vim.keymap.set('n', '<leader>gd', function() vscode.action('editor.action.revealDefinition') end)
    vim.keymap.set('n', '<leader>i', function() vscode.action('editor.action.showHover') end)
    vim.keymap.set('n', '<leader>gg', function() vscode.action('git-graph.view') end)

    -- Focus Terminal
    vim.keymap.set('n', '<leader>t', function()
        vscode.action('workbench.action.terminal.focus')
    end)
end