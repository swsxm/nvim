return {
	{
		"stevearc/oil.nvim",
		opts = {
			view_options = {
				show_hidden = true,
			},
			columns = {
				"icon",
				"permissions",
				"size",
				"mtime",
			},
			format_mtime = "%Y-%m-%d %H:%M",
		},
		dependencies = {
			{ "echasnovski/mini.icons", opts = {} },
		},
	},
	vim.keymap.set("n", "<leader>e", "<cmd>Oil<CR>"),
}
