-- ============================================================================
-- OPTIONS
-- ============================================================================
vim.opt.termguicolors = true

vim.opt.number = true -- line number
vim.opt.relativenumber = true -- relative line numbers
vim.opt.cursorline = false -- do not highlight current line
vim.opt.wrap = false -- do not wrap lines by default
vim.opt.scrolloff = 10 -- keep 10 lines above/below cursor
vim.opt.sidescrolloff = 10 -- keep 10 lines to left/right of cursor

vim.opt.tabstop = 2 -- tabwidth
vim.opt.shiftwidth = 2 -- indent width
vim.opt.softtabstop = 2 -- soft tab stop not tabs on tab/backspace
vim.opt.expandtab = true -- use spaces instead of tabs
vim.opt.smartindent = true -- smart auto-indent
vim.opt.autoindent = true -- copy indent from current line

vim.opt.ignorecase = true -- case insensitive search
vim.opt.smartcase = true -- case sensitive if uppercase in string
vim.opt.hlsearch = true -- highlight search matches
vim.opt.incsearch = true -- show matches as you type

vim.opt.signcolumn = "yes" -- always show a sign column
vim.opt.colorcolumn = "" -- show a column at X position chars
vim.opt.showmatch = true -- highlights matching brackets
vim.opt.cmdheight = 1 -- single line command line
vim.opt.completeopt = "menuone,noinsert,noselect" -- completion options
vim.opt.showmode = false -- do not show the mode, instead have it in statusline
vim.opt.pumheight = 10 -- popup menu height
vim.opt.pumblend = 10 -- popup menu transparency
vim.opt.winblend = 0 -- floating window transparency
vim.opt.conceallevel = 0 -- do not hide markup
vim.opt.concealcursor = "" -- do not hide cursorline in markup
vim.opt.lazyredraw = true -- do not redraw during macros
vim.opt.synmaxcol = 300 -- syntax highlighting limit
vim.opt.fillchars = { eob = " " } -- hide "~" on empty lines

local undodir = vim.fn.expand("~/.vim/undodir")
if
	vim.fn.isdirectory(undodir) == 0 -- create undodir if nonexistent
then
	vim.fn.mkdir(undodir, "p")
end

vim.opt.backup = false -- do not create a backup file
vim.opt.writebackup = false -- do not write to a backup file
vim.opt.swapfile = false -- do not create a swapfile
vim.opt.undofile = true -- do create an undo file
vim.opt.undodir = undodir -- set the undo directory
vim.opt.updatetime = 300 -- faster completion
vim.opt.timeoutlen = 500 -- timeout duration
vim.opt.ttimeoutlen = 50 -- key code timeout
vim.opt.autoread = true -- auto-reload changes if outside of neovim
vim.opt.autowrite = false -- do not auto-save

vim.opt.hidden = true -- allow hidden buffers
vim.opt.errorbells = false -- no error sounds
vim.opt.backspace = "indent,eol,start" -- better backspace behaviour
vim.opt.autochdir = false -- do not autochange directories
vim.opt.iskeyword:append("-") -- include - in words
vim.opt.path:append("**") -- include subdirs in search
vim.opt.selection = "inclusive" -- include last char in selection
vim.opt.mouse = "a" -- enable mouse support
vim.opt.clipboard:append("unnamedplus") -- use system clipboard
vim.opt.modifiable = true -- allow buffer modifications
vim.opt.encoding = "utf-8" -- set encoding

-- Folding: requires treesitter available at runtime; safe fallback if not
vim.opt.foldmethod = "expr" -- use expression for folding
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()" -- use treesitter for folding
vim.opt.foldlevel = 99 -- start with all folds open

vim.opt.splitbelow = true -- horizontal splits go below
vim.opt.splitright = true -- vertical splits go right

vim.opt.wildmenu = true -- tab completion
vim.opt.wildmode = "longest:full,full" -- complete longest common match, full completion list, cycle through with Tab
vim.opt.diffopt:append("linematch:60") -- improve diff display
vim.opt.redrawtime = 10000 -- increase neovim redraw tolerance
vim.opt.maxmempattern = 20000 -- increase max memory

-- ============================================================================
-- KEYMAPS
-- ============================================================================
vim.g.mapleader = " " -- space for leader
vim.g.maplocalleader = " " -- space for localleader

