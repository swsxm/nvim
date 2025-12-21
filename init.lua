vim.g.mapleader = " "
vim.opt.clipboard = "unnamedplus"

local opts = { noremap = true, silent = true }

vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)
vim.keymap.set("n", "x", '"_x', opts)
vim.keymap.set("v", "p", '"_dP', opts)

vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)

if vim.g.vscode then
    local vscode = require('vscode')

    vim.keymap.set('n', '<leader>sf', function() vscode.action('workbench.action.quickOpen') end)
    vim.keymap.set('n', '<leader>sg', function() vscode.action('workbench.action.findInFiles') end)
    vim.keymap.set('n', '<leader>sd', function() vscode.action('actions.find') end)
    vim.keymap.set('n', '<leader>sb', function() vscode.action('workbench.action.showAllEditorsByAppearance') end)
    vim.keymap.set('n', '<leader>ss', function() vscode.action('workbench.action.gotoSymbol') end)
    vim.keymap.set('n', '<leader>sS', function() vscode.action('workbench.action.showAllSymbols') end)
    vim.keymap.set('n', '<leader>c', function() vscode.action('workbench.action.showCommands') end)
    vim.keymap.set('n', '<leader>e', function() vscode.action('workbench.view.explorer') end)

    vim.keymap.set('n', '<leader>gd', function() vscode.action('editor.action.revealDefinition') end)
    
    vim.keymap.set('n', '<leader>i', function()
        vscode.action('editor.action.showHover')
    end)
    vim.keymap.set('n', '<leader>gg', function() 
        vscode.action('git-graph.view') 
    end)

    vim.keymap.set('n', '<leader>ts', function()
        vscode.action('workbench.action.terminal.focus')
    end)

    vim.keymap.set('n', '<leader>tm', function()
        vscode.action('workbench.action.terminal.focus')
        vscode.action('workbench.action.toggleMaximizedPanel')
    end)
end