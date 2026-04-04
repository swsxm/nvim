-- Set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Use 'jk' to exit Insert Mode and return to Normal Mode
vim.keymap.set('i', 'jk', '<Esc>', { desc = 'Exit Insert Mode' })

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- For conciseness
local opts = { noremap = true, silent = true }

-- save file
vim.keymap.set('n', '<C-s>', '<cmd> w <CR>', opts)

-- save file without auto-formatting
vim.keymap.set('n', '<leader>sn', '<cmd>noautocmd w <CR>', opts)

-- quit file
vim.keymap.set('n', '<C-q>', '<cmd> q <CR>', opts)

-- delete single character without copying into register
vim.keymap.set('n', 'x', '"_x', opts)

-- Vertical scroll and center
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)

-- Find and center
vim.keymap.set('n', 'n', 'nzzzv', opts)
vim.keymap.set('n', 'N', 'Nzzzv', opts)

-- Resize with arrows
vim.keymap.set('n', '<Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<Right>', ':vertical resize +2<CR>', opts)

-- Buffers
vim.keymap.set('n', '<Tab>', ':bnext<CR>', opts)
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', opts)
vim.keymap.set('n', '<leader>x', ':bdelete!<CR>', opts) -- close buffer
vim.keymap.set('n', '<leader>b', '<cmd> enew <CR>', opts) -- new buffer

-- Window management
vim.keymap.set('n', '<leader>v', '<C-w>v', opts) -- split window vertically
vim.keymap.set('n', '<leader>h', '<C-w>s', opts) -- split window horizontally
vim.keymap.set('n', '<leader>se', '<C-w>=', opts) -- make split windows equal width & height
vim.keymap.set('n', '<leader>xs', ':close<CR>', opts) -- close current split window

-- Navigate between splits
vim.keymap.set('n', 'sh', '<C-w>h', opts)
vim.keymap.set('n', 'sj', '<C-w>j', opts)
vim.keymap.set('n', 'sk', '<C-w>k', opts)
vim.keymap.set('n', 'sl', '<C-w>l', opts)

-- Tabs
vim.keymap.set('n', '<leader>to', ':tabnew<CR>', opts) -- open new tab
vim.keymap.set('n', '<leader>tx', ':tabclose<CR>', opts) -- close current tab
vim.keymap.set('n', '<leader>tn', ':tabn<CR>', opts) --  go to next tab
vim.keymap.set('n', '<leader>tp', ':tabp<CR>', opts) --  go to previous tab

-- Toggle line wrapping
vim.keymap.set('n', '<leader>lw', '<cmd>set wrap!<CR>', opts)

-- Stay in indent mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Keep last yanked when pasting
vim.keymap.set('v', 'p', '"_dP', opts)

-- Diagnostic keymaps
vim.keymap.set('n', '[d', function()
  vim.diagnostic.jump { count = -1, float = true }
end, { desc = 'Go to previous diagnostic message' })

vim.keymap.set('n', ']d', function()
  vim.diagnostic.jump { count = 1, float = true }
end, { desc = 'Go to next diagnostic message' })

-- Diagnostics
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Explorer
vim.keymap.set("n", "<leader>o", "<cmd>Explore<CR>", { desc = "Open Explorer" })

-- Harpoon like native setup
vim.keymap.set('n', '<leader>a', function()
    local current_file_full = vim.fn.expand('%:p') -- Get absolute path for accurate comparison
    local current_file_rel = vim.fn.expand('%')    -- Get relative path for commands
    local filename = vim.fn.expand('%:t')          -- Get just the filename for the print message
    
    local arglist = vim.fn.argv()
    local is_in_list = false

    for _, arg in ipairs(arglist) do
        if vim.fn.fnamemodify(arg, ':p') == current_file_full then
            is_in_list = true
            break
        end
    end

    if is_in_list then
        vim.cmd('argdelete ' .. vim.fn.fnameescape(current_file_rel))
        print("Harpoon: Removed [" .. filename .. "]")
    else
        vim.cmd('$argadd %')
        vim.cmd('argdedup')
        print("Added [" .. filename .. "]")
    end

    vim.defer_fn(function()
        vim.cmd('echo ""')
    end, 1000)
    
end, { desc = "Toggle file in arglist" })

vim.keymap.set('n', '<leader>1', '<cmd>1argu<CR>', { desc = "Go to arglist 1" })
vim.keymap.set('n', '<leader>2', '<cmd>2argu<CR>', { desc = "Go to arglist 2" })
vim.keymap.set('n', '<leader>3', '<cmd>3argu<CR>', { desc = "Go to arglist 3" })
vim.keymap.set('n', '<leader>4', '<cmd>4argu<CR>', { desc = "Go to arglist 4" })