-- better movement in wrapped text
vim.keymap.set("n", "j", function()
	return vim.v.count == 0 and "gj" or "j"
end, { expr = true, silent = true, desc = "Down (wrap-aware)" })
vim.keymap.set("n", "k", function()
	return vim.v.count == 0 and "gk" or "k"
end, { expr = true, silent = true, desc = "Up (wrap-aware)" })

vim.keymap.set("i", "jk", "<Esc>", { desc = "Leave insert mode" })

vim.keymap.set("n", "<leader>c", ":nohlsearch<CR>", { desc = "Clear search highlights" })

vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })

vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Paste without yanking" })
vim.keymap.set({ "n", "v" }, "<leader>x", '"_d', { desc = "Delete without yanking" })

vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous buffer" })

vim.keymap.set("n", "<leader>wh", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<leader>wj", "<C-w>j", { desc = "Move to bottom window" })
vim.keymap.set("n", "<leader>wu", "<C-w>k", { desc = "Move to top window" })
vim.keymap.set("n", "<leader>wl", "<C-w>l", { desc = "Move to right window" })

vim.keymap.set("n", "<leader>wv", ":vsplit<CR>", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>ws", ":split<CR>", { desc = "Split window horizontally" })
vim.keymap.set("n", "<Up>", ":resize +2<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<Down>", ":resize -2<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "<Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines and keep cursor position" })

vim.keymap.set("n", "<leader>pa", function() -- show file path
	local path = vim.fn.expand("%:p")
	vim.fn.setreg("+", path)
	print("file:", path)
end, { desc = "Copy full file path" })

vim.keymap.set("n", "<leader>td", function()
	vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { desc = "Toggle diagnostics" })

vim.keymap.set("n", "<C-s>", "<cmd>w<CR>", { desc = "Save file" })
vim.keymap.set("n", "<C-q>", "<cmd>q<CR>", { desc = "Quit" })
vim.keymap.set("n", "x", '"_x', { desc = "Delete char without yank" })

vim.keymap.set("n", "<Tab>", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>bx", ":bdelete!<CR>", { desc = "Close buffer" })
vim.keymap.set("n", "<leader>bb", "<cmd>enew<CR>", { desc = "New buffer" })

vim.keymap.set("n", "<leader>we", "<C-w>=", { desc = "Equal window sizes" })
vim.keymap.set("n", "<leader>wx", ":close<CR>", { desc = "Close split" })

vim.keymap.set("n", "<leader>to", ":tabnew<CR>", { desc = "New tab" })
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>", { desc = "Close tab" })
vim.keymap.set("n", "<leader>tn", ":tabn<CR>", { desc = "Next tab" })
vim.keymap.set("n", "<leader>tp", ":tabp<CR>", { desc = "Previous tab" })

vim.keymap.set("n", "<leader>lw", "<cmd>set wrap!<CR>", { desc = "Toggle line wrap" })

vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end, { desc = "Previous diagnostic" })
vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end, { desc = "Next diagnostic" })

-- Harpoon-like arglist navigation
vim.keymap.set("n", "<leader>a", function()
	local current_file_full = vim.fn.expand("%:p")
	local current_file_rel = vim.fn.expand("%")
	local filename = vim.fn.expand("%:t")
	local arglist = vim.fn.argv()
	local is_in_list = false
	for _, arg in ipairs(arglist) do
		if vim.fn.fnamemodify(arg, ":p") == current_file_full then
			is_in_list = true
			break
		end
	end
	if is_in_list then
		vim.cmd("argdelete " .. vim.fn.fnameescape(current_file_rel))
		print("Harpoon: Removed [" .. filename .. "]")
	else
		vim.cmd("$argadd %")
		vim.cmd("argdedup")
		print("Added [" .. filename .. "]")
	end
	vim.defer_fn(function() vim.cmd('echo ""') end, 1000)
end, { desc = "Toggle file in arglist" })
vim.keymap.set("n", "<leader>1", "<cmd>1argu<CR>", { desc = "Arglist slot 1" })
vim.keymap.set("n", "<leader>2", "<cmd>2argu<CR>", { desc = "Arglist slot 2" })
vim.keymap.set("n", "<leader>3", "<cmd>3argu<CR>", { desc = "Arglist slot 3" })
vim.keymap.set("n", "<leader>4", "<cmd>4argu<CR>", { desc = "Arglist slot 4" })

-- ============================================================================
-- AUTOCMDS
-- ============================================================================

local augroup = vim.api.nvim_create_augroup("UserConfig", { clear = true })


-- highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup,
	callback = function()
		vim.hl.on_yank()
	end,
})

