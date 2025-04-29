return {
	{
		"stevearc/oil.nvim",
		opts = {
			view_options = {
				show_hidden = true,
			},
		},
		dependencies = { { "echasnovski/mini.icons", opts = {} } },
	},
	vim.keymap.set("n", "<leader>e", "<cmd>Oil<CR>"),
}