-- return to last cursor position
vim.api.nvim_create_autocmd("BufReadPost", {
	group = augroup,
	desc = "Restore last cursor position",
	callback = function()
		if vim.o.diff then -- except in diff mode
			return
		end

		local last_pos = vim.api.nvim_buf_get_mark(0, '"') -- {line, col}
		local last_line = vim.api.nvim_buf_line_count(0)

		local row = last_pos[1]
		if row < 1 or row > last_line then
			return
		end

		pcall(vim.api.nvim_win_set_cursor, 0, last_pos)
	end,
})


-- wrap, linebreak and spellcheck on markdown and text files
vim.api.nvim_create_autocmd("FileType", {
	group = augroup,
	pattern = { "markdown", "text", "gitcommit" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.linebreak = true
		vim.opt_local.spell = true
	end,
})

-- ============================================================================
-- PLUGINS (vim.pack)
-- ============================================================================
vim.pack.add({
  "https://www.github.com/lewis6991/gitsigns.nvim",
	"https://www.github.com/echasnovski/mini.nvim",
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
	},
	-- Language Server Protocols
	"https://www.github.com/neovim/nvim-lspconfig",
	{
		src = "https://github.com/saghen/blink.cmp",
		version = vim.version.range("1.*"),
	},
	"https://github.com/L3MON4D3/LuaSnip",
	-- Colorscheme
	"https://github.com/rose-pine/neovim",
	-- DAP
	"https://github.com/mfussenegger/nvim-dap",
	"https://github.com/rcarriga/nvim-dap-ui",
	"https://github.com/nvim-neotest/nvim-nio",
	"https://github.com/mfussenegger/nvim-dap-python",
})

local function packadd(name)
	vim.cmd("packadd " .. name)
end

packadd("gitsigns.nvim")
packadd("mini.nvim")
-- LSP
packadd("nvim-lspconfig")
packadd("blink.cmp")
packadd("LuaSnip")
-- Colorscheme
packadd("neovim")
-- DAP
packadd("nvim-dap")
packadd("nvim-dap-ui")
packadd("nvim-nio")
packadd("nvim-dap-python")

-- ============================================================================
-- COLORSCHEME
-- ============================================================================
require("rose-pine").setup({
	variant = "main", -- main | moon | dawn
	dark_variant = "main",
	styles = {
		bold = false,
		italic = false,
		transparency = true,
	},
})
vim.cmd("colorscheme rose-pine")

-- ============================================================================
-- PLUGIN CONFIGS
-- ============================================================================

local setup_treesitter = function()
	local treesitter = require("nvim-treesitter")
	treesitter.setup({})
	local ensure_installed = {
		"vim",
		"vimdoc",
		"c",
		"cpp",
		"html",
		"css",
		"javascript",
		"json",
		"lua",
		"markdown",
		"python",
		"typescript",
		"bash",
	}

	local config = require("nvim-treesitter.config")

	local already_installed = config.get_installed()
	local parsers_to_install = {}

	for _, parser in ipairs(ensure_installed) do
		if not vim.tbl_contains(already_installed, parser) then
			table.insert(parsers_to_install, parser)
		end
	end

	if #parsers_to_install > 0 then
		treesitter.install(parsers_to_install)
	end

	local group = vim.api.nvim_create_augroup("TreeSitterConfig", { clear = true })
	vim.api.nvim_create_autocmd("FileType", {
		group = group,
		callback = function(args)
			if vim.list_contains(treesitter.get_installed(), vim.treesitter.language.get_lang(args.match)) then
				vim.treesitter.start(args.buf)
			end
		end,
	})
end

setup_treesitter()



require("mini.pick").setup({})
require("mini.extra").setup({})
require("mini.statusline").setup({})
require("mini.files").setup({})

vim.keymap.set("n", "<leader>o", function() MiniFiles.open() end, { desc = "Open Mini Files" })
vim.keymap.set("n", "<leader>sf", function() MiniPick.builtin.files() end, { desc = "Pick Files" })
vim.keymap.set("n", "<leader>sg", function() MiniPick.builtin.grep_live() end, { desc = "Pick Live Grep" })
vim.keymap.set("n", "<leader>sb", function() MiniPick.builtin.buffers() end, { desc = "Pick Buffers" })
vim.keymap.set("n", "<leader>sh", function() MiniPick.builtin.help() end, { desc = "Pick Help Tags" })
vim.keymap.set("n", "<leader>so", function() MiniExtra.pickers.oldfiles() end, { desc = "Pick Old Files" })
vim.keymap.set("n", "<leader>sw", function()
	MiniPick.builtin.grep({ pattern = vim.fn.expand("<cword>") })
end, { desc = "Pick Grep Word" })
vim.keymap.set("n", "<leader>/", function() MiniExtra.pickers.buf_lines() end, { desc = "Pick Buffer Lines" })
vim.keymap.set("n", "<leader>sk", function() MiniExtra.pickers.keymaps() end, { desc = "Pick Keymaps" })
vim.keymap.set("n", "<leader>sd", function() MiniExtra.pickers.diagnostic() end, { desc = "Pick Diagnostics" })
vim.keymap.set("n", "<leader>sr", function() MiniPick.builtin.resume() end, { desc = "Pick Resume" })

require("mini.ai").setup({})
require("mini.move").setup({})
require("mini.surround").setup({})
require("mini.indentscope").setup({})
require("mini.pairs").setup({})
require("mini.icons").setup({})

require("gitsigns").setup({
  signs = {
    add          = { text = "+" },
    change       = { text = "~" },
    delete       = { text = "-" },
    topdelete    = { text = "-" },
    changedelete = { text = "~" },
    untracked    = { text = "+" },
  },
  signs_staged_enable = true,

  signcolumn = true,
  numhl      = false,
  
  on_attach = function(bufnr)
    -- Rosé Pine Palette
    local rp = {
      rose  = "#ebbcba", -- Red/Pink
      gold  = "#f6c177", -- Yellow
      pine  = "#31748f", -- Teal/Green
      iris  = "#c4a7e7", -- Purple (Our "Staged" color)
      muted = "#908caa", -- Gray
    }

    -- 1. Unstaged Highlights (Standard Rosé Pine)
    vim.api.nvim_set_hl(0, "GitSignsAdd",          { fg = rp.pine })
    vim.api.nvim_set_hl(0, "GitSignsChange",       { fg = rp.gold })
    vim.api.nvim_set_hl(0, "GitSignsDelete",       { fg = rp.rose })
    vim.api.nvim_set_hl(0, "GitSignsTopdelete",    { fg = rp.rose })
    vim.api.nvim_set_hl(0, "GitSignsChangedelete", { fg = rp.gold })
    vim.api.nvim_set_hl(0, "GitSignsUntracked",    { fg = rp.muted })

    -- 2. Staged Highlights (all iris/purple)
    local staged_groups = {
      "GitSignsStagedAdd",
      "GitSignsStagedChange",
      "GitSignsStagedDelete",
      "GitSignsStagedTopdelete",
      "GitSignsStagedChangedelete",
    }

    for _, group in ipairs(staged_groups) do
      vim.api.nvim_set_hl(0, group, { fg = rp.iris })
    end
  end,
})


vim.keymap.set("n", "]h", function()
	require("gitsigns").next_hunk()
end, { desc = "Next git hunk" })
vim.keymap.set("n", "[h", function()
	require("gitsigns").prev_hunk()
end, { desc = "Previous git hunk" })
vim.keymap.set("n", "<leader>hs", function()
	require("gitsigns").stage_hunk()
end, { desc = "Stage hunk" })
vim.keymap.set("n", "<leader>hr", function()
	require("gitsigns").reset_hunk()
end, { desc = "Reset hunk" })
vim.keymap.set("n", "<leader>hp", function()
	require("gitsigns").preview_hunk()
end, { desc = "Preview hunk" })
vim.keymap.set("n", "<leader>hb", function()
	require("gitsigns").blame_line({ full = true })
end, { desc = "Blame line" })
vim.keymap.set("n", "<leader>hB", function()
	require("gitsigns").toggle_current_line_blame()
end, { desc = "Toggle inline blame" })
vim.keymap.set("n", "<leader>hd", function()
	require("gitsigns").diffthis()
end, { desc = "Diff this" })

-- ============================================================================
-- LSP, Linting, Formatting & Completion
-- ============================================================================
local diagnostic_signs = {
	Error = " ",
	Warn = " ",
	Hint = "",
	Info = "",
}

vim.diagnostic.config({
	virtual_text = { prefix = "●", spacing = 4 },
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = diagnostic_signs.Error,
			[vim.diagnostic.severity.WARN] = diagnostic_signs.Warn,
			[vim.diagnostic.severity.INFO] = diagnostic_signs.Info,
			[vim.diagnostic.severity.HINT] = diagnostic_signs.Hint,
		},
	},
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = {
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
		focusable = false,
		style = "minimal",
	},
})

do
	local orig = vim.lsp.util.open_floating_preview
	function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
		opts = opts or {}
		opts.border = opts.border or "rounded"
		return orig(contents, syntax, opts, ...)
	end
end

local function lsp_on_attach(ev)
	local client = vim.lsp.get_client_by_id(ev.data.client_id)
	if not client then
		return
	end

	local bufnr = ev.buf
	local opts = { noremap = true, silent = true, buffer = bufnr }

	vim.keymap.set("n", "<leader>gd", function()
		require("mini.extra").pickers.lsp({ scope = "definition" })
	end, opts)

	vim.keymap.set("n", "<leader>gD", vim.lsp.buf.definition, opts)

	vim.keymap.set("n", "<leader>gS", function()
		vim.cmd("vsplit")
		vim.lsp.buf.definition()
	end, opts)

	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

	vim.keymap.set("n", "gL", function()
		vim.diagnostic.open_float({ scope = "line" })
	end, opts)
	vim.keymap.set("n", "gl", function()
		vim.diagnostic.open_float({ scope = "cursor" })
	end, opts)
	vim.keymap.set("n", "<leader>nd", function()
		vim.diagnostic.jump({ count = 1 })
	end, opts)

	vim.keymap.set("n", "<leader>pd", function()
		vim.diagnostic.jump({ count = -1 })
	end, opts)

	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

	vim.keymap.set("n", "<leader>sD", function()
		require("mini.extra").pickers.lsp({ scope = "definition" })
	end, opts)
	vim.keymap.set("n", "<leader>sR", function()
		require("mini.extra").pickers.lsp({ scope = "references" })
	end, opts)
	vim.keymap.set("n", "<leader>sT", function()
		require("mini.extra").pickers.lsp({ scope = "type_definition" })
	end, opts)
	vim.keymap.set("n", "<leader>sS", function()
		require("mini.extra").pickers.lsp({ scope = "document_symbol" })
	end, opts)
	vim.keymap.set("n", "<leader>sW", function()
		require("mini.extra").pickers.lsp({ scope = "workspace_symbol" })
	end, opts)
	vim.keymap.set("n", "<leader>sI", function()
		require("mini.extra").pickers.lsp({ scope = "implementation" })
	end, opts)

	if client:supports_method("textDocument/codeAction", bufnr) then
		vim.keymap.set("n", "<leader>oi", function()
			vim.lsp.buf.code_action({
				context = { only = { "source.organizeImports" }, diagnostics = {} },
				apply = true,
				bufnr = bufnr,
			})
			vim.defer_fn(function()
				vim.lsp.buf.format({ bufnr = bufnr })
			end, 50)
		end, opts)
	end
end

vim.api.nvim_create_autocmd("LspAttach", { group = augroup, callback = lsp_on_attach })

vim.keymap.set("n", "<leader>q", function()
	vim.diagnostic.setloclist({ open = true })
end, { desc = "Open diagnostic list" })
require("blink.cmp").setup({
	keymap = {
		preset = "none",
		["<C-Space>"] = { "show", "hide" },
		["<CR>"] = { "accept", "fallback" },
		["<C-j>"] = { "select_next", "fallback" },
		["<C-k>"] = { "select_prev", "fallback" },
		["<Tab>"] = { "select_and_accept", "snippet_forward", "fallback" },
		["<S-Tab>"] = { "snippet_backward", "fallback" },
	},
	appearance = { nerd_font_variant = "mono" },
	completion = { menu = { auto_show = true } },
	sources = { default = { "lsp", "path", "buffer", "snippets" } },
	snippets = {
		expand = function(snippet)
			require("luasnip").lsp_expand(snippet)
		end,
	},

	fuzzy = {
		implementation = "lua",
	},
})

vim.lsp.config["*"] = {
	capabilities = require("blink.cmp").get_lsp_capabilities(),
}

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = { globals = { "vim" } },
			telemetry = { enable = false },
		},
	},
})
vim.lsp.config("pyright", {})
vim.lsp.config("bashls", {})
vim.lsp.config("ts_ls", {})
vim.lsp.config("gopls", {})
vim.lsp.config("clangd", {})


vim.lsp.enable({
	"lua_ls",
	"pyright",
	"bashls",
	"ts_ls",
	"gopls",
	"clangd",
	"efm",
})

-- ============================================================================
-- DAP
-- ============================================================================
local dap = require('dap')
local dapui = require('dapui')

dapui.setup()

dap.listeners.after.event_initialized['dapui_config'] = function() dapui.open() end
dap.listeners.before.event_terminated['dapui_config'] = function() dapui.close() end
dap.listeners.before.event_exited['dapui_config']     = function() dapui.close() end

local debugpy_path = vim.fn.expand('~/.neovim-dap/bin/python')
if vim.fn.executable(debugpy_path) == 0 then
  debugpy_path = 'python3'
end
require('dap-python').setup(debugpy_path)

local function visualize_df()
  if not dap.session() then
    vim.notify('No active DAP session', vim.log.levels.WARN)
    return
  end

  local var_name = vim.fn.expand('<cexpr>')
  if var_name == '' then
    var_name = vim.fn.input('Variable name: ')
  end
  if var_name == '' then return end

  if not var_name:match("^[%w%.%_%[%]]+$") then
    vim.notify('Security: Invalid characters in variable name', vim.log.levels.ERROR)
    return
  end

  local tmp_file = vim.fn.tempname() .. '.csv'

  local python_script = string.format([[
def _nvim_export_csv(obj, path):
    try:
        import polars as pl
        if isinstance(obj, pl.DataFrame):
            obj.write_csv(path); return True
        if isinstance(obj, pl.Series):
            obj.to_frame().write_csv(path); return True
    except (ImportError, Exception): pass
    try:
        import pandas as pd
        if isinstance(obj, pd.DataFrame):
            obj.to_csv(path, index=False); return True
        if isinstance(obj, pd.Series):
            obj.to_frame().to_csv(path, index=True); return True
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
          local v_type = res and res.result or 'Unknown'
          vim.notify(('Variable is %s, not a supported DataFrame/Series'):format(v_type), vim.log.levels.WARN)
        end)
        return
      end
      local buf = vim.api.nvim_create_buf(false, true)
      local win = vim.api.nvim_open_win(buf, true, {
        relative  = 'editor',
        width     = math.floor(vim.o.columns * 0.9),
        height    = math.floor(vim.o.lines * 0.9),
        row       = math.floor(vim.o.lines * 0.05),
        col       = math.floor(vim.o.columns * 0.05),
        style     = 'minimal',
        border    = 'rounded',
        title     = ' Data Inspector: ' .. var_name .. ' ',
        title_pos = 'center',
      })
      vim.fn.termopen({ 'vd', tmp_file }, {
        on_exit = function()
          if vim.api.nvim_win_is_valid(win) then
            vim.api.nvim_win_close(win, true)
          end
          os.remove(tmp_file)
        end,
      })
      vim.cmd('startinsert')
    end, 20)
  end)
end

local function open_float(id)
  dapui.float_element(id, {
    width    = math.floor(vim.o.columns * 0.80),
    height   = math.floor(vim.o.lines * 0.75),
    enter    = true,
    position = 'center',
  })
end

local map = vim.keymap.set
map('n', '<leader>db', dap.toggle_breakpoint,                              { desc = 'Debug: Breakpoint' })
map('n', '<leader>dc', dap.continue,                                       { desc = 'Debug: Continue' })
map('n', '<leader>dt', dap.terminate,                                      { desc = 'Debug: Terminate' })
map('n', '<leader>di', dap.step_into,                                      { desc = 'Debug: Step Into' })
map('n', '<leader>do', dap.step_over,                                      { desc = 'Debug: Step Over' })
map('n', '<leader>dr', function() require('dap-python').test_method() end, { desc = 'Debug: Run Test' })
map('n', '<leader>de', function() dapui.eval(nil, { enter = true }) end,   { desc = 'Debug: Eval' })
map('v', '<leader>de', function() dapui.eval(nil, { enter = true }) end,   { desc = 'Debug: Eval selection' })
map('n', '<leader>dv', visualize_df,                                       { desc = 'Debug: VisiData Inspector' })
map('n', '<leader>d1', function() open_float('scopes') end,                { desc = 'Debug: Scopes' })
map('n', '<leader>d2', function() open_float('stacks') end,                { desc = 'Debug: Stacks' })
map('n', '<leader>d3', function() open_float('breakpoints') end,           { desc = 'Debug: Breakpoints' })
map('n', '<leader>d4', function() open_float('console') end,               { desc = 'Debug: Console' })
map('n', '<leader>d5', function() open_float('repl') end,                  { desc = 'Debug: REPL' })

vim.api.nvim_set_hl(0, 'DapStopped', { fg = '#98bb6c', bold = true })
